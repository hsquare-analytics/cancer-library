import React, {useEffect, useState} from "react";
import {useAppDispatch, useAppSelector} from "app/config/store";
import {getAccessiblePatients,} from "app/modules/patient-table-editor/patient-table-editor.reducer";
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
import {IPatient} from "app/shared/model/patient.model";
import Button from '@mui/material/Button';
import Stack from '@mui/material/Stack';
import {hasAnyAuthority} from "app/shared/auth/private-route";

export const PatientTableEditor = () => {
  const [popupVisible, setPopupVisible] = useState(false);
  const [patient, setPatient] = useState<IPatient>(null);

  const dispatch = useAppDispatch();
  const isAdmin = useAppSelector(state => hasAnyAuthority(state.authentication.account.authorities, [AUTHORITIES.ADMIN, AUTHORITIES.REVIEWER]));

  const patientList = useAppSelector(state => state.patientTableEditor.patients);

  useEffect(() => {
    dispatch(getAccessiblePatients());
  }, []);

  const onRowDblClick = (e) => {
    getPatientInfo(e.data.ptNo);
    setPopupVisible(!popupVisible);
  }

  const getPatientInfo = (ptNo: string) => {
    return axios.get(`/api/patients/${ptNo}`).then(({data}) => {
      setPatient(data);
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
    axios.patch(`api/patients/${patient.ptNo}`, {...patient, status})
    .then(({data}) => {
      if (data >= 1) {
        getPatientInfo(patient.ptNo).then(() => {
          toast.success('Updated Successfully');
        });
      } else {
        toast.error('Data Submission Failed');
      }
    })
    .catch(err => toast.error(err));
  }

  return (
    <div>
      <Popup
        showTitle={false}
        visible={popupVisible}
        closeOnOutsideClick={true}
        onHiding={() => {
          setPopupVisible(false)
          setPatient(null);
        }}
        resizeEnabled={true}
        height={'95vh'}
        width={'95vw'}
      >
        <ScrollView width='100%' height='100%' showScrollbar={"onScroll"}>
          <PatientProfileCard patient={patient}/>
          <Stack direction="row-reverse" spacing={2}>
            {isAdmin ? (<> <Button variant="contained" color="error"
                                   onClick={() => onStatusChangeButtonClick(REVIEW_LIST.DECLINED)}>거부</Button>
                <Button variant="contained" color="success"
                        onClick={() => onStatusChangeButtonClick(REVIEW_LIST.APPROVED)}>승인</Button> </>
            ) : <Button variant="contained" color="info"
                        onClick={() => onStatusChangeButtonClick(REVIEW_LIST.SUBMITTED)}>제출</Button>}
          </Stack>
          <MultiTableEditor patient={patient}/>
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
          allowUpdating: true,
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
                minWidth={150}
                allowEditing={true}>
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
  );
};

export default PatientTableEditor;
