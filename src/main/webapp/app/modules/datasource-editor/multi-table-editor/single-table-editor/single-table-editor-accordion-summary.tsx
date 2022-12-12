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

export interface SingleTableAccordionSummaryProps {
  category: ICategory
  dataGrid: any;
  accordionExpanded: boolean;
  setAccordionExpanded: (expanded: boolean) => void;
}

export const SingleTableEditorAccordionSummary = (props: SingleTableAccordionSummaryProps) => {
  const {category, dataGrid, accordionExpanded} = props;
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
            dataGrid.current.instance.getSelectedRowsData();
          }}
        >
          <FontAwesomeIcon icon="check-double" className={'me-3'}/>
          {translate('cancerLibraryApp.datasourceEditor.singleTableEditor.bulkConfirm')}
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
          {translate('cancerLibraryApp.datasourceEditor.singleTableEditor.columnList')}
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
          {translate('cancerLibraryApp.datasourceEditor.singleTableEditor.addRow')}
        </Button>
      </div>
    </AccordionSummary>
  );

}
