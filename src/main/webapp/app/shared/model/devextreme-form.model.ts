export interface IEntityForm {
  itemType? : string;
  colCount? : number;
  colSpan? : number;

  itemField? : string;
  caption? : string;
  editorType? : string;
  editorOptions? : {
    displayExpr? : string,
    valueExpr? : string,
  };
  child? : Array<IEntityForm>
}
