import React, {useEffect, useState} from "react";
import DataGrid, {Column, Lookup} from 'devextreme-react/data-grid';
import {ICategory} from "app/shared/model/category.model";
import axios from "axios";
import {REVIEW_LIST} from "app/config/constants";
import {cleanEntity} from "app/shared/util/entity-utils";
import {toast} from 'react-toastify';
import {translate} from 'react-jhipster';
import Accordion from '@mui/material/Accordion';
import AccordionSummary from '@mui/material/AccordionSummary';
import AccordionDetails from '@mui/material/AccordionDetails';
import Typography from '@mui/material/Typography';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';

export interface ISingleTableEditor {
  patientNo: string;
  category: ICategory;
}

export const getCategoryTypography = (category: ICategory) => {
  return <Typography>{`${category.title.toUpperCase()} ${category.property ? ' - ' + category.property?.caption : ''}`}</Typography>
}

export const SingleTableEditor = (props: ISingleTableEditor) => {

  const {patientNo, category} = props;

  const [datasource, setDatasource] = useState([]);
  const [itemList, setItemList] = useState([]);

  useEffect(() => {
    if (patientNo && category) {
      axios.get<any[]>(`/api/datasource-editor/categories/${category.id}?patientNo=${patientNo}`).then(({data}) => {
        setDatasource(data);
      });

      axios.get<any[]>(`/api/datasource-meta/categories/${category.id}/item-list`).then(({data}) => {
        setItemList(data);
      });
    }
  }, [patientNo, JSON.stringify(category)]);

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
          resolve();
        } else {
          toast.error('Data Submission Failed');
          reject('update fail');
        }
      })
      .catch(err => reject(err));
    });
  };


  return itemList.length > 0 ? (
    <Accordion defaultExpanded={true}>
      <AccordionSummary
        expandIcon={<ExpandMoreIcon/>}
        aria-controls="panel1a-content"
        id="panel1a-header"
      >
        {getCategoryTypography(category)}
      </AccordionSummary>
      <AccordionDetails>
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
          >

            {
              itemList.map(item => <Column
                  key={item}
                  dataField={item.title.toLowerCase()}
                  caption={item.itemProperty?.caption}
                  visibleIndex={item.itemProperty?.visibleIndex}
                  alignment={'center'}
                  minWidth={150}
                />
              )
            }
            <Column caption={translate("datasource.column.status")} dataField={"status"} alignment={'center'}
                    minWidth={150}
                    allowEditing={false}>
              <Lookup dataSource={[
                {
                  id: 1,
                  valueExpr: REVIEW_LIST.SUBMITTED,
                  displayExpr: translate('datasource.review.submitted')
                },
                {id: 2, valueExpr: REVIEW_LIST.DECLINED, displayExpr: translate('datasource.review.declined')},
                {id: 3, valueExpr: REVIEW_LIST.APPROVED, displayExpr: translate('datasource.review.approved')},
              ]} displayExpr={'displayExpr'} valueExpr={'valueExpr'}/>
            </Column>
          </DataGrid>
        </Typography>
      </AccordionDetails>
    </Accordion>

  ) : null;
}

export default SingleTableEditor;
