import React, {useEffect, useRef, useState} from 'react';
import DataGrid, {Column} from 'devextreme-react/data-grid';
import {ICategory} from 'app/shared/model/category.model';
import Accordion from '@mui/material/Accordion';
import AccordionSummary from '@mui/material/AccordionSummary';
import AccordionDetails from '@mui/material/AccordionDetails';
import Typography from '@mui/material/Typography';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
import {translate} from 'react-jhipster';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {getDxColumnConfig} from 'app/modules/datasource-editor/multi-table-editor/dx-component/dx-column-config';
import {
  getOriginRow,
  reset as resetDatasourceStatusReducer,
  setCategory as setSelectedCategory,
  setValidateFailedItems,
} from 'app/modules/datasource-editor/reducer/datasource.status.reducer';
import Button from '@mui/material/Button';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';

import {
  createDatasourceRow,
  deleteDatasourceRow,
  resetFlag as resetDatasourceContainerFlag,
  updateDatasourceRow,
} from 'app/modules/datasource-editor/reducer/datasource.container.reducer';
import {IPatient} from 'app/shared/model/patient.model';
import {
  ActionType,
  makeCallBackOnPromise,
  onRowRemoving,
  onRowValidating,
  toastApiResult,
} from 'app/modules/datasource-editor/multi-table-editor/single-table-editor.utils';
import {hasAnyAuthority} from 'app/shared/auth/private-route';
import {AUTHORITIES} from 'app/config/constants';
import Stack from '@mui/material/Stack';
import {DATASOURCE_IDX, KCURE_PREFIX, PATIENT_NO} from 'app/config/datasource-constants';
import axios from 'axios';
import {getIndexColumnTemplate} from "app/shared/util/dx-utils";

export interface ISingleTableEditor {
  category: ICategory;
}

export const getCategoryTypography = (category: ICategory) => {
  return <Typography>{`${category.attribute ? category.attribute?.caption + ' - ' : ''} ${category.title.toUpperCase()} `}</Typography>;
};

