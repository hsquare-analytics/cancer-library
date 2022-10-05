import {IDxColumn} from "app/shared/model/dx-column.model";

const PatientTableEditorColumn: IDxColumn[] = [
  {
    dataField: "pactId",
    caption: "Pact Id",
  },
  {
    dataField: "ptNo",
    caption: "Pt No",
  },
  {
    dataField: "ptNm",
    caption: "Pt Nm",
  },
  {
    dataField: "sexTpCd",
    caption: "Sex Tp Cd"
  },
  {
    dataField: "ptBrdyDt",
    caption: "Pt Brdy Dt"
  },
  {
    dataField: "hspTpCd",
    caption: "Hsp Tp Cd"
  },
  {
    dataField: "idxDt",
    caption: "Idx Dt"
  }
];

export default PatientTableEditorColumn;
