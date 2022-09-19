import {IGroup} from "app/shared/model/group.model";

export interface IItem {
  id?: number;
  title?: string;
  description?: string | null;
  activated?: boolean;
  group?: IGroup;
  itemAttribute?: {type: string};
  createdBy?: string;
  createdDate?: Date | null;
  lastModifiedBy?: string;
  lastModifiedDate?: Date | null;

}

export const defaultValue: Readonly<IItem> = {
  activated: false,
  createdBy: '',
  createdDate: null,
  lastModifiedBy: '',
  lastModifiedDate: null,
};
