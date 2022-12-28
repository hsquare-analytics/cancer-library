import {DATASOURCE_IDX, DATASOURCE_ROW_STATUS, PATIENT_NO, RowStatus} from "app/config/datasource-constants";
import {
  createDatasourceRow,
  updateDatasourceRow
} from "app/modules/datasource-editor/reducer/datasource.container.reducer";
import axios from "axios";
import {ICategory} from "app/shared/model/category.model";
import {IPatient} from "app/shared/model/patient.model";

interface ISingleTableEditorRowUpdatingUtilsProps {
  e: any;

  dispatch: any;
  category: ICategory;
  patient: IPatient;
}

const SingleTableEditorRowUpdatingUtils = (props: ISingleTableEditorRowUpdatingUtilsProps) => {
  const {e, category, patient} = props;

  axios.get(`/api/datasource/categories/${category.id}/rows/${e.oldData.idx}/check-updated-row-exist`).then(({data}) => {
    if (data) {
      const row = Object.assign(
        {},
        {
          [DATASOURCE_IDX]: e.oldData.idx,
          [PATIENT_NO]: patient.ptNo,
          [DATASOURCE_ROW_STATUS]: RowStatus.COMPLETED
        },
        e.newData
      );
      props.dispatch(updateDatasourceRow({categoryId: category.id, row}));
    } else {
      const row = Object.assign({}, e.oldData, e.newData, {
        [DATASOURCE_ROW_STATUS]: RowStatus.COMPLETED
      });
      props.dispatch(createDatasourceRow({categoryId: category.id, row}));
    }
  });
}

export default SingleTableEditorRowUpdatingUtils;
