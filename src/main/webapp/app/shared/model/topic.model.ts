import {ISubject} from "app/shared/model/subject.model";
import {
  defaultValue as abstractAuditingDefaultValue,
  IAbstractAuditing
} from "app/shared/model/abstract-auditing.model";


export interface ITopic extends IAbstractAuditing {
  id?: any;
  title?: string;
  activated?: boolean;
  orderNo?: number;
  subject?: ISubject;
}

export const defaultValue: Readonly<ITopic> = {
  id : '',
  title : '',
  activated : false,
  orderNo : 0,
  subject : null,
  ...abstractAuditingDefaultValue
};
