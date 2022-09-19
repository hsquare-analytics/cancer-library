export interface IEntityColumn {
  dataField?: string;
  caption?: string;
  dataType? : string;
  visible? : boolean;
  format? : string;
  value? : string | boolean;
  required? : boolean;
  width? : number;
  fixed? : true;
  translate? : string;
  alignment? : string;
  child? : Array<IEntityColumn>;
}
