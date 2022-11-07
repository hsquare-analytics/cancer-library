import {
  defaultValue as abstractAuditingDefaultValue,
  IAbstractAuditing
} from "app/shared/model/abstract-auditing.model";
import {ICategory} from "app/shared/model/category.model";
import {ICodebook} from "app/shared/model/codebook.model";

export interface IItem extends IAbstractAuditing {
  id?: any;
  title?: string;
  description?: string;
  activated?: boolean;
  category?: ICategory;
  codebook?: ICodebook;
  attribute?: { dataType?: string };
  property?: { visibleIndex?: number, caption?: string, allowEditing: boolean, required: boolean, format?: string, sortIndex: number, sortDirection: string };
}

export const defaultValue: Readonly<IItem> = {
  id: '',
  title: '',
  description: '',
  activated: false,
  category: null,
  codebook: null,
  attribute: {dataType: ''},
  property: {visibleIndex: 0, caption: '', allowEditing: true, required: true, format: '', sortIndex: 0, sortDirection: ''},
  ...abstractAuditingDefaultValue
};
