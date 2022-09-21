export interface IDxColumn {
  dataField?: string;
  caption?: string;
  dataType?: string;
  visible?: boolean;
  visibleIndex?: number;
  format?: string;
  allowEditing?: boolean;
  sortIndex?: number;
  sortOrder?: string;
  value?: string | boolean;
  required?: boolean;
  multiSelectionField?: boolean;
  width?: number;
  fixed?: true;
  validationRules?: Array<any>;
  editCellComponent?: boolean;
  translate?: string;
  lockUp?: string;
  defaultSortOrder?: string;
}
