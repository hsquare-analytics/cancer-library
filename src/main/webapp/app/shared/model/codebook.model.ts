export interface ICodebook {
  id?: number;
  title?: string;
  description?: string | null;
  lookupList?: { title: string, description: string }[];
}

export const defaultValue: Readonly<ICodebook> = {};
