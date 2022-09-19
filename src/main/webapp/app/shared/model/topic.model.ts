import {ISubject} from "app/shared/model/subject.model";

export interface ITopic {
  id?: number;
  seq?: number;
  name?: string;
  activated?: boolean;
  loadDtm?: Date;
  subject?: ISubject;
}

export const defaultValue: Readonly<ITopic> = {
  activated: false,
};
