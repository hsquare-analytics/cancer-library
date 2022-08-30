export interface ICategory {
  id?: number;
  title?: string;
  description?: string | null;
  activated?: boolean;
}

export const defaultValue: Readonly<ICategory> = {
  activated: false,
};
