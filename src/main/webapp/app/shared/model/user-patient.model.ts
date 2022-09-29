import {IUser} from "app/shared/model/user.model";

export interface IUserPatient {
  id?: number;
  user?: IUser;
  patientNo?: string | null;
}

export const defaultValue: Readonly<IUserPatient> = {};
