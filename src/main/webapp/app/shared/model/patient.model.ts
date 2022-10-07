import {
  defaultValue as abstractAuditingDefaultValue,
  IAbstractAuditing
} from "app/shared/model/abstract-auditing.model";

export interface IPatient extends IAbstractAuditing {
  ptNo?: string;
  ptNm?: string;
  sexTpCd?: string;
  ptBrdyDt?: string;
  hspTpCd?: string;
  idxDt?: Date;
  status?: string;

}

export const defaultValue: Readonly<IPatient> = {
  ptNo: "",
  ptNm: "",
  sexTpCd: "",
  ptBrdyDt: "",
  hspTpCd: "",
  idxDt: new Date(),
  status: "",
  ...abstractAuditingDefaultValue
};
