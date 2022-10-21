import React, {useEffect, useRef, useState} from "react";
import DataGrid, {Column} from 'devextreme-react/data-grid';
import {ICategory} from "app/shared/model/category.model";
import {REVIEW_LIST} from "app/config/constants";
import {cleanEntity} from "app/shared/util/entity-utils";
import {toast} from 'react-toastify';
import Accordion from '@mui/material/Accordion';
import AccordionSummary from '@mui/material/AccordionSummary';
import AccordionDetails from '@mui/material/AccordionDetails';
import Typography from '@mui/material/Typography';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
import {translate} from 'react-jhipster';
import {useAppDispatch, useAppSelector} from "app/config/store";
import {getDxColumnConfig} from "app/modules/patient-table-editor/multi-table-editor/dx-component/dx-column-config";
import {getRow, resetRow} from "app/modules/patient-table-editor/reducer/patient-table-editor.origin.reducer";
import Button from '@mui/material/Button';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {updateDatasourceRow} from "app/modules/patient-table-editor/reducer/patient-table-editor.container.reducer";


export interface ISingleTableEditor {
  category: ICategory;
}

export const getCategoryTypography = (category: ICategory) => {
  return <Typography>{`${category.property ? category.property?.caption + ' - ' : ''} ${category.title.toUpperCase()} `}</Typography>
}

export const SingleTableEditor = (props: ISingleTableEditor) => {
  const dispatch = useAppDispatch();
  const dataGrid = useRef(null);

  // 다섯개 테이블에 대한 업데이트 플래그 체크를 위해서 별도로 local state를 생성하였다. (swal alert 다중 표시 방지)
  const [editedCategory, setEditedCategory] = useState(null);
  const [editedRow, setEditedRow] = useState(null);

  const dataSourceContainer = useAppSelector(state => state.patientTableEditorContainer.dataSource.container);
  const itemContainer = useAppSelector(state => state.patientTableEditorContainer.item.container);
  const updateSuccess = useAppSelector(state => state.patientTableEditorContainer.updateSuccess);

  const {category} = props;

  useEffect(() => {
    if (updateSuccess && editedCategory && editedCategory.id === category.id) {
      toast.info(translate("cancerLibraryApp.patientTableEditor.singleTableEditor.updateSuccess", {
        table: category.title.toUpperCase(),
        row: editedRow.idx
      }));
    }
  }, [updateSuccess]);


  const onRowUpdating = e => {
    e.cancel = new Promise<void>((resolve, reject) => {
      const row = cleanEntity(Object.assign({}, e.oldData, e.newData));
      row['status'] = REVIEW_LIST.SUBMITTED;

      dispatch(updateDatasourceRow({categoryId: category.id, row}));
      resolve();
    });
  };


  const canRender: () => boolean = () => category && itemContainer && itemContainer[category.id] && dataSourceContainer && dataSourceContainer[category.id];

  return canRender() ? (
    <Accordion defaultExpanded={true} className={"single-table-editor-wrapper"}>
      <AccordionSummary
        expandIcon={<ExpandMoreIcon/>}
        aria-controls="panel1a-content"
        id="panel1a-header"
      >
        {getCategoryTypography(category)}
        <Button variant="text" onClick={(e) => {
          e.stopPropagation();
          dataGrid.current.instance.addRow()
        }}>
          <FontAwesomeIcon icon="plus"/>
        </Button>
      </AccordionSummary>
      <AccordionDetails sx={{padding: "8px 0"}}>
        <Typography>
          <DataGrid
            ref={dataGrid}
            dataSource={JSON.parse(JSON.stringify(dataSourceContainer[category.id]))}
            showBorders={true}
            filterRow={{visible: false}}
            headerFilter={{visible: true}}
            allowColumnResizing={true}
            pager={{displayMode: 'compact', showNavigationButtons: true}}
            editing={{
              mode: 'popup',
              allowUpdating: true,
              form: {colCount: 3}
            }}
            onRowUpdating={onRowUpdating}
            scrolling={{mode: 'standard', showScrollbar: 'onHover'}}
            paging={{pageSize: 10}}
            onEditingStart={e => {
              setEditedCategory(category);
              setEditedRow(e.data);
              dispatch(getRow({categoryId: category.id, rowId: e.data.idx}));
            }}
            onEditCanceled={e => {
              dispatch(resetRow());
            }}
            columnAutoWidth={true}
          >
            {
              itemContainer[category.id].map(item => getDxColumnConfig(item))
            }
            <Column dataField="last_modified_by"
                    caption={translate('cancerLibraryApp.patientTableEditor.column.lastModifiedBy')}
                    alignment={"center"} allowEditing={false}
                    visibleIndex={9998}/>
            <Column dataField="last_modified_date"
                    caption={translate('cancerLibraryApp.patientTableEditor.column.lastModifiedDate')}
                    alignment={"center"} dataType={"datetime"} format={"yy/MM/dd hh:mm"} allowEditing={false}
                    visibleIndex={9999}/>
          </DataGrid>
        </Typography>
      </AccordionDetails>
    </Accordion>

  ) : null;
}

export default SingleTableEditor;
