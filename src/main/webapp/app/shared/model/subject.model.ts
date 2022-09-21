import {
  defaultValue as abstractAuditingDefaultValue,
  IAbstractAuditing
} from "app/shared/model/abstract-auditing.model";


export interface ISubject extends IAbstractAuditing {
  id?: any;
  title?: string;
  activated?: boolean;
  orderNo?: number;
}

export const defaultValue: Readonly<ISubject> = {
  id: '',
  title: '',
  activated: false,
  orderNo: 0,
  ...abstractAuditingDefaultValue
};
