import {ITopic} from "app/shared/model/topic.model";
import {
  defaultValue as abstractAuditingDefaultValue,
  IAbstractAuditing
} from "app/shared/model/abstract-auditing.model";

export interface ICategory extends IAbstractAuditing {
  id?: any;
  title?: string;
  description?: string;
  dateColumn?: string;
  activated?: boolean;
  orderNo?: number;
  topic?: ITopic;
}

export const defaultValue: Readonly<ICategory> = {
  id: '',
  title: '',
  description: '',
  dateColumn: '',
  orderNo: 0,
  activated: false,
  topic: null,
  ...abstractAuditingDefaultValue
};
