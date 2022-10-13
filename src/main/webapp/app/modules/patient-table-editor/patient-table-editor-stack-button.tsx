import React from 'react';
import {AUTHORITIES, REVIEW_LIST} from "app/config/constants";
import Button from '@mui/material/Button';
import Stack from '@mui/material/Stack';
import {useAppDispatch, useAppSelector} from "app/config/store";
import {hasAnyAuthority} from "app/shared/auth/private-route";
import {getPatient, setPatients} from "app/modules/patient-table-editor/patient-table-editor.reducer";
import axios from "axios";
import {toast} from 'react-toastify';
import {translate} from 'react-jhipster';


export const PatientTableEditorStackButton = () => {
  const dispatch = useAppDispatch();

  const canReview = useAppSelector(state => hasAnyAuthority(state.authentication.account.authorities, [AUTHORITIES.ADMIN, AUTHORITIES.SUPERVISOR]));
  const patient = useAppSelector(state => state.patientTableEditor.patient);
  const patientList = useAppSelector(state => state.patientTableEditor.patients);
  const login = useAppSelector(state => state.authentication.account.login);

  const onStatusChangeButtonClick = (status: string) => {
    const patientWithUpdatedStatus = {...patient, status, lastModifiedBy: login, lastModifiedDate: new Date()};
    if (status === REVIEW_LIST.SUBMITTED) {
      patientWithUpdatedStatus.createdBy = login;
      patientWithUpdatedStatus.createdDate = new Date();
    }
    axios.patch(`api/patients/${patient.ptNo}`, patientWithUpdatedStatus)
    .then(({data}) => {
      if (data >= 1) {
        toast.success(translate("cancerLibraryApp.patientTableEditor.updateSuccess", {
          no: patient.ptNo,
          name: patient.ptNm
        }));
        dispatch(getPatient(patient.ptNo));
        dispatch(setPatients(patientList.map(p => p.ptNo === patient.ptNo ? patientWithUpdatedStatus : p)));
      } else {
        toast.error(translate("cancerLibraryApp.patientTableEditor.updateFailed", {
          no: patient.ptNo,
          name: patient.ptNm
        }));
      }
    })
    .catch(err => toast.error(err));
  }

  const canSubmit = () => {
    if (!patient) {
      return false;
    }
    return patient.status !== REVIEW_LIST.APPROVED;
  }

  const canNotSubmit = () => {
    return !canSubmit();
  }

  return (
    <Stack direction="row-reverse" spacing={2}>
      {canReview ? (<> <Button variant="contained" color="error"
                               onClick={() => onStatusChangeButtonClick(REVIEW_LIST.DECLINED)}>거부</Button>
          <Button variant="contained" color="success"
                  onClick={() => onStatusChangeButtonClick(REVIEW_LIST.APPROVED)}>승인</Button> </>
      ) : <Button variant="contained" color="info"
                  disabled={canNotSubmit()}
                  onClick={() => onStatusChangeButtonClick(REVIEW_LIST.SUBMITTED)}>제출</Button>}
    </Stack>
  );
}

export default PatientTableEditorStackButton;
