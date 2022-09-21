import {IGroup} from "app/shared/model/group.model";
import {
  defaultValue as abstractAuditingDefaultValue,
  IAbstractAuditing
} from "app/shared/model/abstract-auditing.model";

export interface IItem extends IAbstractAuditing {
  id?: any;
  title?: string;
  description?: string;
  activated?: boolean;
  group?: IGroup;
  itemAttribute?: { dataType: string };
  itemProperty?: { visibleIndex: number };
}

export const defaultValue: Readonly<IItem> = {
  id: '',
  title: '',
  description: '',
  activated: false,
  group: null,
  itemAttribute: {dataType: ''},
  itemProperty: {visibleIndex: 0},
  ...abstractAuditingDefaultValue
};
