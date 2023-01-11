import React, {useEffect, useRef, useState} from 'react';
import DataGrid, {Button as DxButton, Column, ColumnChooser, Editing, Popup} from 'devextreme-react/data-grid';
import {ICategory} from 'app/shared/model/category.model';
import Accordion from '@mui/material/Accordion';
import AccordionDetails from '@mui/material/AccordionDetails';
import Typography from '@mui/material/Typography';
import {translate} from 'react-jhipster';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {getDxColumnConfig} from 'app/modules/datasource-editor/multi-table-editor/dx-component/dx-column-config';
import {
  getOriginRow,
  reset as resetDatasourceStatusReducer,
  setCategory as setSelectedCategory,
  setRow as setSelectedRow,
  setValidateFailedItems,
} from 'app/modules/datasource-editor/reducer/datasource.status.reducer';


import {
  deleteDatasourceRow,
  resetFlag as resetDatasourceContainerFlag,
} from 'app/modules/datasource-editor/reducer/datasource.container.reducer';
import {IPatient} from 'app/shared/model/patient.model';
import {
  onRowValidating,
} from 'app/modules/datasource-editor/multi-table-editor/single-table-editor/utils/single-table-editor.validating.utils';
import {
  DATASOURCE_IDX,
  DATASOURCE_ROW_STATUS,
  KCURE_PREFIX,
  PATIENT_NO,
  RowStatus
} from 'app/config/datasource-constants';
import {getIndexColumnTemplate} from "app/shared/util/dx-utils";
import DxRowConfirmCellRender
  from "app/modules/datasource-editor/multi-table-editor/single-table-editor/component/dx-row-confirm-cell-render";
import {
  SingleTableEditorAccordionSummary
} from "app/modules/datasource-editor/multi-table-editor/single-table-editor/component/single-table-editor-accordion-summary";
import {RowCommentPopup} from "app/modules/row-comment-editor/row-comment-popup";
import {
  getCustomizeRowStatusText,
  transformAsCompleted,
  transformAsInProgress,
  transformAsRejected
} from "app/modules/datasource-editor/multi-table-editor/single-table-editor/utils/single-table-editor.status.utils";
import "./single-table-editor.scss";
import {hasAnyAuthority} from "app/shared/auth/private-route";
import {AUTHORITIES} from "app/config/constants";
import {canEditDatasource} from "app/modules/datasource-editor/stack-button/datasource.editchecker.utils";
import SingleTableEditorOnInitNewRow
  from "app/modules/datasource-editor/multi-table-editor/single-table-editor/utils/single-table-editor.init-new-row.utils";
import SingleTableEditorRowUpdatingUtils
  from "app/modules/datasource-editor/multi-table-editor/single-table-editor/utils/single-table-editor.row-updating.utils";
import SingleTableEditorRowInsertingUtils
  from "app/modules/datasource-editor/multi-table-editor/single-table-editor/utils/single-table-editor.row-inserting.utils";


