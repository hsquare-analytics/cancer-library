import {IUser} from "app/shared/model/user.model";
import {ICategory} from "app/shared/model/category.model";

export interface IUserCategory {
  id?: any;
  user?: IUser;
  category?: ICategory;
  activated?: boolean;
  termStart?: Date;
  termEnd?: Date;
}

export const defaultValue: Readonly<IUserCategory> = {
  id: '',
  user: null,
  category: null,
  activated: false,
  termStart: null,
  termEnd: null,
};
