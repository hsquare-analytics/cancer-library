import {IDxColumn} from "app/shared/model/dx-column.model";

const AuditColumns: IDxColumn[] = [
  {dataField: 'principal'},
  {
    dataField: 'timestamp', dataType: 'datetime', format: 'yyyy-MM-dd HH:mm:ss',
    sortIndex: 0, sortOrder: 'desc'
  },
  {dataField: 'type'},
  {dataField: 'data.message'},
  {dataField: 'data.type'}
];

export default AuditColumns;
