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
import {RowStatus} from "app/config/datasource-constants";

export interface SingleTableAccordionSummaryProps {
  category: ICategory
  dataGrid: any;
  accordionExpanded: boolean;
  setAccordionExpanded: (expanded: boolean) => void;
}

export const SingleTableEditorAccordionSummary = (props: SingleTableAccordionSummaryProps) => {
  const dispatch = useAppDispatch();

  const {category, dataGrid, accordionExpanded} = props;
  const swalUpdateBulkDatasourceRows = (status: RowStatus) => {
    const rowCount = dataGrid.current.instance.getSelectedRowsData().length;
    Swal.fire({
      text: translate('cancerLibraryApp.singleTableEditor.updateBulkDatasourceRows.confirm.' + status.toLowerCase(), {param: rowCount}),
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: translate('cancerLibraryApp.singleTableEditor.rowStatus.button.confirm'),
      cancelButtonText: translate('cancerLibraryApp.singleTableEditor.rowStatus.button.cancel'),
    }).then((result) => {
      if (result.isConfirmed) {
        dataGrid.current.instance.getSelectedRowsData();
        dispatch(updateBulkDatasourceRows({
          categoryId: category.id,
          rows: dataGrid.current.instance.getSelectedRowsData(),
          status
        }));
      }
    });
  };

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
          color={"info"}
          onClick={e => {
            e.stopPropagation();
            dataGrid.current.instance.addRow();
          }}
        >
          <FontAwesomeIcon icon="plus" className={'me-3'}/>
          {translate('cancerLibraryApp.singleTableEditor.addRow')}
        </Button>
        <Button
          variant="outlined"
          className={'me-2'}
          size={'small'}
          color={'success'}
          onClick={e => {
            e.stopPropagation();
            swalUpdateBulkDatasourceRows(RowStatus.COMPLETED);
          }}
        >
          <FontAwesomeIcon icon="check-double" className={'me-3'}/>
          {translate('cancerLibraryApp.singleTableEditor.bulkComplete')}
        </Button>
        <Button
          variant="outlined"
          className={'me-2'}
          size={'small'}
          color={'error'}
          onClick={e => {
            e.stopPropagation();
            swalUpdateBulkDatasourceRows(RowStatus.DISABLED);
          }}
        >
          <FontAwesomeIcon icon="trash" className={'me-3'}/>
          {translate('cancerLibraryApp.singleTableEditor.bulkDelete')}
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
          {translate('cancerLibraryApp.singleTableEditor.columnList')}
        </Button>
      </div>
    </AccordionSummary>
  );

}
