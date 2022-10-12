import React, {useEffect, useState} from "react";
import {useAppDispatch, useAppSelector} from "app/config/store";
import {
  getAccessiblePatients,
  setPatient,
  setPatients
} from "app/modules/patient-table-editor/patient-table-editor.reducer";
import DataGrid, {Column, Lookup} from 'devextreme-react/data-grid';
import {AUTHORITIES, REVIEW_LIST} from "app/config/constants";
import {translate} from 'react-jhipster';
import PatientTableEditorColumn from "./patient-table-editor.column";
import {Popup} from 'devextreme-react/popup';
import MultiTableEditor from "app/modules/patient-table-editor/multi-table-editor/multi-table-editor";
import ScrollView from 'devextreme-react/scroll-view';
import {cleanEntity} from "app/shared/util/entity-utils";
import {toast} from 'react-toastify';
import axios from "axios";
import PatientProfileCard from "app/modules/patient-table-editor/patient-profile/patient-profile-card";
import Button from '@mui/material/Button';
import Stack from '@mui/material/Stack';
import {hasAnyAuthority} from "app/shared/auth/private-route";
import CircularProgress from '@mui/material/CircularProgress';

export const PatientTableEditor = () => {
  const [popupVisible, setPopupVisible] = useState(false);

  const dispatch = useAppDispatch();
  const canReview = useAppSelector(state => hasAnyAuthority(state.authentication.account.authorities, [AUTHORITIES.ADMIN, AUTHORITIES.REVIEWER]));
  const patient = useAppSelector(state => state.patientTableEditor.patient);
  const patientList = useAppSelector(state => state.patientTableEditor.patients);
  const loading = useAppSelector(state => state.patientTableEditor.loading.patients);

  useEffect(() => {
    dispatch(getAccessiblePatients());
  }, []);

  const onRowDblClick = (e) => {
    getPatientInfo(e.data.ptNo);
    setPopupVisible(!popupVisible);
  }

  const getPatientInfo = (ptNo: string) => {
    return axios.get(`/api/patients/${ptNo}`).then(({data}) => {
      dispatch(setPatient(data));
    });
  }

  const onRowUpdating = (e) => {
    e.cancel = new Promise<void>((resolve, reject) => {
      const row = cleanEntity(Object.assign({}, e.oldData, e.newData));
      axios
      .patch(`api/patients/${row.ptNo}`, row)
      .then(({data}) => {
        if (data >= 1) {
          toast.success('Updated Successfully');
          e.oldData['status'] = REVIEW_LIST.SUBMITTED;
          resolve();
        } else {
          toast.error('Data Submission Failed');
          reject('Updated Fail');
        }
      })
      .catch(err => reject(err));
    });
  }

  const onStatusChangeButtonClick = (status: string) => {
    const patientWithUpdatedStatus = {...patient, status}
    axios.patch(`api/patients/${patient.ptNo}`, patientWithUpdatedStatus)
    .then(({data}) => {
      if (data >= 1) {
        toast.success('Updated Successfully');
        dispatch(setPatient(patientWithUpdatedStatus));
        dispatch(setPatients(patientList.map(p => p.ptNo === patient.ptNo ? patientWithUpdatedStatus : p)));
      } else {
        toast.error('Data Submission Failed');
      }
    })
    .catch(err => toast.error(err));
  }

  return !loading ? (
    <div>
      <Popup
        showTitle={false}
        visible={popupVisible}
        closeOnOutsideClick={true}
        onHiding={() => {
          setPopupVisible(false)
          dispatch(setPatient(null));
        }}
        resizeEnabled={true}
        height={'95vh'}
        width={'95vw'}
      >
        <ScrollView width='100%' height='100%' showScrollbar={"onScroll"}>
          <PatientProfileCard/>
          <Stack direction="row-reverse" spacing={2}>
            {canReview ? (<> <Button variant="contained" color="error"
                                     onClick={() => onStatusChangeButtonClick(REVIEW_LIST.DECLINED)}>거부</Button>
                <Button variant="contained" color="success"
                        onClick={() => onStatusChangeButtonClick(REVIEW_LIST.APPROVED)}>승인</Button> </>
            ) : <Button variant="contained" color="info"
                        onClick={() => onStatusChangeButtonClick(REVIEW_LIST.SUBMITTED)}>제출</Button>}
          </Stack>
          <div>
            <MultiTableEditor/>
          </div>
        </ScrollView>
      </Popup>
      <DataGrid
        dataSource={JSON.parse(JSON.stringify(patientList))}
        showBorders={true}
        filterRow={{visible: true}}
        headerFilter={{visible: true}}
        searchPanel={{visible: true}}
        allowColumnResizing={true}
        pager={{displayMode: 'compact', showNavigationButtons: true}}
        editing={{
          mode: 'row',
          allowAdding: false,
          allowUpdating: canReview,
        }}
        onRowUpdating={onRowUpdating}
        onRowDblClick={onRowDblClick}
        height={'95vh'}
        scrolling={{mode: 'virtual'}}
        selection={{mode: 'multiple'}}
        hoverStateEnabled={true}
      >

        {
          PatientTableEditorColumn.map(item => <Column
              key={item.dataField}
              dataField={item.dataField}
              caption={translate("cancerLibraryApp.patient." + item.dataField)}
              visibleIndex={item.visibleIndex}
              allowEditing={false}
              alignment={'center'}
              minWidth={150}
            />
          )
        }
        <Column caption={translate("datasource.column.status")} dataField={"status"} alignment={'center'}
                minWidth={150} allowEditing={true}>
          <Lookup dataSource={[
            {
              id: 1,
              valueExpr: REVIEW_LIST.SUBMITTED,
              displayExpr: translate('datasource.review.submitted')
            },
            {id: 2, valueExpr: REVIEW_LIST.DECLINED, displayExpr: translate('datasource.review.declined')},
            {id: 3, valueExpr: REVIEW_LIST.APPROVED, displayExpr: translate('datasource.review.approved')},
          ]} displayExpr={'displayExpr'} valueExpr={'valueExpr'}/>
        </Column>
      </DataGrid>
    </div>
  ) : <CircularProgress/>;
};

export default PatientTableEditor;
