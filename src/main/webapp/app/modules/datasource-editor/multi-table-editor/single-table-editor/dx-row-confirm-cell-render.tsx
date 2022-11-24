import React from 'react';
import Swal from 'sweetalert2';
import {useAppDispatch} from "app/config/store";
import {
  createDatasourceRow,
  updateDatasourceRow
} from "app/modules/datasource-editor/reducer/datasource.container.reducer";
import {ICategory} from "app/shared/model/category.model";
import axios from "axios";
import {setCategory as setSelectedCategory,} from 'app/modules/datasource-editor/reducer/datasource.status.reducer';
import Chip from '@mui/material/Chip';
import DoneIcon from '@mui/icons-material/Done';


export interface IDxRowConfirmCellRenderProps {
  row: any;
  category: ICategory;
}

const DxRowConfirmCellRender = (props: IDxRowConfirmCellRenderProps) => {
  const dispatch = useAppDispatch();

  const {row, category} = props;

  if (!row || !row.idx) {
    return null;
  }

  const onClickConfirm = () => {
    Swal.fire({
      // title: 'Are you sure?',
      text: '데이터가 이상없음을 확인하셨습니까?',
      // icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes'
    }).then((result) => {
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
  };


  return row['created_by'] ? (
    <Chip label="확인됨"
          icon={<DoneIcon/>}
          size={'small'}
      // color="success"
          variant="outlined"
    />
  ) : (
    <Chip label="? 미확인"
          color="primary"
          variant="outlined"
          size={'small'}
          // icon={<QuestionMarkIcon/>}
          onClick={(e) => {
            e.stopPropagation();
            dispatch(setSelectedCategory(category));
            onClickConfirm();
          }}/>
  )
};

export default DxRowConfirmCellRender;
