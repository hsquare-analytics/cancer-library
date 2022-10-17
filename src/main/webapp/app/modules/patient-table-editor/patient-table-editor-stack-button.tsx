import React from 'react';
import {AUTHORITIES, REVIEW_LIST} from "app/config/constants";
import Button from '@mui/material/Button';
import Stack from '@mui/material/Stack';
import {useAppDispatch, useAppSelector} from "app/config/store";
import {hasAnyAuthority} from "app/shared/auth/private-route";
import {
  updateEntity as updatePatient
} from "app/modules/patient-table-editor/reducer/patient-table-editor.patient.reducer";
import Swal from "sweetalert2";

interface IPatientTableEditorStackButtonProps {
  setPopupVisible: (popupVisible: boolean) => void;
}

export const PatientTableEditorStackButton = (props: IPatientTableEditorStackButtonProps) => {
  const dispatch = useAppDispatch();

  const canReview = useAppSelector(state => hasAnyAuthority(state.authentication.account.authorities, [AUTHORITIES.ADMIN, AUTHORITIES.SUPERVISOR]));
  const patient = useAppSelector(state => state.patientTableEditorPatient.entity);
  const login = useAppSelector(state => state.authentication.account.login);

  const onStatusChangeButtonClick = (status: string) => {
    const patientWithUpdatedStatus = {...patient, status, lastModifiedBy: login, lastModifiedDate: new Date()};
    if (status === REVIEW_LIST.SUBMITTED) {
      patientWithUpdatedStatus.createdBy = login;
      patientWithUpdatedStatus.createdDate = new Date();
    }
    dispatch(updatePatient(patientWithUpdatedStatus));
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

  const onDeclinedButtonClick = async () => {
    const {value: text, isConfirmed: isConfirmed} = await Swal.fire({
      input: 'textarea',
      inputPlaceholder: '거부 사유를 입력해주세요....',
      inputAttributes: {
        'aria-label': 'Type your message here'
      },
      showCancelButton: true,
      customClass: {
        container: 'swal2-wide-textarea-container',
      }
    });

    if (isConfirmed) {
      Swal.fire({
          text
        },
      );
      onStatusChangeButtonClick(REVIEW_LIST.DECLINED)
    }
    return 0;
  }

  return (
    <Stack direction="row-reverse" spacing={1}>
      <Button variant="outlined" onClick={() => props.setPopupVisible(false)}>닫기</Button>
      {canReview ? (
        <>
          <Button variant="contained" color="error" onClick={() => {
            onDeclinedButtonClick()
          }}>거부</Button>
          <Button variant="contained" color="success"
                  onClick={() => {
                    onStatusChangeButtonClick(REVIEW_LIST.APPROVED)
                  }}>승인</Button> </>
      ) : <Button variant="contained" color="info" disabled={canNotSubmit()}
                  onClick={() => {
                    onStatusChangeButtonClick(REVIEW_LIST.SUBMITTED)
                  }}>제출</Button>}
    </Stack>
  );
}

export default PatientTableEditorStackButton;
