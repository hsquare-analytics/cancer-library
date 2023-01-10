import {updateBulkStatus} from "app/modules/datasource-editor/reducer/datasource.patient.reducer";
import Swal from "sweetalert2";
import {translate} from "react-jhipster";
import {PatientStatus} from "app/config/datasource-constants";

interface IOnClickUpdateBulkStatusProps {
  dispatch: any;
  dataGridRef: any;
  status: string;
}


const getI18nKey = (status: string) => {
  switch (status) {
    case PatientStatus.REVIEW_APPROVED:
      return "cancerLibraryApp.patient.bulkApprove";
    case PatientStatus.REVIEW_DECLINED:
      return "cancerLibraryApp.patient.bulkDecline";
    default:
      return "";
  }
}
export const onClickUpdateBulkStatus = (props: IOnClickUpdateBulkStatusProps) => {
  const {dispatch, dataGridRef, status} = props;

  Swal.fire({
    title: translate(getI18nKey(status) + ".title"),
    text: translate(getI18nKey(status) + ".text", {param: dataGridRef.current.instance.getSelectedRowKeys().length}),
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: translate('global.action.confirm'),
    cancelButtonText: translate('global.action.cancel')
  }).then((result) => {
    if (result.value) {
      dispatch(updateBulkStatus({
        ptNos: dataGridRef.current.instance.getSelectedRowKeys().map(data => data.ptNo),
        status
      }));
      dataGridRef.current.instance.clearSelection();
    }
  })

};

