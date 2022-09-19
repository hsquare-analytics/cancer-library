import {ITopic} from "app/shared/model/topic.model";

export interface ICategory {
  id?: number;
  title?: string;
  description?: string;
  dateColumn?: string | null;
  activated?: boolean;
  orderNo?: number;
  topic?: ITopic;
  createdBy?: string;
  createdDate?: Date | null;
  lastModifiedBy?: string;
  lastModifiedDate?: Date | null;
}

export const defaultValue: Readonly<ICategory> = {
  activated: false,
  createdBy: '',
  createdDate: null,
  lastModifiedBy: '',
  lastModifiedDate: null,
};
