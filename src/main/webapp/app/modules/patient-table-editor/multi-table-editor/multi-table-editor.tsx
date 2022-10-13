import React, {useEffect} from "react";
import {useAppDispatch, useAppSelector} from "app/config/store";
import SingleTableEditor from "app/modules/patient-table-editor/multi-table-editor/single-table-editor";
import CircularProgress from '@mui/material/CircularProgress';

import Box from '@mui/material/Box';
import {
  getDataSources,
  getUsableCategories,
  getUsableItems,
  resetDataSource,
  resetItem
} from "app/modules/patient-table-editor/patient-table-editor.reducer";
import {IPatient} from "app/shared/model/patient.model";

export const MultiTableEditor = () => {
  const dispatch = useAppDispatch();

  const patient = useAppSelector<IPatient>(state => state.patientTableEditor.patient);
  const categories = useAppSelector(state => state.patientTableEditor.categories);

  const dataSourceCount = useAppSelector(state => state.patientTableEditor.dataSource.count);
  const itemContainer = useAppSelector(state => state.patientTableEditor.item.container);
  const itemCount = useAppSelector(state => state.patientTableEditor.item.count);

  const loading = !categories || categories.length === 0 || itemCount !== categories.length || dataSourceCount !== categories.length;

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
      dispatch(resetDataSource());
    }
  }, [JSON.stringify(patient?.ptNo)]);

  return (<div>
    {
      !loading ? (
          <div>
            {categories.map(category => <SingleTableEditor key={category.id} category={category}/>)}
          </div>
        ) :
        <Box sx={{display: 'flex', justifyContent: 'center', alignItems: 'center', height: '50vh'}}>
          <CircularProgress/>
        </Box>
    }
  </div>)


}

export default MultiTableEditor;
