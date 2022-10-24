import {translate} from "react-jhipster";
import Swal from "sweetalert2";
import {IPatient} from "app/shared/model/patient.model";

export const fireDeclineSwal = async (patient: IPatient) => {
  const {value: text, isConfirmed: isConfirmed} = await Swal.fire({
    text: translate("cancerLibraryApp.patientTableEditor.reviewButton.declinePopup.title", {
      name: patient.ptNm,
      no: patient.ptNo
    }),
    input: 'textarea',
    inputValue: patient ? patient.comment : "",
    inputPlaceholder: translate("cancerLibraryApp.patientTableEditor.reviewButton.declinePopup.placeholder"),
    showCancelButton: true,
    customClass: {
      container: 'swal2-wide-textarea-container',
    },
    confirmButtonText: translate("cancerLibraryApp.patientTableEditor.reviewButton.confirm"),
    cancelButtonText: translate("cancerLibraryApp.patientTableEditor.reviewButton.cancel"),
  });

  if (isConfirmed) {
    const reConfirm = await Swal.fire({
      text: translate("cancerLibraryApp.patientTableEditor.reviewButton.declinePopup.text", {
        name: patient.ptNm,
        no: patient.ptNo
      }),
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: translate("cancerLibraryApp.patientTableEditor.reviewButton.confirm"),
      cancelButtonText: translate("cancerLibraryApp.patientTableEditor.reviewButton.cancel"),
    });

    return {isConfirmed: reConfirm.isConfirmed, text};
  }
  return {isConfirmed: false, text};
}

export const fireApprovedSwal = async (patient: IPatient) => Swal.fire({
  text: translate("cancerLibraryApp.patientTableEditor.reviewButton.approvePopup.title", {
    name: patient.ptNm,
    no: patient.ptNo
  }),
  showCancelButton: true,
  confirmButtonText: translate("cancerLibraryApp.patientTableEditor.reviewButton.confirm"),
  cancelButtonText: translate("cancerLibraryApp.patientTableEditor.reviewButton.cancel"),
});

export const fireSubmitSwal = async (patient: IPatient) => Swal.fire({
  text: translate("cancerLibraryApp.patientTableEditor.reviewButton.submitPopup.title", {
    name: patient.ptNm,
    no: patient.ptNo
  }),
  showCancelButton: true,
  confirmButtonText: translate("cancerLibraryApp.patientTableEditor.reviewButton.confirm"),
  cancelButtonText: translate("cancerLibraryApp.patientTableEditor.reviewButton.cancel"),
});


export const fireDeclineReasonSwal = (patient: IPatient) => Swal.fire({
  text: translate("cancerLibraryApp.patientTableEditor.reviewButton.declineReasonPopup.title", {
    name: patient.ptNm,
    no: patient.ptNo
  }),
  input: 'textarea',
  inputValue: patient ? patient.comment : "",
  showCancelButton: true,
  showConfirmButton: false,
  cancelButtonText: translate("cancerLibraryApp.patientTableEditor.reviewButton.cancel"),
  customClass: {
    container: 'swal2-wide-textarea-container',
  },
});

