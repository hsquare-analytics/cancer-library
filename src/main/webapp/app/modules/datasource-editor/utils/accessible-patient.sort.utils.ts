import {PatientStatus} from "app/config/datasource-constants";

export const getAccessiblePatientStatusSortValue = isSudoUser => data => {
  return isSudoUser ? getSudoUserSortValue(data) : getNormalUserSortValue(data);
}

const getSudoUserSortValue = data => {
  switch (data.detail.status) {
    case PatientStatus.REVIEW_SUBMITTED:
      return 1;
    case PatientStatus.REVIEW_DECLINED:
      return 2;
    case PatientStatus.REVIEW_APPROVED:
      return 3;
    default:
      return 4;
  }
}

const getNormalUserSortValue = (data: any) => {
  switch (data.detail.status) {
    case  PatientStatus.REVIEW_DECLINED:
      return 1;
    case  PatientStatus.REVIEW_SUBMITTED:
      return 2;
    case  PatientStatus.REVIEW_APPROVED:
      return 3;
    default:
      return 4;
  }
}
