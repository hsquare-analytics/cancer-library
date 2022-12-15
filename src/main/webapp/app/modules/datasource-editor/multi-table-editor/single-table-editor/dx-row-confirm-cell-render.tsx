import React from 'react';
import Swal, {SweetAlertOptions} from 'sweetalert2';
import {useAppDispatch} from "app/config/store";
import {
  createDatasourceRow,
  updateDatasourceRow
} from "app/modules/datasource-editor/reducer/datasource.container.reducer";
import {ICategory} from "app/shared/model/category.model";
import axios from "axios";
import Chip from '@mui/material/Chip';
import PauseIcon from '@mui/icons-material/Pause';
import DoneIcon from '@mui/icons-material/Done';
import PlayArrowIcon from '@mui/icons-material/PlayArrow';
import RemoveCircleIcon from '@mui/icons-material/RemoveCircle';
import {translate} from 'react-jhipster';
import {DATASOURCE_ROW_STATUS, RowStatus} from "app/config/datasource-constants";


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
        const payload = {
          categoryId: category.id,
          row: {
            ...row,
            [DATASOURCE_ROW_STATUS]: RowStatus.IN_PROGRESS
          }
        }
        dispatch(updateDatasourceRow(payload));
      }
    });
  };

  const transformAsCompleted = () => {
    Swal.fire(Object.assign({}, SwalCommonOptions, {
      text: translate('cancerLibraryApp.datasourceEditor.singleTableEditor.transformAsCompleted.title'),
    }) as SweetAlertOptions).then((result) => {
      if (result.isConfirmed) {
        axios.get(`/api/datasource/categories/${category.id}/rows/${row.idx}/check-updated-row-exist`).then(({data}) => {
          const payload = {
            categoryId: category.id,
            row: {
              ...row,
              [DATASOURCE_ROW_STATUS]: RowStatus.COMPLETED
            }
          }

          if (data) {
            dispatch(updateDatasourceRow(payload));
          } else {
            dispatch(createDatasourceRow(payload));
          }
        });
      }
    });
  }

  switch (row.status) {
    case RowStatus.COMPLETED:
      return <Chip label={translate('cancerLibraryApp.datasourceEditor.singleTableEditor.rowStatus.completed')}
                   icon={<DoneIcon/>}
                   color="success"
                   size={'small'}
                   variant="outlined"
                   onClick={transformAsInProgress}
      />;
    case RowStatus.IN_PROGRESS:
      return <Chip label={translate('cancerLibraryApp.datasourceEditor.singleTableEditor.rowStatus.inProgress')}
                   icon={<PauseIcon/>}
                   color="warning"
                   size={'small'}
                   variant="outlined"
                   onClick={transformAsInProgress}
      />;
    case RowStatus.DISABLED:
      return <Chip label={translate('cancerLibraryApp.datasourceEditor.singleTableEditor.rowStatus.disabled')}
                    icon={<RemoveCircleIcon/>}
                    color="error"
                    size={'small'}
                    variant="outlined"
                    onClick={transformAsInProgress}
      />;
    default:
      return <Chip
        label={translate('cancerLibraryApp.datasourceEditor.singleTableEditor.rowStatus.notStarted')}
        icon={<PlayArrowIcon/>}
        color="info"
        size={'small'}
        variant="outlined"
        onClick={transformAsCompleted}
      />;

  }
};

export default DxRowConfirmCellRender;
