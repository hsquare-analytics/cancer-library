import {IDxColumn} from "app/shared/model/dx-column.model";

const UserManagementColumns: IDxColumn[] = [
  {dataField: "id"},
  {dataField: "login"},
  {dataField: "name"},
  {dataField: "email"},
  {dataField: "activated"},
  {dataField: "langKey"},
  {dataField: "profiles"},
  {dataField: "createdBy"},
  {dataField: "createdDate", dataType: "datetime", format: "yyyy-MM-dd HH:mm:ss"},
  {dataField: "lastModifiedBy"},
  {dataField: "lastModifiedDate", dataType: "datetime", format: "yyyy-MM-dd HH:mm:ss"}
];

export default UserManagementColumns;
