import React from "react";
import DataGrid, {Column, Lookup} from 'devextreme-react/data-grid';
import {ICategory} from "app/shared/model/category.model";
import axios from "axios";
import {REVIEW_LIST} from "app/config/constants";
import {cleanEntity} from "app/shared/util/entity-utils";
import {toast} from 'react-toastify';
import Accordion from '@mui/material/Accordion';
import AccordionSummary from '@mui/material/AccordionSummary';
import AccordionDetails from '@mui/material/AccordionDetails';
import Typography from '@mui/material/Typography';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
import {translate} from 'react-jhipster';
import {useAppSelector} from "app/config/store";
import {IItem} from "app/shared/model/item.model";
import TagBoxComponent from "app/modules/patient-table-editor/multi-table-editor/devextreme-component/TagBoxComponent";
import SelectBoxComponent
  from "app/modules/patient-table-editor/multi-table-editor/devextreme-component/SelectBoxComponent";

export interface ISingleTableEditor {
  category: ICategory;
}

export const getCategoryTypography = (category: ICategory) => {
  return <Typography>{`${category.property ? category.property?.caption + ' - ' : ''} ${category.title.toUpperCase()} `}</Typography>
}

export const SingleTableEditor = (props: ISingleTableEditor) => {
  const dataSourceContainer = useAppSelector(state => state.patientTableEditorContainer.dataSource.container);
  const itemContainer = useAppSelector(state => state.patientTableEditorContainer.item.container);

  const {category} = props;

  const login = useAppSelector(state => state.authentication.account.login);

  const onRowUpdating = e => {
    e.cancel = new Promise<void>((resolve, reject) => {
      const row = cleanEntity(Object.assign({}, e.oldData, e.newData));
      row['status'] = REVIEW_LIST.SUBMITTED;
      axios
      .post(`api/datasource-editor/categories/${category.id}`, row)
      .then(({data}) => {
        if (data >= 1) {
          toast.success('Data Submitted Successfully');
          e.oldData['status'] = REVIEW_LIST.SUBMITTED;
          e.oldData['last_modified_by'] = login;
          e.oldData['last_modified_date'] = new Date();
          resolve();
        } else {
          toast.error('Data Submission Failed');
          reject('update fail');
        }
      })
      .catch(err => reject(err));
    });
  };


  const getDxColumn = (item: IItem) => {
    return <Column
      key={item.id}
      dataField={item.title.toLowerCase()}
      dataType={item.attribute?.dataType}
      caption={item.property?.caption}
      visibleIndex={item.property?.visibleIndex}
      alignment={'center'}
      editCellComponent={getDxEditCellComponent(item)}
    >
      {getDxLookupComponent(item)}
    </Column>
  }

  const getDxEditCellComponent = (item: IItem) => {
    switch (item.attribute?.dataType.toLowerCase()) {
      case 'tagbox':
        return TagBoxComponent;
      case 'selectbox':
        return SelectBoxComponent;
      default:
        return undefined;
    }
  }

  const getDxLookupComponent = (item: IItem) => {
    switch (item.attribute?.dataType.toLowerCase()) {
      case 'selectbox' || 'tagbox':
        return <Lookup dataSource={item.lookup.filter(data => data).map(data => new Object({"title": data}))}
                       displayExpr={"title"} valueExpr={"title"}/>;
      default:
        return undefined;
    }
  }

  const canRender: () => boolean = () => category && itemContainer && itemContainer[category.id] && dataSourceContainer && dataSourceContainer[category.id];

  return canRender() ? (
    <Accordion defaultExpanded={true}>
      <AccordionSummary
        expandIcon={<ExpandMoreIcon/>}
        aria-controls="panel1a-content"
        id="panel1a-header"
      >
        {getCategoryTypography(category)}
      </AccordionSummary>
      <AccordionDetails sx={{padding: "8px 0"}}>
        <Typography>
          <DataGrid
            dataSource={JSON.parse(JSON.stringify(dataSourceContainer[category.id]))}
            showBorders={true}
            filterRow={{visible: true}}
            headerFilter={{visible: true}}
            allowColumnResizing={true}
            pager={{displayMode: 'compact', showNavigationButtons: true}}
            editing={{
              mode: 'popup',
              allowUpdating: true,
            }}
            onRowUpdating={onRowUpdating}
            scrolling={{mode: 'standard', showScrollbar: 'onHover'}}
            paging={{pageSize: 10}}
          >
            {
              itemContainer[category.id].map(item => getDxColumn(item))
            }
            <Column dataField="last_modified_by"
                    caption={translate('cancerLibraryApp.patientTableEditor.column.lastModifiedBy')}
                    alignment={"center"} allowEditing={false}/>
            <Column dataField="last_modified_date"
                    caption={translate('cancerLibraryApp.patientTableEditor.column.lastModifiedDate')}
                    alignment={"center"} dataType={"datetime"} format={"yy/MM/dd hh:mm"} allowEditing={false}/>
          </DataGrid>
        </Typography>
      </AccordionDetails>
    </Accordion>

  ) : null;
}

export default SingleTableEditor;
