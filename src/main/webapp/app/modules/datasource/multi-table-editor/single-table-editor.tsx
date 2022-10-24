import React, {useEffect, useRef, useState} from "react";
import DataGrid, {Column} from 'devextreme-react/data-grid';
import {ICategory} from "app/shared/model/category.model";
import {toast} from 'react-toastify';
import Accordion from '@mui/material/Accordion';
import AccordionSummary from '@mui/material/AccordionSummary';
import AccordionDetails from '@mui/material/AccordionDetails';
import Typography from '@mui/material/Typography';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
import {translate} from 'react-jhipster';
import {useAppDispatch, useAppSelector} from "app/config/store";
import {getDxColumnConfig} from "app/modules/datasource/multi-table-editor/dx-component/dx-column-config";
import {getOriginRow, reset as resetDatasourceOrigin} from "app/modules/datasource/reducer/datasource.origin.reducer";
import Button from '@mui/material/Button';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {
  createDatasourceRow,
  deleteDatasourceRow,
  updateDatasourceRow
} from "app/modules/datasource/reducer/datasource.container.reducer";
import {IPatient} from "app/shared/model/patient.model";


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
  const [isNew, setIsNew] = useState(false);

  const patient = useAppSelector<IPatient>(state => state.datasourcePatient.entity);
  const dataSourceContainer = useAppSelector(state => state.datasourceContainer.dataSource.container);
  const itemContainer = useAppSelector(state => state.datasourceContainer.item.container);
  const updateSuccess = useAppSelector(state => state.datasourceContainer.updateSuccess);

  const {category} = props;

  useEffect(() => {
    if (updateSuccess && editedCategory && editedCategory.id === category.id) {
      if (isNew) {
        toast.info(translate('cancerLibraryApp.datasource.singleTableEditor.createSuccess', {table: category.title.toUpperCase()}));
      } else {
        toast.info(translate('cancerLibraryApp.datasource.singleTableEditor.updateSuccess', {
          table: category.title.toUpperCase(),
          row: editedRow.idx
        }));
      }
    }
  }, [updateSuccess]);

  const onEditingStart = e => {
    setIsNew(false);
    setEditedCategory(category);
    setEditedRow(e.data);

    if (!e.data['idx'].includes('KCURE')) {
      dispatch(getOriginRow({categoryId: category.id, rowId: e.data.idx}));
    } else {
      dispatch(resetDatasourceOrigin());
    }
  }

  const onRowUpdating = e => {
    e.cancel = new Promise<void>((resolve) => {
      const row = Object.assign({}, e.oldData, e.newData);

      dispatch(updateDatasourceRow({categoryId: category.id, row}));
      resolve();
    });
  };

  const onRowInserting = e => {
    setIsNew(true);
    setEditedCategory(category);

    e.cancel = new Promise<void>((resolve) => {
      const row = Object.assign({}, e.data, {'pt_no': patient.ptNo});

      dispatch(createDatasourceRow({categoryId: category.id, row}));
      resolve();
    });
  }

  const onRowRemoving = e => {
    e.cancel = new Promise<void>((resolve) => {
      const row = Object.assign({}, e.data);

      dispatch(deleteDatasourceRow({categoryId: category.id, row}));
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
            allowDeleting: true,
            form: {colCount: 3}
          }}
          onEditingStart={onEditingStart}
          onRowInserting={onRowInserting}
          onRowUpdating={onRowUpdating}
          onRowRemoving={onRowRemoving}
          // onInitNewRow={onInitNewRow}
          scrolling={{mode: 'standard', showScrollbar: 'onHover'}}
          paging={{pageSize: 10}}
          onEditCanceled={() => {
            dispatch(resetDatasourceOrigin());
          }}
          columnAutoWidth={true}
        >
          {
            itemContainer[category.id].map(item => getDxColumnConfig(item))
          }
          <Column dataField="last_modified_by"
                  caption={translate('cancerLibraryApp.datasource.column.lastModifiedBy')}
                  alignment={"center"} allowEditing={false}
                  visibleIndex={9998}/>
          <Column dataField="last_modified_date"
                  caption={translate('cancerLibraryApp.datasource.column.lastModifiedDate')}
                  alignment={"center"} dataType={"datetime"} format={"yy/MM/dd hh:mm"} allowEditing={false}
                  visibleIndex={9999}/>
        </DataGrid>
      </AccordionDetails>
    </Accordion>

  ) : null;
}

export default SingleTableEditor;
