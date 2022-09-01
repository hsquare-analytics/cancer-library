import {ILibrary} from "app/shared/model/library.model";
import {IUser} from "app/shared/model/user.model";
import {ICategory} from "app/shared/model/category.model";

export interface IUserCategory {
  id?: number;
  user?: IUser;
  category?: ICategory;
  activated?: boolean;
  termStart?: Date;
  termEnd?: Date;
}

export const defaultValue: Readonly<IUserCategory> = {
  activated: false,
  termStart: new Date(Date.now()),
  termEnd: new Date(Date.now()),
};
