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
  attribute?: { caption?: string, required: boolean, dataType?: string, format?: string, };
  property?: { allowEditing: boolean, sortIndex: number, sortDirection: string, visible: boolean, labelColumn: string };
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
    format: ''
  },
  property: {
    allowEditing: true,
    sortIndex: 0,
    sortDirection: '',
    visible: true,
    labelColumn: ''
  },
  ...abstractAuditingDefaultValue
};
