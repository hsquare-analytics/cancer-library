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
  itemAttribute?: { dataType?: string };
  itemProperty?: { visibleIndex?: number, caption?:string };
}

export const defaultValue: Readonly<IItem> = {
  id: '',
  title: '',
  description: '',
  activated: false,
  category: null,
  itemAttribute: {dataType: ''},
  itemProperty: {visibleIndex: 0, caption: ''},
  ...abstractAuditingDefaultValue
};
