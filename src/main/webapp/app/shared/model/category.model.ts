import {ILibrary} from "app/shared/model/library.model";

export interface ICategory {
  id?: number;
  title?: string;
  description?: string | null;
  activated?: boolean;
  library?: ILibrary;
}

export const defaultValue: Readonly<ICategory> = {
  activated: false,
};