export const SingleTableEditor = (props: ISingleTableEditor) => {
  const dispatch = useAppDispatch();
  const dataGrid = useRef(null);

  const [editedRow, setEditedRow] = useState(null);
  const [actionType, setActionType] = useState(null);

  const patient = useAppSelector<IPatient>(state => state.datasourcePatient.entity);
  const rawDataContainer = useAppSelector(state => state.datasourceContainer.rawData.container);
  const itemContainer = useAppSelector(state => state.datasourceContainer.item.container);
  const updateSuccess = useAppSelector(state => state.datasourceContainer.updateSuccess);
  const login = useAppSelector(state => state.authentication.account.login);
  const isManager = useAppSelector(state =>
    hasAnyAuthority(state.authentication.account.authorities, [AUTHORITIES.ADMIN, AUTHORITIES.SUPERVISOR])
  );
  const selectedCategory = useAppSelector(state => state.datasourceStatus.selected.category);

  const {category} = props;

  useEffect(() => {
    if (updateSuccess && selectedCategory && category.id === selectedCategory.id) {
      toastApiResult(actionType, {table: category.title.toUpperCase(), row: editedRow ? editedRow.idx : null});
      dispatch(resetDatasourceStatusReducer());
      dispatch(resetDatasourceContainerFlag());
    }
  }, [updateSuccess]);

  const canRender: () => boolean = () =>
    category && itemContainer && itemContainer[category.id] && rawDataContainer && rawDataContainer[category.id];

  function buttonCellRender(data) {
    const row = data.row.data;
    const rowIndex = data.rowIndex;

    if (!row || !row.idx) {
      return null;
    }

    const canManaging = row.idx.includes(KCURE_PREFIX) && (isManager || row['created_by'] === login);

    return (
      <Stack spacing={1} direction="row">
        <Button variant="text" style={{maxHeight: '30px', minHeight: '30px'}}
                onClick={() => dataGrid.current.instance.editRow(rowIndex)}>
          <FontAwesomeIcon icon="pencil"/>
        </Button>
        {canManaging && (
          <Button
            variant="text"
            style={{maxWidth: '30px', maxHeight: '30px', minWidth: '30px', minHeight: '30px'}}
            onClick={() => dataGrid.current.instance.deleteRow(rowIndex)}
          >
            <FontAwesomeIcon icon="trash"/>
          </Button>
        )}
      </Stack>
    );
  }

  return canRender() ? (
    <Accordion defaultExpanded={true} className={'single-table-editor-wrapper'}>
      <AccordionSummary expandIcon={<ExpandMoreIcon/>} aria-controls="panel1a-content" id="panel1a-header">
        {getCategoryTypography(category)}
        <Button
          variant="outlined"
          className={'me-2'}
          size={'small'}
          color="warning"
          onClick={e => {
            e.stopPropagation();
            dataGrid.current.instance.addRow();
          }}
        >
          <FontAwesomeIcon icon="plus" className={'me-3'}/>
          {translate('cancerLibraryApp.datasourceEditor.singleTableEditor.addRow')}
        </Button>
      </AccordionSummary>
      <AccordionDetails sx={{padding: '8px 0'}}>
        <DataGrid
          ref={dataGrid}
          dataSource={JSON.parse(JSON.stringify(rawDataContainer[category.id]))}
          hoverStateEnabled={true}
          showBorders={true}
          filterRow={{visible: false}}
          headerFilter={{visible: true}}
          allowColumnResizing={true}
          pager={{displayMode: 'compact', showNavigationButtons: true}}
          editing={{
            mode: 'popup',
            allowUpdating: true,
            allowDeleting: true,
            form: {colCount: 3},
            texts: {
              confirmDeleteMessage: translate('entity.delete.warning'),
            },
          }}
          onInitNewRow={e =>
            makeCallBackOnPromise(e, () => {
              dispatch(setSelectedCategory(category));
              setActionType(ActionType.CREATE);
            })
          }
          onEditingStart={e => {
            dispatch(setSelectedCategory(category));
            setActionType(ActionType.UPDATE);
            setEditedRow(e.data);

            if (!e.data[DATASOURCE_IDX].includes(KCURE_PREFIX)) {
              dispatch(getOriginRow({categoryId: category.id, rowId: e.data.idx}));
            }
          }}
          onRowInserting={e =>
            makeCallBackOnPromise(e, () => {
              const row = Object.assign({}, e.data, {[PATIENT_NO]: patient.ptNo});
              dispatch(createDatasourceRow({categoryId: category.id, row}));
            })
          }
          onRowUpdating={e =>
            makeCallBackOnPromise(e, () => {
              axios.get(`/api/datasource/categories/${category.id}/rows/${e.oldData.idx}/check-updated-row-exist`).then(({data}) => {
                if (data) {
                  const row = Object.assign(
                    {},
                    {
                      [DATASOURCE_IDX]: e.oldData.idx,
                      [PATIENT_NO]: patient.ptNo,
                    },
                    e.newData
                  );
                  dispatch(updateDatasourceRow({categoryId: category.id, row}));
                } else {
                  const row = Object.assign({}, e.oldData, e.newData);
                  dispatch(createDatasourceRow({categoryId: category.id, row}));
                }
              });
            })
          }
          onRowRemoving={e =>
            onRowRemoving(
              e,
              category,
              () => {
                setActionType(ActionType.DELETE);
                dispatch(setSelectedCategory(category));
                setEditedRow(e.data);
              },
              value => {
                dispatch(deleteDatasourceRow(value));
              }
            )
          }
          scrolling={{mode: 'standard', showScrollbar: 'always'}}
          paging={{pageSize: 10}}
          onEditCanceled={() => dispatch(resetDatasourceStatusReducer())}
          columnAutoWidth={true}
          onRowValidating={e =>
            onRowValidating(
              e,
              {
                category,
                itemContainer,
              },
              value => dispatch(setValidateFailedItems(value))
            )
          }
          onRowDblClick={e => dataGrid.current.instance.editRow(e.rowIndex)}
          onSaved={e => {
            if (e.changes.length === 0) {
              dispatch(resetDatasourceStatusReducer());
              dispatch(resetDatasourceContainerFlag());
            }
          }}
        >
          <Column type="buttons" width={80} cellRender={buttonCellRender}/>
          <Column caption={'#'} cellTemplate={getIndexColumnTemplate} alignment={'center'} width={80}
                  allowEditing={false}
                  formItem={{visible: false}}/>
          {itemContainer[category.id].map(item => getDxColumnConfig(item))}
          <Column
            dataField="last_modified_by"
            caption={translate('cancerLibraryApp.datasourceEditor.column.lastModifiedBy')}
            alignment={'center'}
            allowEditing={false}
            visibleIndex={9999998}
            formItem={{visible: actionType === ActionType.UPDATE, visibleIndex: 9999998}}
          />
          <Column
            dataField="last_modified_date"
            caption={translate('cancerLibraryApp.datasourceEditor.column.lastModifiedDate')}
            alignment={'center'}
            dataType={'datetime'}
            format={'yy/MM/dd hh:mm'}
            allowEditing={false}
            visibleIndex={9999999}
            formItem={{visible: actionType === ActionType.UPDATE, visibleIndex: 9999999}}
          />
        </DataGrid>
      </AccordionDetails>
    </Accordion>
  ) : null;
};

export default SingleTableEditor;
