import {DATASOURCE_ROW_STATUS, RowStatus} from "app/config/datasource-constants";
import {
  createDatasourceRow,
  updateDatasourceRow
} from "app/modules/datasource-editor/reducer/datasource.container.reducer";
import Swal, {SweetAlertOptions} from 'sweetalert2';
import {translate} from 'react-jhipster';
import {ICategory} from "app/shared/model/category.model";
import axios from "axios";


const getSwalCommonOptions = () => {
  return {
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: translate('cancerLibraryApp.singleTableEditor.rowStatus.button.confirm'),
    cancelButtonText: translate('cancerLibraryApp.singleTableEditor.rowStatus.button.cancel')
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
    text: translate('cancerLibraryApp.singleTableEditor.transformAsInProgress.title'),
  }) as SweetAlertOptions).then((result) => {
    if (result.isConfirmed) {
      updateRowStatus(dispatchHook, category, row, RowStatus.IN_PROGRESS);
    }
  });
};

export const transformAsCompleted = (dispatchHook, category: ICategory, row: any) => {
  Swal.fire(Object.assign({}, getSwalCommonOptions(), {
    text: translate('cancerLibraryApp.singleTableEditor.transformAsCompleted.title'),
  }) as SweetAlertOptions).then((result) => {
    if (result.isConfirmed) {
      updateRowStatus(dispatchHook, category, row, RowStatus.COMPLETED);
    }
  });
}

export const transformAsDisabled = (dispatchHook, category: ICategory, row: any) => {
  Swal.fire(Object.assign({}, getSwalCommonOptions(), {
    text: translate('cancerLibraryApp.singleTableEditor.transformAsDisabled.title'),
  }) as SweetAlertOptions).then((result) => {
    if (result.isConfirmed) {
      updateRowStatus(dispatchHook, category, row, RowStatus.DISABLED);
    }
  });
}

export const transformAsRejected = (dispatchHook, category: ICategory, row: any) => {
  Swal.fire(Object.assign({}, getSwalCommonOptions(), {
    text: translate('cancerLibraryApp.singleTableEditor.transformAsRejected.title'),
  }) as SweetAlertOptions).then((result) => {
    if (result.isConfirmed) {
      updateRowStatus(dispatchHook, category, row, RowStatus.REJECTED);
    }
  });
}


export const getCustomizeRowStatusText = (cellInfo) => {
  switch (cellInfo.value) {
    case RowStatus.COMPLETED:
      return "COMP";
    case RowStatus.DISABLED:
      return "DEL";
    case RowStatus.NOT_STARTED:
      return "NEW";
    case RowStatus.IN_PROGRESS:
      return "WIP";
    case RowStatus.REJECTED:
      return "RJCT";
    default:
      return "NEW";
  }
}
