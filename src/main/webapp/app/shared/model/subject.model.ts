export interface ISubject {
  id?: number;
  seq?: number;
  name?: string;
  activated?: boolean;
  loadDtm?: Date;
}

export const defaultValue: Readonly<ISubject> = {
  activated: false,
};
