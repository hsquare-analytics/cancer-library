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
import {translate} from "react-jhipster";

interface IPatientTableEditorStackButtonProps {
  setPopupVisible: (popupVisible: boolean) => void;
}

export const PatientTableEditorStackButton = (props: IPatientTableEditorStackButtonProps) => {
  const dispatch = useAppDispatch();

  const canReview = useAppSelector(state => hasAnyAuthority(state.authentication.account.authorities, [AUTHORITIES.ADMIN, AUTHORITIES.SUPERVISOR]));
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

  const onDeclinedButtonClick = async () => {
    const {value: text, isConfirmed: isConfirmed} = await Swal.fire({
      text: translate("cancerLibraryApp.patientTableEditor.reviewButton.declinePopup.title", {name : patient.ptNm, no: patient.ptNo}),
      input: 'textarea',
      inputValue: patient ? patient.comment : "",
      inputPlaceholder: translate("cancerLibraryApp.patientTableEditor.reviewButton.declinePopup.placeholder"),
      inputAttributes: {
        'aria-label': 'Type your message here'
      },
      showCancelButton: true,
      customClass: {
        container: 'swal2-wide-textarea-container',
      },
      confirmButtonText: translate("cancerLibraryApp.patientTableEditor.reviewButton.confirm"),
      cancelButtonText: translate("cancerLibraryApp.patientTableEditor.reviewButton.cancel"),
    });

    if (isConfirmed) {
      const reConfirm = await Swal.fire({
        text: translate("cancerLibraryApp.patientTableEditor.reviewButton.declinePopup.text", {name : patient.ptNm, no: patient.ptNo}),
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: translate("cancerLibraryApp.patientTableEditor.reviewButton.confirm"),
        cancelButtonText: translate("cancerLibraryApp.patientTableEditor.reviewButton.cancel"),
      });

      if (reConfirm.isConfirmed) {
        const patientWithUpdatedStatus = {
          ...patient,
          status: REVIEW_LIST.DECLINED,
          lastModifiedBy: login,
          lastModifiedDate: new Date(),
          comment: text
        };
        dispatch(updatePatient(patientWithUpdatedStatus));
      }
    }
    return 0;
  }

  const onApprovedButtonClick = async () => {
    const {isConfirmed: isConfirmed} = await Swal.fire({
      text: translate("cancerLibraryApp.patientTableEditor.reviewButton.approvePopup.title", {name : patient.ptNm, no: patient.ptNo}),
      showCancelButton: true,
      confirmButtonText: translate("cancerLibraryApp.patientTableEditor.reviewButton.confirm"),
      cancelButtonText: translate("cancerLibraryApp.patientTableEditor.reviewButton.cancel"),
    });

    if (isConfirmed) {
      const patientWithUpdatedStatus = {
        ...patient,
        status: REVIEW_LIST.APPROVED,
        lastModifiedBy: login,
        lastModifiedDate: new Date()
      };
      dispatch(updatePatient(patientWithUpdatedStatus));
    }
    return 0;
  }

  const onSubmittedButtonClick = async () => {
    const {isConfirmed: isConfirmed} = await Swal.fire({
      text: translate("cancerLibraryApp.patientTableEditor.reviewButton.submitPopup.title", {name : patient.ptNm, no: patient.ptNo}),
      showCancelButton: true,
      confirmButtonText: translate("cancerLibraryApp.patientTableEditor.reviewButton.submitPopup.confirm"),
      cancelButtonText: translate("cancerLibraryApp.patientTableEditor.reviewButton.submitPopup.cancel"),
    });

    if (isConfirmed) {
      const patientWithUpdatedStatus = {
        ...patient,
        status: REVIEW_LIST.SUBMITTED,
        createdBy: login,
        createdDate: new Date(),
        lastModifiedBy: login,
        lastModifiedDate: new Date()
      };
      dispatch(updatePatient(patientWithUpdatedStatus));
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
