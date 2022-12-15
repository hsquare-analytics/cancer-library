import React, {useEffect, useRef, useState} from 'react';
import DataGrid, {Button as DxButton, Column, ColumnChooser} from 'devextreme-react/data-grid';
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
import Swal from 'sweetalert2';


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
  onRowValidating,
  toastApiResult,
} from 'app/modules/datasource-editor/multi-table-editor/single-table-editor/single-table-editor.utils';
import {
  DATASOURCE_IDX,
  DATASOURCE_ROW_STATUS,
  KCURE_PREFIX,
  PATIENT_NO,
  RowStatus
} from 'app/config/datasource-constants';
import axios from 'axios';
import {getIndexColumnTemplate} from "app/shared/util/dx-utils";
import DxRowConfirmCellRender
  from "app/modules/datasource-editor/multi-table-editor/single-table-editor/dx-row-confirm-cell-render";
import {
  SingleTableEditorAccordionSummary
} from "app/modules/datasource-editor/multi-table-editor/single-table-editor/single-table-editor-accordion-summary";
import {RowCommentPopup} from "app/modules/row-comment-editor/row-comment-popup";

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

  const rowCommentPopupRef = useRef(null);

  const {category} = props;

  useEffect(() => {
    if (updateSuccess && selectedCategory && category.id === selectedCategory.id) {
      toastApiResult(actionType, {table: category.title.toUpperCase(), row: editedRow ? editedRow.idx : null});
      dispatch(resetDatasourceStatusReducer());
      dispatch(resetDatasourceContainerFlag());
    }
  }, [updateSuccess]);

  useEffect(() => {
    setAccordionExpanded(openAll);
  }, [openAll]);

  const canRender: () => boolean = () =>
    category && itemContainer && itemContainer[category.id] && dataContainer && dataContainer[category.id];

  const transformAsCompleted = (row: any) => {
    Swal.fire({
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: translate('cancerLibraryApp.datasourceEditor.singleTableEditor.rowStatus.button.confirm'),
        cancelButtonText: translate('cancerLibraryApp.datasourceEditor.singleTableEditor.rowStatus.button.cancel'),
        text: translate('cancerLibraryApp.datasourceEditor.singleTableEditor.transformAsCompleted.title')
      }
    ).then((result) => {
      if (result.isConfirmed) {
        axios.get(`/api/datasource/categories/${category.id}/rows/${row.idx}/check-updated-row-exist`).then(({data}) => {
          const payload = {
            categoryId: category.id,
            row: {
              ...row,
              [DATASOURCE_ROW_STATUS]: RowStatus.COMPLETED
            }
          }

          if (data) {
            dispatch(updateDatasourceRow(payload));
          } else {
            dispatch(createDatasourceRow(payload));
          }
        });
      }
    });
  }

  const getDefaultFilter = () => {
    const filter: any[] = [['status', '<>', RowStatus.DISABLED], 'and'];

    if (category.attribute.dateColumn) {
      filter.push([category.attribute.dateColumn, '>=', new Date(patient.fsrMedDt)]);
    }

    return filter;
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
          defaultFilterValue={getDefaultFilter()}
          headerFilter={{allowSearch: true, visible: true}}
          editing={{
            mode: 'popup',
            popup: {
              resizeEnabled: true,
            },
            allowUpdating: true,
            allowDeleting: true,
            form: {
              colCountByScreen: {
                xs: 1,
                sm: 1,
                md: 1,
                lg: 5,
              },
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
              const row = Object.assign({}, e.data, {
                  [PATIENT_NO]: patient.ptNo,
                  [DATASOURCE_ROW_STATUS]: RowStatus.IN_PROGRESS
                }
              );
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
                      [DATASOURCE_ROW_STATUS]: RowStatus.IN_PROGRESS
                    },
                    e.newData
                  );
                  dispatch(updateDatasourceRow({categoryId: category.id, row}));
                } else {
                  const row = Object.assign({}, e.oldData, e.newData, {
                    [DATASOURCE_ROW_STATUS]: RowStatus.IN_PROGRESS
                  });
                  dispatch(createDatasourceRow({categoryId: category.id, row}));
                }
              });
            })
          }
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
              transformAsCompleted(editedRow);
            } else if (e.changes.length === 0) {
              dispatch(resetDatasourceStatusReducer());
              dispatch(resetDatasourceContainerFlag())
            }
          }}
        >
          <ColumnChooser
            title={translate('cancerLibraryApp.datasourceEditor.singleTableEditor.columnList')}
            mode="select"
            allowSearch={true}
            sortOrder={'asc'}
            height={500}
          />
          <Column caption={'#'} cellTemplate={getIndexColumnTemplate} alignment={'center'} width={80}
                  allowEditing={false}
                  formItem={{visible: false}}/>
          <Column caption={translate('cancerLibraryApp.datasourceEditor.singleTableEditor.status')}
                  width={130} alignment={"center"}
                  formItem={{visible: false}}
                  cellRender={(data) => <DxRowConfirmCellRender category={category}
                                                                row={data.row.data}
                                                                setEditorStatus={() => {
                                                                  setActionType(ActionType.UPDATE);
                                                                  setEditedRow(data.row.data);
                                                                  dispatch(setSelectedCategory(category));
                                                                }}/>}/>
          <Column dataField={DATASOURCE_ROW_STATUS} alignment={"center"} formItem={{visible: false}}/>
          {itemContainer[category.id].map(item => getDxColumnConfig(item))}
          <Column
            dataField="last_modified_by"
            caption={translate('cancerLibraryApp.datasourceEditor.column.lastModifiedBy')}
            alignment={'center'}
            allowEditing={false}
            visibleIndex={9999997}
            formItem={{visible: actionType === ActionType.UPDATE, visibleIndex: 9999998}}
          />
          <Column
            dataField="last_modified_date"
            caption={translate('cancerLibraryApp.datasourceEditor.column.lastModifiedDate')}
            alignment={'center'}
            dataType={'datetime'}
            format={'yy/MM/dd hh:mm'}
            allowEditing={false}
            visibleIndex={9999998}
            formItem={{visible: actionType === ActionType.UPDATE, visibleIndex: 9999999}}
          />
          <Column type="buttons" width={110} visibleIndex={9999999}>
            <DxButton name="comment" icon="comment" onClick={(e) => {
              dispatch(setSelectedCategory(category));
              dispatch(setSelectedRow(e.row.data));
              rowCommentPopupRef.current.setPopupVisible(true);
            }}/>
            <DxButton name="delete"
                      visible={(e) => {
                        if (e.row.data.idx.includes(KCURE_PREFIX)) {
                          return e.row.data['created_by'] === login
                        } else {
                          return true;
                        }
                      }}
            />
          </Column>
        </DataGrid>
      </AccordionDetails>
      <RowCommentPopup ref={rowCommentPopupRef}/>
    </Accordion>
  ) : null;
};

export default SingleTableEditor;
