import {ITopic} from "app/shared/model/topic.model";
import {
  defaultValue as abstractAuditingDefaultValue,
  IAbstractAuditing
} from "app/shared/model/abstract-auditing.model";

export interface ICategory extends IAbstractAuditing {
  id?: any;
  title?: string;
  description?: string;
  activated?: boolean;
  orderNo?: number;
  attribute?: { dateColumn?: string, caption?: string, autoincrementField?: string };
  topic?: ITopic;
}

export const defaultValue: Readonly<ICategory> = {
  id: '',
  title: '',
  description: '',
  orderNo: 0,
  activated: false,
  attribute: {dateColumn: '', caption: '', autoincrementField: ''},
  topic: null,
  ...abstractAuditingDefaultValue
};
