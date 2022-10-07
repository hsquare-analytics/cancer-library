import React, {useEffect, useState} from "react";
import DataGrid, {Column} from 'devextreme-react/data-grid';
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
import {IPatient} from "app/shared/model/patient.model";
import {useAppDispatch, useAppSelector} from "app/config/store";
import {getAccessibleItems} from "app/modules/patient-table-editor/patient-table-editor.reducer";

export interface ISingleTableEditor {
  patient: IPatient;
  category: ICategory;
}

export const getCategoryTypography = (category: ICategory) => {
  return <Typography>{`${category.property ? category.property?.caption + ' - ' : ''} ${category.title.toUpperCase()} `}</Typography>
}

export const SingleTableEditor = (props: ISingleTableEditor) => {
  const dispatch = useAppDispatch();
  const itemListMap = useAppSelector(state => state.patientTableEditor.itemListMap);

  const {patient, category} = props;

  const [datasource, setDatasource] = useState([]);

  const login = useAppSelector(state => state.authentication.account.login);

  useEffect(() => {
    if (patient && category) {
      axios.get<any[]>(`/api/datasource-editor/categories/${category.id}?patientNo=${patient.ptNo}`).then(({data}) => {
        setDatasource(data);
      });

      if (!itemListMap[category.id]) {
        dispatch(getAccessibleItems(category.id));
      }
    }
  }, [JSON.stringify(patient), JSON.stringify(category)]);

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

  const canRender: () => boolean = () => category && itemListMap && itemListMap[category.id] && itemListMap[category.id].length > 0;

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
            dataSource={JSON.parse(JSON.stringify(datasource))}
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
          >
            {
              itemListMap[category.id].map(item => <Column
                  key={item}
                  dataField={item.title.toLowerCase()}
                  caption={item.itemProperty?.caption}
                  visibleIndex={item.itemProperty?.visibleIndex}
                  alignment={'center'}
                />
              )
            }
            <Column dataField="last_modified_by" caption={translate('datasource.column.lastModifiedBy')}
                    alignment={"center"} allowEditing={false}/>
            <Column dataField="last_modified_date" caption={translate('datasource.column.lastModifiedDate')}
                    alignment={"center"} dataType={"datetime"} format={"yy/MM/dd hh:mm"} allowEditing={false}/>
          </DataGrid>
        </Typography>
      </AccordionDetails>
    </Accordion>

  ) : null;
}

export default SingleTableEditor;
