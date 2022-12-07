import {
  defaultValue as abstractAuditingDefaultValue,
  IAbstractAuditing
} from "app/shared/model/abstract-auditing.model";

export interface IPatientDetail extends IAbstractAuditing {
  comment?: string;
  declineReason?: string;
  status?: string;
}

export interface IPatient extends IAbstractAuditing {
  ptNo?: string;
  ptNm?: string;
  sexTpCd?: string;
  ptBrdyDt?: string;
  hspTpCd?: string;
  idxDt?: Date;
  detail?: IPatientDetail;
}

export const defaultValue: Readonly<IPatient> = {
  ptNo: "",
  ptNm: "",
  sexTpCd: "",
  ptBrdyDt: "",
  hspTpCd: "",
  idxDt: new Date(),
  detail: {
    comment: "",
    declineReason: "",
    status: "",
    ...abstractAuditingDefaultValue,
  }
};
