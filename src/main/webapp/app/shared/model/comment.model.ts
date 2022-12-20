import {ISubject} from "app/shared/model/subject.model";
import {
  defaultValue as abstractAuditingDefaultValue,
  IAbstractAuditing
} from "app/shared/model/abstract-auditing.model";
import {ICategory} from "app/shared/model/category.model";


export interface IComment extends IAbstractAuditing {
  id?: any;
  ptNo?: string;
  rowId?: string;
  title?: string;
  category?: ICategory;
}

export const defaultValue: Readonly<IComment> = {
  id: '',
  ptNo: '',
  rowId: '',
  title: '',
  category: null,
  ...abstractAuditingDefaultValue
};
