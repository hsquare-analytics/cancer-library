import {IDxColumn} from "app/shared/model/dx-column.model";

const AccessiblePatientColumn: IDxColumn[] = [
  {
    dataField: "ptNo",
    caption: "cancerLibraryApp.patient.ptNo",
    visibleIndex: 3,
  },
  {
    dataField: "ptNm",
    caption: "cancerLibraryApp.patient.ptNm",
    visibleIndex: 4,
  },
  {
    dataField: "sexTpCd",
    caption: "cancerLibraryApp.patient.sexTpCd",
    visibleIndex: 5,
  },
  {
    dataField: "ptBrdyDt",
    caption: "cancerLibraryApp.patient.ptBrdyDt",
    visibleIndex: 6,
  },
  {
    dataField: "gid",
    caption: "cancerLibraryApp.patient.gid",
    visibleIndex: 7,
  },
  {
    dataField: "fsrMedDt",
    caption: "cancerLibraryApp.patient.fsrMedDt",
    dataType: "date",
    format: "yyyy-MM-dd",
    visibleIndex: 8,
  },
  {
    dataField: "idxDt",
    caption: "cancerLibraryApp.patient.idxDt",
    dataType: "date",
    format: "yyyy-MM-dd",
    visibleIndex: 9,
  },
  {
    dataField: "crtnDt",
    caption: "cancerLibraryApp.patient.crtnDt",
    dataType: "date",
    format: "yyyy-MM-dd",
    visibleIndex: 10,
  },
  {
    dataField: "detail.createdDate",
    caption: "cancerLibraryApp.patient.detail.createdDate",
    dataType: "datetime",
    format: "yyyy-MM-dd HH:mm:ss",
    visibleIndex: 12,
    sortIndex: 1,
    sortOrder: "asc"
  },
  {
    dataField: "detail.lastModifiedDate",
    caption: "cancerLibraryApp.patient.detail.lastModifiedDate",
    dataType: "datetime",
    format: "yyyy-MM-dd HH:mm:ss",
    visibleIndex: 14,
  }
];

export default AccessiblePatientColumn;
