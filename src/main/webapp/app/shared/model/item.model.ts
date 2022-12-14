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
  orderNo?: number;
  category?: ICategory;
  codebook?: ICodebook;
  attribute?: { caption?: string, required: boolean, dataType?: string, format?: string, maxLength?: number, allowEditing: boolean };
  property?: { sortIndex: number, sortDirection: string, visible: boolean, labelColumn: string, cssClass: string, };
}

export const defaultValue: Readonly<IItem> = {
  id: '',
  title: '',
  description: '',
  activated: false,
  orderNo: 0,
  category: null,
  codebook: null,
  attribute: {
    caption: '',
    required: true,
    dataType: '',
    format: '',
    maxLength: 0,
    allowEditing: true
  },
  property: {
    sortIndex: 0,
    sortDirection: '',
    visible: true,
    labelColumn: '',
    cssClass: ''
  },
  ...abstractAuditingDefaultValue
};
