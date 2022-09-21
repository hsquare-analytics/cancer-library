import {ICategory} from "app/shared/model/category.model";
import {
  IAbstractAuditing,
  defaultValue as abstractAuditingDefaultValue
} from "app/shared/model/abstract-auditing.model";

export interface IGroup extends IAbstractAuditing {
  id?: number;
  title?: string;
  activated?: boolean;
  orderNo?: number;
  category?: ICategory;
}

export const defaultValue: Readonly<IGroup> = {
  activated: false,
  ...abstractAuditingDefaultValue
};
