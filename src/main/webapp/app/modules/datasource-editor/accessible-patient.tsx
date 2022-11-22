import React, {useEffect, useRef} from 'react';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {
  getEntities as getAccessiblePatients,
  getEntity as getPatient,
  updateEntity as updatePatient,
} from 'app/modules/datasource-editor/reducer/datasource.patient.reducer';
import DataGrid, {Column, Item, Lookup, Toolbar} from 'devextreme-react/data-grid';
import {AUTHORITIES} from 'app/config/constants';
import {translate} from 'react-jhipster';
import AccessiblePatientColumn from './accessible-patient.column';
import {cleanEntity} from 'app/shared/util/entity-utils';
import {toast} from 'react-toastify';
import {hasAnyAuthority} from 'app/shared/auth/private-route';
import {getIndexColumnTemplate} from 'app/shared/util/dx-utils';
import './accessible-patient.scss';
import {CheckBox} from 'devextreme-react/check-box';
import {MultiTableEditorPopup} from 'app/modules/datasource-editor/multi-table-editor/multi-table-editor-popup';
import CustomDateRangePopover from 'app/modules/datasource-editor/date-range-picker';
import {setDateRange} from 'app/modules/datasource-editor/reducer/datasource.status.reducer';
import moment from 'moment';
import CircularProgress from '@mui/material/CircularProgress';
import Box from '@mui/material/Box';
import {REVIEW_LIST} from 'app/config/datasource-constants';

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

  const initialDateRange = {
    startDate: moment(new Date()).subtract(1, 'week').toDate(),
    endDate: new Date(),
  };

  useEffect(() => {
    dispatch(setDateRange(initialDateRange));
    dispatch(getAccessiblePatients(initialDateRange));
  }, []);

  useEffect(() => {
    if (updateSuccess) {
      toast.success(
        translate('cancerLibraryApp.datasourceEditor.updateSuccess', {
          no: patient.ptNo,
          name: patient.ptNm,
        })
      );
    }
  }, [updateSuccess]);

  const onRowDblClick = e => {
    dispatch(getPatient(e.data.ptNo));
    multiTableEditorPopupRef.current.setPopupVisible(true);
  };

  const onRowUpdating = e => {
    e.cancel = new Promise<void>(resolve => {
      const row = cleanEntity(Object.assign({}, e.oldData, e.newData));
      dispatch(updatePatient({ entity: row, dateRange: initialDateRange }));
      resolve();
    });
  };

  const commentCellRender = data => {
    const comment = data.value;
    const result = comment && comment.length > 0;
    return <CheckBox disabled value={result} style={{backgroundColor: result ? 'blue' : 'none'}}/>;
  };

  return (
    <section className="wrap-page">
      <h1 className="title-page">{translate('cancerLibraryApp.datasourceEditor.pageTitle')}</h1>
      <MultiTableEditorPopup ref={multiTableEditorPopupRef} />
      {!loading ? (
        <DataGrid
          id="accessible-patient-datagrid"
          ref={dataGrid}
          dataSource={JSON.parse(JSON.stringify(patientList))}
          showBorders={true}
          filterRow={{ visible: true }}
          headerFilter={{ visible: true }}
          searchPanel={{ visible: true }}
          allowColumnResizing={true}
          pager={{ displayMode: 'compact', showNavigationButtons: true }}
          editing={{
            mode: 'row',
            allowAdding: false,
            allowUpdating: isSudoUser,
          }}
          onRowUpdating={e => onRowUpdating(e)}
          onRowDblClick={onRowDblClick}
          height={'95vh'}
          selection={{ mode: 'multiple' }}
          hoverStateEnabled={true}
          paging={{ pageSize: 30 }}
        >
          <Toolbar>
            <Item name={'searchPanel'} />
            {isSudoUser ? (
              <Item location={'before'}>
                <CustomDateRangePopover />
              </Item>
            ) : null}
          </Toolbar>
          <Column caption={'#'} cellTemplate={getIndexColumnTemplate} alignment={'center'} width={80} />
          {AccessiblePatientColumn.map(item => (
            <Column
              key={item.dataField}
              dataField={item.dataField}
              caption={translate('cancerLibraryApp.patient.' + item.dataField)}
              dataType={item.dataType}
              visibleIndex={item.visibleIndex}
              format={item.format}
              allowEditing={false}
              alignment={'center'}
              minWidth={150}
            />
          ))}
          <Column
            caption={translate('cancerLibraryApp.datasourceEditor.column.status')}
            dataField={'status'}
            alignment={'center'}
            minWidth={150}
            allowEditing={true}
          >
            <Lookup
              dataSource={[
                {
                  id: 1,
                  valueExpr: REVIEW_LIST.SUBMITTED,
                  displayExpr: translate('cancerLibraryApp.datasourceEditor.review.submitted'),
                },
                {
                  id: 2,
                  valueExpr: REVIEW_LIST.DECLINED,
                  displayExpr: translate('cancerLibraryApp.datasourceEditor.review.declined'),
                },
                {
                  id: 3,
                  valueExpr: REVIEW_LIST.APPROVED,
                  displayExpr: translate('cancerLibraryApp.datasourceEditor.review.approved'),
                },
              ]}
              displayExpr={'displayExpr'}
              valueExpr={'valueExpr'}
            />
          </Column>
          <Column
            dataField="comment"
            caption={translate('cancerLibraryApp.datasourceEditor.column.comment')}
            width={150}
            alignment={'center'}
            cellRender={commentCellRender}
            allowEditing={false}
          />
        </DataGrid>
      ) : (
        <Box sx={{ display: 'flex' }}>
          <CircularProgress />
        </Box>
      )}
    </section>
  );
};

export default AccessiblePatient;
