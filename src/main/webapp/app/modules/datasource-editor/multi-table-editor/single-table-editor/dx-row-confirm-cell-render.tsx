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
import {
  transformAsCompleted, transformAsInProgress
} from "app/modules/datasource-editor/multi-table-editor/single-table-editor/utils/single-table-editor.row-status.utils";


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
    confirmButtonText: translate('cancerLibraryApp.datasource.singleTableEditor.rowStatus.button.confirm'),
    cancelButtonText: translate('cancerLibraryApp.datasource.singleTableEditor.rowStatus.button.cancel')
  }


  switch (row.status) {
    case RowStatus.COMPLETED:
      return <Chip label={translate('cancerLibraryApp.datasource.singleTableEditor.rowStatus.completed')}
                   icon={<DoneIcon/>}
                   color="success"
                   size={'small'}
                   variant="outlined"
                   onClick={() => transformAsInProgress(dispatch, category, row)}
      />;
    case RowStatus.IN_PROGRESS:
      return <Chip label={translate('cancerLibraryApp.datasource.singleTableEditor.rowStatus.inProgress')}
                   icon={<PauseIcon/>}
                   color="warning"
                   size={'small'}
                   variant="outlined"
                   onClick={() => transformAsCompleted(dispatch, category, row)}
      />;
    case RowStatus.DISABLED:
      return <Chip label={translate('cancerLibraryApp.datasource.singleTableEditor.rowStatus.disabled')}
                   icon={<RemoveCircleIcon/>}
                   color="error"
                   size={'small'}
                   variant="outlined"
                   onClick={() => transformAsInProgress(dispatch, category, row)}
      />;
    case RowStatus.REJECTED:
      return <Chip label={translate('cancerLibraryApp.datasource.singleTableEditor.rowStatus.rejected')}
                   icon={<PauseIcon/>}
                   color="error"
                   size={'small'}
                   variant="outlined"
                   onClick={() => transformAsInProgress(dispatch, category, row)}
      />;
    default:
      return <Chip
        label={translate('cancerLibraryApp.datasource.singleTableEditor.rowStatus.notStarted')}
        icon={<PlayArrowIcon/>}
        color="info"
        size={'small'}
        variant="outlined"
        onClick={() => transformAsCompleted(dispatch, category, row)}
      />;

  }
};

export default DxRowConfirmCellRender;
