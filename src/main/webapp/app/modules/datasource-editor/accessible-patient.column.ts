import {IDxColumn} from "app/shared/model/dx-column.model";

const AccessiblePatientColumn: IDxColumn[] = [
  {
    dataField: "ptNo",
  },
  {
    dataField: "ptNm",
  },
  {
    dataField: "sexTpCd",
  },
  {
    dataField: "ptBrdyDt",
  },
  {
    dataField: "hspTpCd",
  },
  {
    dataField: "createdBy",
  },
  {
    dataField: "createdDate",
    dataType: "datetime",
    format: "yyyy-MM-dd HH:mm:ss",
  },
  {
    dataField: "lastModifiedBy",
  },
  {
    dataField: "lastModifiedDate",
    dataType: "datetime",
    format: "yyyy-MM-dd HH:mm:ss",
  }
];

export default AccessiblePatientColumn;
