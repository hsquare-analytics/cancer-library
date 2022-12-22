import React, {useEffect, useRef} from 'react';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {
  getEntities as getAccessiblePatients,
  getEntity as getPatient,
  updateEntity as updatePatient,
} from 'app/modules/datasource-editor/reducer/datasource.patient.reducer';
import {getEntities as getPatientComments} from "app/modules/row-comment-editor/row-comment.reducer";
import DataGrid, {Column, Lookup} from 'devextreme-react/data-grid';
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

export const AccessiblePatient = () => {
  const dispatch = useAppDispatch();

  const dataGrid = useRef(null);

  const multiTableEditorPopupRef = useRef(null);

  const isSudoUser = useAppSelector(state =>
    hasAnyAuthority(state.authentication.account.authorities, [AUTHORITIES.ADMIN, AUTHORITIES.SUPERVISOR])
  );
  const patient = useAppSelector(state => state.datasourcePatient.entity);
  const patientList = useAppSelector(state => state.datasourcePatient.entities);
  const updateSuccess = useAppSelector(state => state.datasourcePatient.updateSuccess);
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

  const getCalculateSortValue = (data: any) => {
    switch (data.detail.status) {
      case  REVIEW_LIST.SUBMITTED:
        return 1;
      case  REVIEW_LIST.DECLINED:
        return 2;
      case  REVIEW_LIST.APPROVED:
        return 3;
      default:
        return 4;
    }
  }

  const userMarkingCellTemplate = (column) => (cellElement, cellInfo) => {
    const name = users.find(user => user.login === cellInfo.data.detail[column])?.name
    if (name) {
      cellElement.innerText = name;
    }
  };

  return (
    <section className="wrap-page">
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
          selection={{mode: 'single'}}
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
            calculateSortValue={getCalculateSortValue}
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
