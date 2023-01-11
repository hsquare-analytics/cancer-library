import {ICategory} from "app/shared/model/category.model";
import {IPatient} from "app/shared/model/patient.model";
import {DATASOURCE_ROW_STATUS, PATIENT_NO, RowStatus} from "app/config/datasource-constants";
import {createDatasourceRow} from "app/modules/datasource-editor/reducer/datasource.container.reducer";
import Swal from "sweetalert2";
import {translate} from "react-jhipster";

interface ISingleTableEditorRowInsertingUtilsProps {
  e: any;
  dispatch: any;
  category: ICategory;
  patient: IPatient;
}

const SingleTableEditorRowInsertingUtils = (props: ISingleTableEditorRowInsertingUtilsProps) => {
  const {e, category, patient} = props;
  const row = Object.assign({}, e.data, {
      [PATIENT_NO]: patient.ptNo,
      [DATASOURCE_ROW_STATUS]: RowStatus.COMPLETED
    }
  );

  Swal.fire({
    text: translate('cancerLibraryApp.singleTableEditor.editForm.confirmInsert'),
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
  }).then((result) => {
    if (result.value) {
      props.dispatch(createDatasourceRow({categoryId: category.id, row}));
    }
  });
}

export default SingleTableEditorRowInsertingUtils;
