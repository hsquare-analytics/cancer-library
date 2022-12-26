import {REVIEW_LIST} from "app/config/datasource-constants";
import {IPatient} from "app/shared/model/patient.model";

export const canEditDatasource = (patient: IPatient) => {
  if (!patient.detail || !patient.detail.status) {
    return true;
  }

  if (patient.detail.status === REVIEW_LIST.DECLINED) {
    return true;
  }

  return false;
};

export const canNotEditDatasource = (patient: IPatient) => {
  return !canEditDatasource(patient);
};
