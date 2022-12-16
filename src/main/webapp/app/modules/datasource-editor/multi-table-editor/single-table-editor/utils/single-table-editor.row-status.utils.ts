import {DATASOURCE_ROW_STATUS, RowStatus} from "app/config/datasource-constants";
import {
  createDatasourceRow,
  updateDatasourceRow
} from "app/modules/datasource-editor/reducer/datasource.container.reducer";
import Swal, {SweetAlertOptions} from 'sweetalert2';
import {translate} from 'react-jhipster';
import {useAppDispatch} from "app/config/store";
import {ICategory} from "app/shared/model/category.model";
import axios from "axios";


const getSwalCommonOptions = () => {
  return {
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: translate('cancerLibraryApp.datasourceEditor.singleTableEditor.rowStatus.button.confirm'),
    cancelButtonText: translate('cancerLibraryApp.datasourceEditor.singleTableEditor.rowStatus.button.cancel')
  }
}

const updateRowStatus = (dispatchHook, category: ICategory, row: any, status: RowStatus) => {
  axios.get(`/api/datasource/categories/${category.id}/rows/${row.idx}/check-updated-row-exist`).then(({data}) => {
    const payload = {
      categoryId: category.id,
      row: {
        ...row,
        [DATASOURCE_ROW_STATUS]: status
      }
    }

    if (data) {
      dispatchHook(updateDatasourceRow(payload));
    } else {
      dispatchHook(createDatasourceRow(payload));
    }
  });
};

export const transformAsInProgress = (dispatchHook, category: ICategory, row: any) => {
  Swal.fire(Object.assign({}, getSwalCommonOptions(), {
    text: translate('cancerLibraryApp.datasourceEditor.singleTableEditor.transformAsInProgress.title'),
  }) as SweetAlertOptions).then((result) => {
    if (result.isConfirmed) {
      updateRowStatus(dispatchHook, category, row, RowStatus.IN_PROGRESS);
    }
  });
};

export const transformAsCompleted = (dispatchHook, category: ICategory, row: any) => {
  Swal.fire(Object.assign({}, getSwalCommonOptions(), {
    text: translate('cancerLibraryApp.datasourceEditor.singleTableEditor.transformAsCompleted.title'),
  }) as SweetAlertOptions).then((result) => {
    if (result.isConfirmed) {
      updateRowStatus(dispatchHook, category, row, RowStatus.COMPLETED);
    }
  });
}
