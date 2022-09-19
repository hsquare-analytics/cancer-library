import {ICategory} from "app/shared/model/category.model";

export interface IGroup {
  id?: number;
  title?: string;
  activated?: boolean;
  orderNo?: number;
  category?: ICategory;
  createdBy?: string;
  createdDate?: Date | null;
  lastModifiedBy?: string;
  lastModifiedDate?: Date | null;
}

export const defaultValue: Readonly<IGroup> = {
  activated: false,
  createdBy: '',
  createdDate: null,
  lastModifiedBy: '',
  lastModifiedDate: null,
};
