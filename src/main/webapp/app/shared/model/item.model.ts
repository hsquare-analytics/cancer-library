import {
  defaultValue as abstractAuditingDefaultValue,
  IAbstractAuditing
} from "app/shared/model/abstract-auditing.model";
import {ICategory} from "app/shared/model/category.model";

export interface IItem extends IAbstractAuditing {
  id?: any;
  title?: string;
  description?: string;
  activated?: boolean;
  category?: ICategory;
  attribute?: { dataType?: string };
  property?: { visibleIndex?: number, caption?:string };
  lookup?: string[];
}

export const defaultValue: Readonly<IItem> = {
  id: '',
  title: '',
  description: '',
  activated: false,
  category: null,
  attribute: {dataType: ''},
  property: {visibleIndex: 0, caption: ''},
  lookup: [],
  ...abstractAuditingDefaultValue
};
