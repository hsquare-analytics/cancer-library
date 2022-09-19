import {ITopic} from "app/shared/model/topic.model";

export interface ICategory {
  id?: number;
  seq?: number;
  name?: string;
  tableName?: string;
  indexDate?: string | null;
  activated?: boolean;
  loadDtm?: Date;
  topic?: ITopic;
}

export const defaultValue: Readonly<ICategory> = {
  activated: false,
};
