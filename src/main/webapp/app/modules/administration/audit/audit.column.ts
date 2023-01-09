import {IDxColumn} from "app/shared/model/dx-column.model";

const Audit: IDxColumn[] = [
  {dataField: 'id'},
  {dataField: 'principal'},
  {dataField: 'auditEventDate', dataType: 'datetime', format: 'yyyy-MM-dd HH:mm:ss'},
  {dataField: 'auditEventType'},
  {dataField: 'data'},
];

export default Audit;
