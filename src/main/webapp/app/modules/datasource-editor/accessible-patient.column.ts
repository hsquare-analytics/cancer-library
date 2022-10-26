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
  },
  {
    dataField: "lastModifiedBy",
  },
  {
    dataField: "lastModifiedDate",
    dataType: "datetime",
  }
];

export default AccessiblePatientColumn;
