import {IDxColumn} from "app/shared/model/dx-column.model";

const UserPatientColumns: IDxColumn[] = [
  {dataField: "id"},
  {dataField: "user.login"},
  {dataField: "patientNo"},
  {dataField: "createdBy"},
  {dataField: "createdDate", dataType: "datetime", format: "yyyy-MM-dd HH:mm:ss"},
  {dataField: "lastModifiedBy"},
  {dataField: "lastModifiedDate", dataType: "datetime", format: "yyyy-MM-dd HH:mm:ss"}
];

export default UserPatientColumns;
