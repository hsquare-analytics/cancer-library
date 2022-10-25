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


enum ActionType {
  CREATE = 'create',
  UPDATE = 'update',
  DELETE = 'delete'
}


export interface ISingleTableEditor {
  category: ICategory;
  editedCategoryId: number;
  setEditedCategoryId: (categoryId: number) => void;
}

export const getCategoryTypography = (category: ICategory) => {
  return <Typography>{`${category.property ? category.property?.caption + ' - ' : ''} ${category.title.toUpperCase()} `}</Typography>
}

export const SingleTableEditor = (props: ISingleTableEditor) => {
  const dispatch = useAppDispatch();
  const dataGrid = useRef(null);

  const [editedRow, setEditedRow] = useState(null);
  const [actionType, setActionType] = useState(null);

  const patient = useAppSelector<IPatient>(state => state.datasourcePatient.entity);
  const dataSourceContainer = useAppSelector(state => state.datasourceContainer.dataSource.container);
  const itemContainer = useAppSelector(state => state.datasourceContainer.item.container);
  const updateSuccess = useAppSelector(state => state.datasourceContainer.updateSuccess);

  const {category} = props;

  useEffect(() => {
    if (updateSuccess && category.id === props.editedCategoryId) {
      switch (actionType) {
        case ActionType.CREATE:
          toast.info(translate('cancerLibraryApp.datasource.singleTableEditor.createSuccess', {table: category.title.toUpperCase()}));
          break;
        case ActionType.UPDATE:
          toast.info(translate('cancerLibraryApp.datasource.singleTableEditor.updateSuccess', {table: category.title.toUpperCase(), row: editedRow.idx}));
          break;
        case ActionType.DELETE:
          toast.info(translate('cancerLibraryApp.datasource.singleTableEditor.deleteSuccess', {table: category.title.toUpperCase(), row: editedRow.idx}));
          break;
        default:
          break;
      }
    }
  }, [updateSuccess]);

  const onEditingStart = e => {
    if (!e.data['idx'].includes('KCURE')) {
      dispatch(getOriginRow({categoryId: category.id, rowId: e.data.idx}));
    } else {
      dispatch(resetDatasourceOrigin());
    }
  }

  const onRowUpdating = e => {
    setActionType(ActionType.UPDATE);
    props.setEditedCategoryId(category.id);
    setEditedRow(e.oldData);

    e.cancel = new Promise<void>((resolve) => {
      const row = Object.assign({}, e.oldData, e.newData);

      dispatch(updateDatasourceRow({categoryId: category.id, row}));
      resolve();
    });
  };

  const onRowInserting = e => {
    setActionType(ActionType.CREATE);
    props.setEditedCategoryId(category.id);

    e.cancel = new Promise<void>((resolve) => {
      const row = Object.assign({}, e.data, {'pt_no': patient.ptNo});

      dispatch(createDatasourceRow({categoryId: category.id, row}));
      resolve();
    });
  }

  const onRowRemoving = e => {
    setActionType(ActionType.DELETE);
    props.setEditedCategoryId(category.id);
    setEditedRow(e.data);

    e.cancel = new Promise<void>((resolve, reject) => {
      const row = Object.assign({}, e.data);
      if (!row.idx.includes('KCURE')) {
        const result = translate('cancerLibraryApp.datasource.singleTableEditor.deleteFail', {
          table: category.title.toUpperCase(), row: row.idx
        });
        toast.error(result);
        reject(result);
      } else {
        dispatch(deleteDatasourceRow({categoryId: category.id, row}));
        resolve();
      }
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
            form: {colCount: 3},
            texts: {
              confirmDeleteMessage: translate('entity.delete.warning'),
            },
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
