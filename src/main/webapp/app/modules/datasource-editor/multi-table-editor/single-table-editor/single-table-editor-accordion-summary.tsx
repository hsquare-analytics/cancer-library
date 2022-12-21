import React from 'react';
import AccordionSummary from '@mui/material/AccordionSummary';
import {
  getCategoryTypography
} from "app/modules/datasource-editor/multi-table-editor/single-table-editor/single-table-editor";
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
import {ICategory} from "app/shared/model/category.model";
import Button from '@mui/material/Button';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {translate} from 'react-jhipster';
import {useAppDispatch} from "app/config/store";
import {updateBulkDatasourceRows} from "app/modules/datasource-editor/reducer/datasource.container.reducer";
import Swal from "sweetalert2";

export interface SingleTableAccordionSummaryProps {
  category: ICategory
  dataGrid: any;
  accordionExpanded: boolean;
  setAccordionExpanded: (expanded: boolean) => void;
}

export const SingleTableEditorAccordionSummary = (props: SingleTableAccordionSummaryProps) => {
  const dispatch = useAppDispatch();

  const {category, dataGrid, accordionExpanded} = props;
  const swalUpdateBulkDatasourceRows = () => {
    Swal.fire({
      text: translate('cancerLibraryApp.datasource.singleTableEditor.updateBulkDatasourceRows.title'),
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: translate('cancerLibraryApp.datasource.singleTableEditor.rowStatus.button.confirm'),
      cancelButtonText: translate('cancerLibraryApp.datasource.singleTableEditor.rowStatus.button.cancel'),
    }).then((result) => {
      if (result.isConfirmed) {
        dataGrid.current.instance.getSelectedRowsData();
        dispatch(updateBulkDatasourceRows({
          categoryId: category.id,
          rows: dataGrid.current.instance.getSelectedRowsData()
        }));
      }
    })
  }
  return (
    <AccordionSummary expandIcon={<ExpandMoreIcon/>} aria-controls="panel1a-content" id="panel1a-header"
                      onClick={(e) => props.setAccordionExpanded(!accordionExpanded)}
    >
      {getCategoryTypography(category)}
      <div>
        <Button
          variant="outlined"
          className={'me-2'}
          size={'small'}
          color={'warning'}
          onClick={e => {
            e.stopPropagation();
            swalUpdateBulkDatasourceRows();
          }}
        >
          <FontAwesomeIcon icon="check-double" className={'me-3'}/>
          {translate('cancerLibraryApp.datasource.singleTableEditor.bulkConfirm')}
        </Button>
        <Button
          variant="outlined"
          className={'me-2'}
          size={'small'}
          onClick={e => {
            e.stopPropagation();
            dataGrid.current.instance.showColumnChooser();
          }}
        >
          <FontAwesomeIcon icon="list" className={'me-3'}/>
          {translate('cancerLibraryApp.datasource.singleTableEditor.columnList')}
        </Button>
        <Button
          variant="outlined"
          className={'me-2'}
          size={'small'}
          color={"info"}
          onClick={e => {
            e.stopPropagation();
            dataGrid.current.instance.addRow();
          }}
        >
          <FontAwesomeIcon icon="plus" className={'me-3'}/>
          {translate('cancerLibraryApp.datasource.singleTableEditor.addRow')}
        </Button>
      </div>
    </AccordionSummary>
  );

}
