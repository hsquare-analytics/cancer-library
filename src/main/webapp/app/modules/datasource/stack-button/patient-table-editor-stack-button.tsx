import React from 'react';
import {AUTHORITIES, REVIEW_LIST} from "app/config/constants";
import Button from '@mui/material/Button';
import Stack from '@mui/material/Stack';
import {useAppDispatch, useAppSelector} from "app/config/store";
import {hasAnyAuthority} from "app/shared/auth/private-route";
import {updateEntity as updatePatient} from "app/modules/datasource/reducer/datasource.patient.reducer";
import {translate} from "react-jhipster";
import {
  fireApprovedSwal,
  fireDeclineReasonSwal,
  fireDeclineSwal,
  fireSubmitSwal
} from "app/modules/datasource/stack-button/patient-table-editor.swal-fires";

interface IPatientTableEditorStackButtonProps {
  setPopupVisible: (popupVisible: boolean) => void;
}

export const PatientTableEditorStackButton = (props: IPatientTableEditorStackButtonProps) => {
  const dispatch = useAppDispatch();

  const canDecline = useAppSelector(state => hasAnyAuthority(state.authentication.account.authorities, [AUTHORITIES.ADMIN, AUTHORITIES.SUPERVISOR]));
  const canNotDecline = () => {
    return !canDecline;
  }
  const patient = useAppSelector(state => state.patientTableEditorPatient.entity);
  const login = useAppSelector(state => state.authentication.account.login);

  const canSubmit = () => {
    if (!patient) {
      return false;
    }
    return patient.status !== REVIEW_LIST.APPROVED;
  }

  const canNotSubmit = () => {
    return !canSubmit();
  }

  const getLocalPatient = (status: string) => {
    const result = {
      ...patient,
      status,
      lastModifiedBy: login,
      lastModifiedDate: new Date(),
    };

    if (status === REVIEW_LIST.SUBMITTED) {
      return {
        ...result,
        createdBy: login,
        createdDate: new Date(),
      }
    }

    return result;
  }

  const onDeclinedButtonClick = () => {
    fireDeclineSwal(patient).then(({isConfirmed, text}) => {
      if (isConfirmed) {
        const payload = {...getLocalPatient(REVIEW_LIST.DECLINED), comment: text};
        dispatch(updatePatient(payload));
      }
    });
  };

  const onApprovedButtonClick = () => {
    fireApprovedSwal(patient).then(({isConfirmed}) => {
      if (isConfirmed) {
        const payload = {...getLocalPatient(REVIEW_LIST.APPROVED)};
        dispatch(updatePatient(payload));
      }
    });
  }

  const onSubmittedButtonClick = () => {
    fireSubmitSwal(patient).then(({isConfirmed}) => {
      if (isConfirmed) {
        const payload = {...getLocalPatient(REVIEW_LIST.SUBMITTED)};
        dispatch(updatePatient(payload));
      }
    });
  }

  const onDeclineReasonButtonClick = () => {
    fireDeclineReasonSwal(patient);
  }


  return (
    <Stack direction="row-reverse" spacing={1}>
      <Button variant="outlined" onClick={() => props.setPopupVisible(false)}>닫기</Button>
      {
        patient && patient.status === REVIEW_LIST.DECLINED && canNotDecline() &&
        <Button variant="outlined" color="warning" onClick={() => {
          onDeclineReasonButtonClick()
        }}>거부 사유</Button>
      }
      {canDecline ? (
        <>
          <Button variant="contained" color="error" onClick={() => {
            onDeclinedButtonClick()
          }}>{translate("cancerLibraryApp.patientTableEditor.reviewButton.decline")}</Button>
          <Button variant="contained" color="success"
                  onClick={() => {
                    onApprovedButtonClick()
                  }}>{translate("cancerLibraryApp.patientTableEditor.reviewButton.approve")}</Button> </>
      ) : <Button variant="contained" color="info" disabled={canNotSubmit()}
                  onClick={() => {
                    onSubmittedButtonClick()
                  }}>{translate("cancerLibraryApp.patientTableEditor.reviewButton.submit")}</Button>}
    </Stack>
  );
}

export default PatientTableEditorStackButton;
