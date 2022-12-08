import React from 'react';
import Swal, {SweetAlertOptions} from 'sweetalert2';
import {useAppDispatch} from "app/config/store";
import {
  createDatasourceRow,
  deleteDatasourceRow,
  updateDatasourceRow
} from "app/modules/datasource-editor/reducer/datasource.container.reducer";
import {ICategory} from "app/shared/model/category.model";
import axios from "axios";
import Chip from '@mui/material/Chip';
import DoneIcon from '@mui/icons-material/Done';
import {translate} from 'react-jhipster';
import {RowStatus} from "app/config/datasource-constants";


export interface IDxRowConfirmCellRenderProps {
  row: any;
  category: ICategory;
  setEditorStatus: () => void;
}

const DxRowConfirmCellRender = (props: IDxRowConfirmCellRenderProps) => {
  const dispatch = useAppDispatch();

  const {row, category} = props;

  if (!row || !row.idx) {
    return null;
  }

  const SwalCommonOptions = {
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: translate('cancerLibraryApp.datasourceEditor.singleTableEditor.rowStatus.button.confirm'),
    cancelButtonText: translate('cancerLibraryApp.datasourceEditor.singleTableEditor.rowStatus.button.cancel')
  }

  const transformAsInProgress = () => {
    Swal.fire(Object.assign({}, SwalCommonOptions, {
      text: translate('cancerLibraryApp.datasourceEditor.singleTableEditor.transformAsInProgress.title'),
    }) as SweetAlertOptions).then((result) => {
      if (result.isConfirmed) {
        dispatch(deleteDatasourceRow({categoryId: category.id, row: {idx: row.idx, pt_no: row.pt_no}}));
      }
    });
  };

  const transformAsCompleted = () => {
    Swal.fire(Object.assign({}, SwalCommonOptions, {
      title: translate('cancerLibraryApp.datasourceEditor.singleTableEditor.transformAsCompleted.title'),
    }) as SweetAlertOptions).then((result) => {
      if (result.isConfirmed) {
        axios.get(`/api/datasource/categories/${category.id}/rows/${row.idx}/check-updated-row-exist`).then(({data}) => {
          if (data) {
            dispatch(updateDatasourceRow({categoryId: category.id, row}));
          } else {
            dispatch(createDatasourceRow({categoryId: category.id, row}));
          }
        });
      }
    });
  }

  switch (row.status) {
    case RowStatus.COMPLETED:
      return <Chip label={translate('cancerLibraryApp.datasourceEditor.singleTableEditor.rowStatus.completed')}
                   color="success"
                   icon={<DoneIcon/>}
                   size={'small'}
                   variant="outlined"
                   onClick={transformAsInProgress}
      />;
    case RowStatus.IN_PROGRESS:
      return <Chip label={translate('cancerLibraryApp.datasourceEditor.singleTableEditor.rowStatus.inProgress')}
                   color="warning"
                   size={'small'}
                   variant="outlined"
                   onClick={transformAsCompleted}
      />;
    default:
      return <Chip
        label={translate('cancerLibraryApp.datasourceEditor.singleTableEditor.rowStatus.notStarted')}
        color="info"
        size={'small'}
        variant="outlined"
        onClick={transformAsCompleted}
      />;

  }
};

export default DxRowConfirmCellRender;
