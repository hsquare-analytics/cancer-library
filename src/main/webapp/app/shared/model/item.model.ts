import {IGroup} from "app/shared/model/group.model";
import {
  IAbstractAuditing,
  defaultValue as abstractAuditingDefaultValue
} from "app/shared/model/abstract-auditing.model";

export interface IItem extends IAbstractAuditing {
  id?: number;
  title?: string;
  description?: string | null;
  activated?: boolean;
  group?: IGroup;
  itemAttribute?: { type: string };
}

export const defaultValue: Readonly<IItem> = {
  activated: false,
  ...abstractAuditingDefaultValue
};
