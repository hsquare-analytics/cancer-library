import {IDxColumn} from "app/shared/model/dx-column.model";

const CommentColumns: IDxColumn[] = [
  {dataField: "id"},
  {dataField: "ptNo"},
  {dataField: "rowId"},
  {dataField: "comment"},
  {dataField: "category.title"},
  {dataField: "createdBy"},
  {dataField: "createdDate", dataType: "datetime", format: "yyyy-MM-dd HH:mm:ss"},
  {dataField: "lastModifiedBy"},
  {dataField: "lastModifiedDate", dataType: "datetime", format: "yyyy-MM-dd HH:mm:ss"}
];

export default CommentColumns;