export enum ActionType {
  CREATE = 'create',
  UPDATE = 'update',
  DELETE = 'delete'
}

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

  const [accordionExpanded, setAccordionExpanded] = useState(true);

  const patient = useAppSelector<IPatient>(state => state.datasourcePatient.entity);
  const dataContainer = useAppSelector(state => state.datasourceContainer.dataContainer);
  const itemContainer = useAppSelector(state => state.datasourceContainer.itemContainer);
  const updateSuccess = useAppSelector(state => state.datasourceContainer.updateSuccess);
  const selectedCategory = useAppSelector(state => state.datasourceStatus.selected.category);
  const openAll = useAppSelector(state => state.datasourceStatus.openAll);
  const login = useAppSelector(state => state.authentication.account.login);

  const isSudoUser = useAppSelector(state =>
    hasAnyAuthority(state.authentication.account.authorities, [AUTHORITIES.ADMIN, AUTHORITIES.SUPERVISOR])
  );

  const rowCommentPopupRef = useRef(null);

  const {category} = props;

  useEffect(() => {
    if (updateSuccess && selectedCategory && category.id === selectedCategory.id) {
      dispatch(resetDatasourceStatusReducer());
      dispatch(resetDatasourceContainerFlag());
    }
  }, [updateSuccess]);

  useEffect(() => {
    setAccordionExpanded(openAll);
  }, [openAll]);

  const canRender: () => boolean = () =>
    category && itemContainer && itemContainer[category.id] && dataContainer && dataContainer[category.id];

  const getFilterValue = () => {
    const filter: any[] = [['status', '<>', RowStatus.DISABLED], 'and'];

    if (category.attribute.dateColumn) {
      filter.push([category.attribute.dateColumn, '>=', new Date(patient.fsrMedDt)]);
    }

    return filter;
  }


  const getCustomEditing = () => {
    return <Editing mode={'popup'} allowUpdating allowDeleting form={{colCountByScreen: {xs: 1, sm: 1, md: 1, lg: 5}}}>
      <Popup resizeEnabled={true} toolbarItems={[
        {
          location: 'after',
          toolbar: 'bottom',
          widget: 'dxButton',
          options: {
            visible: isSudoUser,
            icon: 'revert',
            text: translate('cancerLibraryApp.singleTableEditor.editForm.button.rejected'),
            onClick(e) {
              const row = dataGrid.current.instance.getVisibleRows().find(temp => temp.isEditing).data;
              transformAsRejected(dispatch, category, row);
              dataGrid.current.instance.cancelEditData();
            },
          },
        },
        {
          location: 'after',
          toolbar: 'bottom',
          widget: 'dxButton',
          options: {
            visible: isSudoUser || canEditDatasource(patient),
            icon: 'check',
            text: translate('cancerLibraryApp.singleTableEditor.editForm.button.pause'),
            onClick(e) {
              const row = dataGrid.current.instance.getVisibleRows().find(temp => temp.isEditing).data;
              row[PATIENT_NO] = patient.ptNo;
              transformAsInProgress(dispatch, category, row);
              dataGrid.current.instance.cancelEditData();
            },
          },
        },
        {
          location: 'after',
          toolbar: 'bottom',
          widget: 'dxButton',
          options: {
            visible: isSudoUser || canEditDatasource(patient),
            icon: 'save',
            text: translate('cancerLibraryApp.singleTableEditor.editForm.button.save'),
            onClick() {
              dataGrid.current.instance.saveEditData();
            }
          }
        },
        {
          location: 'after',
          toolbar: 'bottom',
          widget: 'dxButton',
          options: {
            text: translate('cancerLibraryApp.singleTableEditor.editForm.button.cancel'),
            onClick() {
              dataGrid.current.instance.cancelEditData();
            }
          }
        }
      ]}>

      </Popup>
    </Editing>
  }

  return canRender() ? (
    <Accordion defaultExpanded={openAll} expanded={accordionExpanded} className={'single-table-editor-wrapper'}>
      <SingleTableEditorAccordionSummary category={category} dataGrid={dataGrid}
                                         accordionExpanded={accordionExpanded}
                                         setAccordionExpanded={setAccordionExpanded}/>
      <AccordionDetails sx={{padding: '8px 0'}}>
        <DataGrid
          ref={dataGrid}
          dataSource={JSON.parse(JSON.stringify(dataContainer[category.id]))}
          hoverStateEnabled={true}
          showBorders={true}
          // filterRow={{visible: true}}
          pager={{displayMode: 'compact', showNavigationButtons: true}}
          allowColumnReordering={true}
          allowColumnResizing={true}
          columnResizingMode={'widget'}
          sorting={{mode: 'multiple'}}
          selection={{mode: 'multiple', selectAllMode: 'page', showCheckBoxesMode: 'always'}}
          filterPanel={{visible: true}}
          defaultFilterValue={getFilterValue()}
          headerFilter={{allowSearch: true, visible: true}}
          onInitNewRow={e => SingleTableEditorOnInitNewRow({
            e,
            dispatch,
            dataGridRef: dataGrid,
            category,
            setActionType
          })}
          onEditingStart={e => {
            dispatch(setSelectedCategory(category));
            setActionType(ActionType.UPDATE);
            setEditedRow(e.data);

            if (!e.data[DATASOURCE_IDX].includes(KCURE_PREFIX)) {
              dispatch(getOriginRow({categoryId: category.id, rowId: e.data.idx}));
            }
          }}
          onRowInserting={e => SingleTableEditorRowInsertingUtils({e, dispatch, category, patient})}
          onRowUpdating={e => SingleTableEditorRowUpdatingUtils({e, dispatch, category, patient})}
          onRowRemoving={e => {
            setActionType(ActionType.DELETE);
            dispatch(setSelectedCategory(category));
            setEditedRow(e.data);
            const row = Object.assign({}, e.data);
            dispatch(deleteDatasourceRow({categoryId: category.id, row}));
          }}
          scrolling={{mode: 'standard', showScrollbar: 'always', useNative: true}}
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
            if (e.changes.length === 0 && editedRow.status !== RowStatus.COMPLETED) {
              transformAsCompleted(dispatch, category, editedRow);
            } else if (e.changes.length === 0) {
              dispatch(resetDatasourceStatusReducer());
              dispatch(resetDatasourceContainerFlag())
            }
          }}
        >
          {getCustomEditing()}
          <ColumnChooser
            title={translate('cancerLibraryApp.singleTableEditor.columnList')}
            mode="select"
            allowSearch={true}
            height={500}
          />
          <Column caption={'#'} cellTemplate={getIndexColumnTemplate} alignment={'center'} width={40}
                  allowEditing={false}
                  formItem={{visible: false}}
                  visibleIndex={1}
          />
          <Column caption={translate('cancerLibraryApp.singleTableEditor.status')}
                  visibleIndex={2}
                  width={90} alignment={"center"}
                  formItem={{visible: false}}
                  cellRender={(data) => <DxRowConfirmCellRender category={category}
                                                                row={data.row.data}
                                                                setEditorStatus={() => {
                                                                  setActionType(ActionType.UPDATE);
                                                                  setEditedRow(data.row.data);
                                                                  dispatch(setSelectedCategory(category));
                                                                }}/>}/>
          <Column dataField={DATASOURCE_ROW_STATUS} alignment={"center"} formItem={{visible: false}}
                  visibleIndex={3}
                  customizeText={getCustomizeRowStatusText}
          />
          <Column
            caption={translate('cancerLibraryApp.singleTableEditor.isNew')}
            dataField={DATASOURCE_IDX}
            alignment={"center"} formItem={{visible: false}}
            visibleIndex={4}
            customizeText={(cellInfo) => cellInfo.value?.indexOf(KCURE_PREFIX) === 0 ? 'Y' : 'N'}
          />
          <Column type="buttons" width={90} visibleIndex={5} alignment={"center"}
                  caption={translate('cancerLibraryApp.singleTableEditor.editRow')}>
            <DxButton name="comment" icon="comment"
                      hint={translate('cancerLibraryApp.singleTableEditor.editForm.button.rejected')}
                      onClick={(e) => {
                        dispatch(setSelectedCategory(category));
                        dispatch(setSelectedRow(e.row.data));
                        rowCommentPopupRef.current.setPopupVisible(true);
                      }}/>
            <DxButton name="delete"
                      visible={(e) => {
                        if (e.row.data.idx?.includes(KCURE_PREFIX)) {
                          return e.row.data['created_by'] === login || isSudoUser;
                        } else {
                          return true;
                        }
                      }}
            />
          </Column>
          {itemContainer[category.id].map(item => getDxColumnConfig(item))}
          <Column
            dataField="last_modified_by"
            caption={translate('cancerLibraryApp.datasource.column.lastModifiedBy')}
            alignment={'center'}
            allowEditing={false}
            visibleIndex={9999997}
            formItem={{visible: actionType === ActionType.UPDATE, visibleIndex: 9999998}}
          />
          <Column
            dataField="last_modified_date"
            caption={translate('cancerLibraryApp.datasource.column.lastModifiedDate')}
            alignment={'center'}
            dataType={'datetime'}
            format={'yy/MM/dd hh:mm'}
            allowEditing={false}
            visibleIndex={9999998}
            formItem={{visible: actionType === ActionType.UPDATE, visibleIndex: 9999999}}
          />
        </DataGrid>
      </AccordionDetails>
      <RowCommentPopup ref={rowCommentPopupRef}/>
    </Accordion>
  ) : null;
};

export default SingleTableEditor;
