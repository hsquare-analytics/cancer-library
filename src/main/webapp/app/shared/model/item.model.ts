import {ICategory} from "app/shared/model/category.model";

export interface IItem {
  id?: number;
  title?: string;
  description?: string | null;
  activated?: boolean;
  category?: ICategory;
  itemAttribute?: {type: string};
}

export const defaultValue: Readonly<IItem> = {
  activated: false,
};
