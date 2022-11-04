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
  property?: { visibleIndex?: number, caption?: string, allowEditing: boolean, required: boolean, format?: string, sortIndex: number, sortDirection: string };
  lookupList?: { title: string, description: string }[];
}

export const defaultValue: Readonly<IItem> = {
  id: '',
  title: '',
  description: '',
  activated: false,
  category: null,
  attribute: {dataType: ''},
  property: {visibleIndex: 0, caption: '', allowEditing: true, required: true, format: '', sortIndex: 0, sortDirection: ''},
  lookupList: [],
  ...abstractAuditingDefaultValue
};
