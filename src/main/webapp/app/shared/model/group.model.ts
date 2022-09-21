import {ICategory} from "app/shared/model/category.model";
import {
  defaultValue as abstractAuditingDefaultValue,
  IAbstractAuditing
} from "app/shared/model/abstract-auditing.model";

export interface IGroup extends IAbstractAuditing {
  id?: any;
  title?: string;
  activated?: boolean;
  orderNo?: number;
  category?: ICategory;
}

export const defaultValue: Readonly<IGroup> = {
  id: '',
  title: '',
  activated: false,
  orderNo: 0,
  category: null,
  ...abstractAuditingDefaultValue
};
