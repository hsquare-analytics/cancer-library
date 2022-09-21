import {
  IAbstractAuditing,
  defaultValue as abstractAuditingDefaultValue
} from "app/shared/model/abstract-auditing.model";


export interface ISubject extends IAbstractAuditing {
  id?: number;
  title?: string;
  activated?: boolean;
  orderNo?: number;
}

export const defaultValue: Readonly<ISubject> = {
  activated: false,
  ...abstractAuditingDefaultValue
};
