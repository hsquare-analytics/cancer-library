import React, {useEffect, useState} from "react";
import {useAppDispatch, useAppSelector} from "app/config/store";
import SingleTableEditor from "app/modules/datasource-editor/multi-table-editor/single-table-editor";
import CircularProgress from '@mui/material/CircularProgress';

import Box from '@mui/material/Box';
import {
  getDataSources,
  getUsableCategories,
  getUsableItems,
  resetItem,
  resetRawData
} from "app/modules/datasource-editor/reducer/datasource.container.reducer";
import {IPatient} from "app/shared/model/patient.model";
import _ from "lodash";

export const MultiTableEditor = () => {
  const dispatch = useAppDispatch();

  const patient = useAppSelector<IPatient>(state => state.datasourcePatient.entity);
  const categories = useAppSelector(state => state.datasourceContainer.categories);

  const rawDataCount = useAppSelector(state => state.datasourceContainer.rawData.count);
  const itemContainer = useAppSelector(state => state.datasourceContainer.item.container);
  const itemCount = useAppSelector(state => state.datasourceContainer.item.count);

  const loading = useAppSelector(state => state.datasourceContainer.loading) || itemCount < categories.length || rawDataCount < categories.length;

  const [editedCategoryId, setEditedCategoryId] = useState(null);

  useEffect(() => {
    if (categories.length === 0) {
      dispatch(getUsableCategories());
    }
  }, []);

  useEffect(() => {
    for (const category of categories) {
      if (!itemContainer[category.id]) {
        dispatch(getUsableItems(category.id));
      }
    }
    return () => {
      dispatch(resetItem());
    }
  }, [JSON.stringify(categories)]);

  useEffect(() => {
    if (patient) {
      for (const category of categories) {
        dispatch(getDataSources({categoryId: category.id, patientNo: patient.ptNo}));
      }
    }

    return () => {
      dispatch(resetRawData());
    }
  }, [JSON.stringify(patient?.ptNo)]);

  return (<div>
    {
      !loading ? (
          <div>
            {_.orderBy(categories, ['orderNo'], ['asc']).map(category => <SingleTableEditor
              key={category.id} category={category}/>)}
          </div>
        ) :
        <Box sx={{display: 'flex', justifyContent: 'center', alignItems: 'center', height: '50vh'}}>
          <CircularProgress/>
        </Box>
    }
  </div>)


}

export default MultiTableEditor;
