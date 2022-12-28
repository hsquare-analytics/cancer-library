import {REVIEW_LIST} from "app/config/datasource-constants";

export const getAccessiblePatientStatusSortValue = isSudoUser => data => {
  return isSudoUser ? getSudoUserSortValue(data) : getNormalUserSortValue(data);
}

const getSudoUserSortValue = data => {
  switch (data.detail.status) {
    case REVIEW_LIST.SUBMITTED:
      return 1;
    case REVIEW_LIST.DECLINED:
      return 2;
    case REVIEW_LIST.APPROVED:
      return 3;
  }
}

const getNormalUserSortValue = (data: any) => {
  switch (data.detail.status) {
    case  REVIEW_LIST.DECLINED:
      return 1;
    case  REVIEW_LIST.SUBMITTED:
      return 2;
    case  REVIEW_LIST.APPROVED:
      return 3;
    default:
      return 4;
  }
}
