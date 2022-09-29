import {IUser} from "app/shared/model/user.model";
import {
    defaultValue as abstractAuditingDefaultValue,
    IAbstractAuditing
} from "app/shared/model/abstract-auditing.model";

export interface IUserPatient extends IAbstractAuditing {
    id?: any;
    user?: IUser;
    patientNo?: string | null;
}

export const defaultValue: Readonly<IUserPatient> = {
    id: '',
    user: null,
    patientNo: null,
    ...abstractAuditingDefaultValue
};
