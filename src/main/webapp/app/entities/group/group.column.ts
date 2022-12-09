import {IDxColumn} from "app/shared/model/dx-column.model";

const GroupColumns: IDxColumn[] = [
  {dataField: "id"},
  {dataField: "title"},
  {dataField: "activated"},
  {dataField: "orderNo"},
  {dataField: "category.title"},
  {dataField: "createdBy"},
  {dataField: "createdDate", dataType: "datetime", format: "yyyy-MM-dd HH:mm:ss"},
  {dataField: "lastModifiedBy"},
  {dataField: "lastModifiedDate", dataType: "datetime", format: "yyyy-MM-dd HH:mm:ss"}
];

export default GroupColumns;
