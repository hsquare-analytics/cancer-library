export interface IItem {
  id?: number;
  title?: string;
  description?: string | null;
  activated?: boolean;
}

export const defaultValue: Readonly<IItem> = {
  activated: false,
};
