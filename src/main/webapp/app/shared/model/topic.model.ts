import {ISubject} from "app/shared/model/subject.model";

export interface ITopic {
  id?: number;
  title?: string;
  activated?: boolean;
  orderNo?: number;
  loadDtm?: Date;
  subject?: ISubject;
}

export const defaultValue: Readonly<ITopic> = {
  activated: false,
};
