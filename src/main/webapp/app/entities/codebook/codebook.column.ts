import {IDxColumn} from "app/shared/model/dx-column.model";

const CodebookColumns: IDxColumn[] = [
  {dataField: "id"},
  {dataField: "title"},
  {dataField: "description"},
  {dataField: "createdBy"},
  {dataField: "createdDate", dataType: "datetime", format: "yyyy-MM-dd HH:mm:ss"},
  {dataField: "lastModifiedBy"},
  {dataField: "lastModifiedDate", dataType: "datetime", format: "yyyy-MM-dd HH:mm:ss"}
];

export default CodebookColumns;
