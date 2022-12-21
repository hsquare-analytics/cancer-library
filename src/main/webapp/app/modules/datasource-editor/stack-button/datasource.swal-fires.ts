import {translate} from 'react-jhipster';
import Swal from 'sweetalert2';
import {IPatient} from 'app/shared/model/patient.model';

export const fireDeclineSwal = async (patient: IPatient) => {
  const {value: text, isConfirmed: isConfirmed} = await Swal.fire({
    text: translate('cancerLibraryApp.datasource.reviewButton.declinePopup.title', {
      name: patient.ptNm,
      no: patient.ptNo,
    }),
    input: 'textarea',
    inputValue: patient && patient.detail ? patient.detail.declineReason : '',
    inputPlaceholder: translate('cancerLibraryApp.datasource.reviewButton.declinePopup.placeholder'),
    showCancelButton: true,
    customClass: {
      container: 'swal2-wide-textarea-container',
    },
    confirmButtonText: translate('cancerLibraryApp.datasource.reviewButton.confirm'),
    cancelButtonText: translate('cancerLibraryApp.datasource.reviewButton.cancel'),
  });

  if (isConfirmed) {
    const reConfirm = await Swal.fire({
      text: translate('cancerLibraryApp.datasource.reviewButton.declinePopup.text', {
        name: patient.ptNm,
        no: patient.ptNo,
      }),
      // icon: 'warning',
      customClass: 'cancer-dialog',
      showCancelButton: true,
      confirmButtonText: translate('cancerLibraryApp.datasource.reviewButton.confirm'),
      cancelButtonText: translate('cancerLibraryApp.datasource.reviewButton.cancel'),
    });

    return {isConfirmed: reConfirm.isConfirmed, text};
  }
  return {isConfirmed: false, text};
};

export const fireApprovedSwal = async (patient: IPatient) =>
  Swal.fire({
    text: translate('cancerLibraryApp.datasource.reviewButton.approvePopup.title', {
      name: patient.ptNm,
      no: patient.ptNo,
    }),
    showCancelButton: true,
    customClass: 'cancer-dialog',
    confirmButtonText: translate('cancerLibraryApp.datasource.reviewButton.confirm'),
    cancelButtonText: translate('cancerLibraryApp.datasource.reviewButton.cancel'),
  });

export const fireSubmitSwal = async (patient: IPatient) =>
  Swal.fire({
    text: translate('cancerLibraryApp.datasource.reviewButton.submitPopup.title', {
      name: patient.ptNm,
      no: patient.ptNo,
    }),
    customClass: 'cancer-dialog',
    showCancelButton: true,
    confirmButtonText: translate('cancerLibraryApp.datasource.reviewButton.confirm'),
    cancelButtonText: translate('cancerLibraryApp.datasource.reviewButton.cancel'),
  });

export const fireDeclineReasonSwal = (patient: IPatient) =>
  Swal.fire({
    text: translate('cancerLibraryApp.datasource.reviewButton.declineReasonPopup.title', {
      name: patient.ptNm,
      no: patient.ptNo,
    }),
    input: 'textarea',
    inputValue: patient && patient.detail ? patient.detail.declineReason : '',
    showCloseButton: true,
    showCancelButton: false,
    showConfirmButton: false,
    cancelButtonText: translate('cancerLibraryApp.datasource.reviewButton.cancel'),
    customClass: {
      container: 'swal2-wide-textarea-container',
    },
  });
