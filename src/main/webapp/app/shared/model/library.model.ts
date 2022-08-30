export interface ILibrary {
  id?: number;
  title?: string;
  description?: string | null;
  activated?: boolean;
}

export const defaultValue: Readonly<ILibrary> = {
  activated: false,
};
