export interface ICodebook {
  id?: number;
  title?: string;
  description?: string | null;
}

export const defaultValue: Readonly<ICodebook> = {};
