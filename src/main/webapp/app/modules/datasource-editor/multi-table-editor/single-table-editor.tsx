import React, {useEffect, useRef, useState} from "react";
import DataGrid, {Column} from 'devextreme-react/data-grid';
import {ICategory} from "app/shared/model/category.model";
import Accordion from '@mui/material/Accordion';
import AccordionSummary from '@mui/material/AccordionSummary';
import AccordionDetails from '@mui/material/AccordionDetails';
import Typography from '@mui/material/Typography';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
import {translate} from 'react-jhipster';
import {useAppDispatch, useAppSelector} from "app/config/store";
import {getDxColumnConfig} from "app/modules/datasource-editor/multi-table-editor/dx-component/dx-column-config";
import {
  getOriginRow,
  reset as resetDatasourceStatus,
  setCategory as setSelectedCategory,
  setValidateFailedItems
} from "app/modules/datasource-editor/reducer/datasource.status.reducer";
import Button from '@mui/material/Button';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {
  createDatasourceRow,
  deleteDatasourceRow,
  resetFlag,
  updateDatasourceRow
} from "app/modules/datasource-editor/reducer/datasource.container.reducer";
import {IPatient} from "app/shared/model/patient.model";
import {
  ActionType,
  makeCallBackOnPromise,
  onRowRemoving,
  onRowValidating,
  toastApiResult
} from "app/modules/datasource-editor/multi-table-editor/single-table-editor.utils";
import {hasAnyAuthority} from "app/shared/auth/private-route";
import {AUTHORITIES} from "app/config/constants";


export interface ISingleTableEditor {
  category: ICategory;
}

export const getCategoryTypography = (category: ICategory) => {
  return <Typography>{`${category.property ? category.property?.caption + ' - ' : ''} ${category.title.toUpperCase()} `}</Typography>
}

export const SingleTableEditor = (props: ISingleTableEditor) => {
  const dispatch = useAppDispatch();
  const dataGrid = useRef(null);

  const [editedRow, setEditedRow] = useState(null);
  const [actionType, setActionType] = useState(null);

  const patient = useAppSelector<IPatient>(state => state.datasourcePatient.entity);
  const dataSourceContainer = useAppSelector(state => state.datasourceContainer.dataSource.container);
  const itemContainer = useAppSelector(state => state.datasourceContainer.item.container);
  const updateSuccess = useAppSelector(state => state.datasourceContainer.updateSuccess);
  const login = useAppSelector(state => state.authentication.account.login);
  const isManager = useAppSelector(state => hasAnyAuthority(state.authentication.account.authorities, [AUTHORITIES.ADMIN, AUTHORITIES.SUPERVISOR]));
  const selectedCategory = useAppSelector(state => state.datasourceStatus.selected.category);

  const {category} = props;

  useEffect(() => {
    if (updateSuccess && selectedCategory && category.id === selectedCategory.id) {
      toastApiResult(actionType, {table: category.title.toUpperCase(), row: editedRow ? editedRow.idx : null});
    }
  }, [updateSuccess]);

  // useEffect(() => {
  //   dispatch(resetDatasourceStatus());
  // }, [actionType]);

  const canRender: () => boolean = () => category && itemContainer && itemContainer[category.id] && dataSourceContainer && dataSourceContainer[category.id];

  return canRender() ? (
    <Accordion defaultExpanded={true} className={"single-table-editor-wrapper"}>
      <AccordionSummary
        expandIcon={<ExpandMoreIcon/>}
        aria-controls="panel1a-content"
        id="panel1a-header"
      >
        {getCategoryTypography(category)}
        <Button variant="text" onClick={(e) => {
          e.stopPropagation();
          dataGrid.current.instance.addRow()
        }}>
          <FontAwesomeIcon icon="plus"/>
        </Button>
      </AccordionSummary>
      <AccordionDetails sx={{padding: "8px 0"}}>
        <DataGrid
          ref={dataGrid}
          dataSource={JSON.parse(JSON.stringify(dataSourceContainer[category.id]))}
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
          onInitNewRow={(e) => makeCallBackOnPromise(e, () => {
            dispatch(setSelectedCategory(category));
            setActionType(ActionType.CREATE);
          })}
          onEditingStart={(e) => {
            dispatch(setSelectedCategory(category));
            setActionType(ActionType.UPDATE);
            setEditedRow(e.data);

            if (!e.data['idx'].includes('KCURE')) {
              dispatch(getOriginRow({categoryId: category.id, rowId: e.data.idx}));
            }
          }}
          onRowInserting={(e) => makeCallBackOnPromise(e, () => {
            const row = Object.assign({}, e.data, {'pt_no': patient.ptNo});
            dispatch(createDatasourceRow({categoryId: category.id, row}));
          })}
          onRowUpdating={(e) => makeCallBackOnPromise(e, () => {
            const row = Object.assign({}, e.oldData, e.newData);
            dispatch(updateDatasourceRow({categoryId: category.id, row}));
          })}
          onRowRemoving={(e) => {
            const canManaging = e.data.idx.includes('KCURE') && (isManager || e.data['created_by'] === login);
            onRowRemoving(e, {canManaging, category},
              () => {
                setActionType(ActionType.DELETE);
                dispatch(setSelectedCategory(category));
                setEditedRow(e.data);
              }, (value) => {
                dispatch(deleteDatasourceRow(value))
              })
          }}
          scrolling={{mode: 'standard', showScrollbar: 'onHover'}}
          paging={{pageSize: 10}}
          onEditCanceled={() => dispatch(resetDatasourceStatus())}
          onSaved={() => {
            dispatch(resetFlag());
            dispatch(resetDatasourceStatus())
          }}
          columnAutoWidth={true}
          onRowValidating={(e) => onRowValidating(e, {
              category,
              itemContainer
            }, (value) => dispatch(setValidateFailedItems(value))
          )}
        >
          {
            itemContainer[category.id].map(item => getDxColumnConfig(item))
          }
          <Column dataField="last_modified_by"
                  caption={translate('cancerLibraryApp.datasource.column.lastModifiedBy')}
                  alignment={"center"} allowEditing={false}
                  visibleIndex={9998}/>
          <Column dataField="last_modified_date"
                  caption={translate('cancerLibraryApp.datasource.column.lastModifiedDate')}
                  alignment={"center"} dataType={"datetime"} format={"yy/MM/dd hh:mm"} allowEditing={false}
                  visibleIndex={9999}/>
        </DataGrid>
      </AccordionDetails>
    </Accordion>

  ) : null;
}

export default SingleTableEditor;
