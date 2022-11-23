import {IDxColumn} from "app/shared/model/dx-column.model";

const ItemColumns: IDxColumn[] = [
  {dataField: "id"},
  {dataField: "title"},
  {dataField: "description"},
  {dataField: "activated"},
  {dataField: "category.title"},
  {dataField: "attribute.type"},
  {dataField: "codebook.title"},
  {dataField: "attribute.caption"},
  {dataField: "attribute.required"},
  {dataField: "attribute.format"},
  {dataField: "attribute.dataType"},
  {dataField: "property.allowEditing"},
  {dataField: "property.sortIndex"},
  {dataField: "property.sortDirection"},
  {dataField: "property.visible"},
  {dataField: "createdBy"},
  {dataField: "createdDate", dataType: "datetime", format: "yyyy-MM-dd HH:mm:ss"},
  {dataField: "lastModifiedBy"},
  {dataField: "lastModifiedDate", dataType: "datetime", format: "yyyy-MM-dd HH:mm:ss"}
];

export default ItemColumns;
