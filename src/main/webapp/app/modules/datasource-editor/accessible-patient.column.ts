import {IDxColumn} from "app/shared/model/dx-column.model";

const AccessiblePatientColumn: IDxColumn[] = [
  {
    dataField: "ptNo",
    caption: "cancerLibraryApp.patient.ptNo",
  },
  {
    dataField: "ptNm",
    caption: "cancerLibraryApp.patient.ptNm",
  },
  {
    dataField: "sexTpCd",
    caption: "cancerLibraryApp.patient.sexTpCd",
  },
  {
    dataField: "ptBrdyDt",
    caption: "cancerLibraryApp.patient.ptBrdyDt",
  },
  // {
  //   dataField: "hspTpCd",
  //   caption: "cancerLibraryApp.patient.hspTpCd",
  // },
  {
    dataField: "gid",
    caption: "cancerLibraryApp.patient.gid",
  },
  // {
  //   dataField: "fsrMedDt",
  //   caption: "cancerLibraryApp.patient.fsrMedDt",
  //   dataType: "date",
  //   format: "yyyy-MM-dd",
  // },
  {
    dataField: "idxDt",
    caption: "cancerLibraryApp.patient.idxDt",
    dataType: "date",
    format: "yyyy-MM-dd",
    sortOrder: "desc",
    sortIndex: 1,
  },
  {
    dataField: "crtnDt",
    caption: "cancerLibraryApp.patient.crtnDt",
    dataType: "date",
    format: "yyyy-MM-dd",
  },
  {
    dataField: "detail.createdBy",
    caption: "cancerLibraryApp.patient.detail.createdBy",
  },
  {
    dataField: "detail.createdDate",
    caption: "cancerLibraryApp.patient.detail.createdDate",
    dataType: "datetime",
    format: "yyyy-MM-dd HH:mm:ss",
  },
  {
    dataField: "detail.lastModifiedBy",
    caption: "cancerLibraryApp.patient.detail.lastModifiedBy",
  },
  {
    dataField: "detail.lastModifiedDate",
    caption: "cancerLibraryApp.patient.detail.lastModifiedDate",
    dataType: "datetime",
    format: "yyyy-MM-dd HH:mm:ss",
    sortOrder: "desc",
    sortIndex: 0,
  }
];

export default AccessiblePatientColumn;
