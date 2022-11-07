export interface ICodebook {
  id?: number;
  title?: string;
  description?: string | null;
  lookupList?: { title: string, description: string, orderNo: number }[];
}

export const defaultValue: Readonly<ICodebook> = {};
