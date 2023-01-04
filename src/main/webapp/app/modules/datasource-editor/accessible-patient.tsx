import React, {useEffect, useRef} from 'react';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {
  getEntities as getAccessiblePatients,
  getEntity as getPatient, updateBulkStatus,
  updateEntity as updatePatient,
} from 'app/modules/datasource-editor/reducer/datasource.patient.reducer';
import {getEntities as getPatientComments} from "app/modules/row-comment-editor/row-comment.reducer";
import DataGrid, {Column, Item, Toolbar, Lookup} from 'devextreme-react/data-grid';
import {AUTHORITIES} from 'app/config/constants';
import {translate} from 'react-jhipster';
import AccessiblePatientColumn from './accessible-patient.column';
import {cleanEntity} from 'app/shared/util/entity-utils';
import {hasAnyAuthority} from 'app/shared/auth/private-route';
import {getIndexColumnTemplate} from 'app/shared/util/dx-utils';
import './accessible-patient.scss';
import {CheckBox} from 'devextreme-react/check-box';
import {MultiTableEditorPopup} from 'app/modules/datasource-editor/multi-table-editor/multi-table-editor-popup';
import CircularProgress from '@mui/material/CircularProgress';
import Box from '@mui/material/Box';
import {REVIEW_LIST} from 'app/config/datasource-constants';
import {getUsers} from "app/modules/administration/user-management/user-management.reducer";
import {getAccessiblePatientStatusSortValue} from "app/modules/datasource-editor/utils/accessible-patient.sort.utils";
import {onClickUpdateBulkStatus} from "app/modules/datasource-editor/accessible-patient.updatebulk.utils";

