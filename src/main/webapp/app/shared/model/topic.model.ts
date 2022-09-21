import {ISubject} from "app/shared/model/subject.model";
import {
  IAbstractAuditing,
  defaultValue as abstractAuditingDefaultValue
} from "app/shared/model/abstract-auditing.model";


export interface ITopic extends IAbstractAuditing {
  id?: number;
  title?: string;
  activated?: boolean;
  orderNo?: number;
  subject?: ISubject;
}

export const defaultValue: Readonly<ITopic> = {
  activated: false,
  ...abstractAuditingDefaultValue
};
