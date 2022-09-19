export interface ISubject {
  id?: number;
  title?: string;
  activated?: boolean;
  orderNo?: number;
  createdBy?: string;
  createdDate?: Date | null;
  lastModifiedBy?: string;
  lastModifiedDate?: Date | null;
}

export const defaultValue: Readonly<ISubject> = {
  activated: false,
  createdBy: '',
  createdDate: null,
  lastModifiedBy: '',
  lastModifiedDate: null,
};