export const AccessiblePatient = () => {
  const dispatch = useAppDispatch();

  const dataGrid = useRef(null);

  const multiTableEditorPopupRef = useRef(null);

  const isSudoUser = useAppSelector(state =>
    hasAnyAuthority(state.authentication.account.authorities, [AUTHORITIES.ADMIN, AUTHORITIES.SUPERVISOR])
  );
  const patientList = useAppSelector(state => state.datasourcePatient.entities);
  const loading = useAppSelector(state => state.datasourcePatient.loading);
  const users = useAppSelector(state => state.userManagement.users);

  useEffect(() => {
    dispatch(getAccessiblePatients());
    if (users.length === 0) {
      dispatch(getUsers({}));
    }
  }, []);

  const onRowDblClick = e => {
    dispatch(getPatient(e.data.ptNo));
    dispatch(getPatientComments(e.data.ptNo));

    multiTableEditorPopupRef.current.setPopupVisible(true);
  };

  const onRowUpdating = e => {
    e.cancel = new Promise<void>(resolve => {
      const row = cleanEntity(Object.assign({}, e.oldData, e.newData));
      dispatch(updatePatient(row));
      resolve();
    });
  };

  const commentCellRender = data => {
    const comment = data.value;
    let result = comment && comment.length > 0;
    if (typeof result !== 'boolean') {
      result = false;
    }
    return <CheckBox disabled value={result} style={{backgroundColor: result ? 'var(--bs-primary)' : 'none'}}/>;
  };

  const userMarkingCellTemplate = (column) => (cellElement, cellInfo) => {
    const foundedUser = users.find(user => user.login === cellInfo.data.detail[column])
    if (foundedUser) {
      cellElement.innerText = foundedUser.name || foundedUser.login;
    }
  };

  return (
    <section className="wrap-page accessible-patient-wrapper">
      <h1 className="title-page">{translate('cancerLibraryApp.datasource.pageTitle')}</h1>
      <MultiTableEditorPopup ref={multiTableEditorPopupRef}/>
      {!loading || patientList.length > 0 ? (
        <DataGrid
          id="accessible-patient-datagrid"
          ref={dataGrid}
          dataSource={JSON.parse(JSON.stringify(patientList))}
          showBorders={true}
          filterRow={{visible: true}}
          headerFilter={{visible: true}}
          searchPanel={{visible: true}}
          columnAutoWidth={true}
          showRowLines={true}
          showColumnHeaders={true}
          allowColumnReordering={true}
          allowColumnResizing={true}
          columnResizingMode={'widget'}
          selection={{mode: 'multiple', selectAllMode: 'page', showCheckBoxesMode: 'always'}}
          pager={{displayMode: 'compact', showNavigationButtons: true}}
          editing={{
            mode: 'row',
            allowAdding: false,
            allowUpdating: isSudoUser,
          }}
          onRowUpdating={e => onRowUpdating(e)}
          onRowDblClick={onRowDblClick}
          height={'95vh'}
          hoverStateEnabled={true}
          paging={{pageSize: 30}}
          toolbar={{
            items: [
              {
                location: 'after',
                widget: 'dxButton',
                visible: isSudoUser,
                options: {
                  icon: 'revert',
                  onClick() {
                    onClickUpdateBulkStatus({dataGridRef: dataGrid, dispatch, status: REVIEW_LIST.DECLINED});
                  },
                  text: translate('cancerLibraryApp.patient.bulkDecline.title'),
                }
              },
              {
                location: 'after',
                widget: 'dxButton',
                visible: isSudoUser,
                options: {
                  icon: 'check',
                  onClick() {
                    onClickUpdateBulkStatus({dataGridRef: dataGrid, dispatch, status: REVIEW_LIST.APPROVED});
                  },
                  text: translate('cancerLibraryApp.patient.bulkApprove.title'),
                }
              },
              {
                name: 'searchPanel',
              }
            ]
          }}
        >
          <Column caption={'#'} cellTemplate={getIndexColumnTemplate} alignment={'center'} width={80}
                  visibleIndex={0}/>
          <Column
            dataField="detail.comment"
            caption={translate('cancerLibraryApp.datasource.column.comment')}
            width={150}
            alignment={'center'}
            cellRender={commentCellRender}
            allowEditing={false}
            visibleIndex={1}
          />
          <Column
            caption={translate('cancerLibraryApp.patient.detail.status')}
            dataField={'detail.status'}
            alignment={'center'}
            minWidth={150}
            allowEditing={true}
            visibleIndex={2}
            sortIndex={0}
            sortOrder={'asc'}
            calculateSortValue={getAccessiblePatientStatusSortValue(isSudoUser)}
          >
            <Lookup
              dataSource={[
                {
                  id: 1,
                  valueExpr: REVIEW_LIST.SUBMITTED,
                  displayExpr: translate('cancerLibraryApp.datasource.review.submitted'),
                },
                {
                  id: 2,
                  valueExpr: REVIEW_LIST.DECLINED,
                  displayExpr: translate('cancerLibraryApp.datasource.review.declined'),
                },
                {
                  id: 3,
                  valueExpr: REVIEW_LIST.APPROVED,
                  displayExpr: translate('cancerLibraryApp.datasource.review.approved'),
                },
              ]}
              displayExpr={'displayExpr'}
              valueExpr={'valueExpr'}
            />
          </Column>
          {AccessiblePatientColumn.map(item => (
            <Column
              key={item.dataField}
              dataField={item.dataField}
              caption={translate(item.caption) || item.dataField}
              dataType={item.dataType}
              visibleIndex={item.visibleIndex}
              format={item.format}
              allowEditing={false}
              alignment={'center'}
              minWidth={150}
              sortIndex={item.sortIndex}
              sortOrder={item.sortOrder}
            />
          ))}
          <Column dataField={"detail.createdBy"}
                  caption={translate('cancerLibraryApp.patient.detail.createdBy')}
                  alignment={"center"}
                  visibleIndex={11}
                  cellTemplate={userMarkingCellTemplate('createdBy')}
          />
          <Column dataField={"detail.lastModifiedBy"}
                  caption={translate('cancerLibraryApp.patient.detail.lastModifiedBy')}
                  alignment={"center"}
                  visibleIndex={13}
                  cellTemplate={userMarkingCellTemplate('lastModifiedBy')}
          />
        </DataGrid>
      ) : (
        <Box sx={{display: 'flex'}}>
          <CircularProgress/>
        </Box>
      )}
    </section>
  );
};

export default AccessiblePatient;
