import {
  defaultValue as abstractAuditingDefaultValue,
  IAbstractAuditing
} from "app/shared/model/abstract-auditing.model";

export interface IPatientDetail extends IAbstractAuditing {
  comment?: string;
  declineReason?: string;
  status?: string;
  standardDate?: Date;
}

export interface IPatient extends IAbstractAuditing {
  ptNo?: string;
  ptNm?: string;
  sexTpCd?: string;
  ptBrdyDt?: string;
  hspTpCd?: string;
  gid?: string;
  fsrMedDt?: Date;
  idxDt?: Date;
  crtdDt?: Date;
  detail?: IPatientDetail;
}

export const defaultValue: Readonly<IPatient> = {
  ptNo: "",
  ptNm: "",
  sexTpCd: "",
  ptBrdyDt: "",
  hspTpCd: "",
  gid: "",
  fsrMedDt: null,
  idxDt: null,
  crtdDt: null,
  detail: {
    comment: "",
    declineReason: "",
    status: "",
    standardDate: null,
    ...abstractAuditingDefaultValue,
  }
};
