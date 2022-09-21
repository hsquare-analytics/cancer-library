import {ITopic} from "app/shared/model/topic.model";
import {
  IAbstractAuditing,
  defaultValue as abstractAuditingDefaultValue
} from "app/shared/model/abstract-auditing.model";

export interface ICategory extends IAbstractAuditing {
  id?: number;
  title?: string;
  description?: string;
  dateColumn?: string | null;
  activated?: boolean;
  orderNo?: number;
  topic?: ITopic;
}

export const defaultValue: Readonly<ICategory> = {
  activated: false,
  ...abstractAuditingDefaultValue
};
