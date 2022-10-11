import React, {useEffect} from "react";
import {useAppDispatch, useAppSelector} from "app/config/store";
import SingleTableEditor from "app/modules/patient-table-editor/multi-table-editor/single-table-editor";
import CircularProgress from '@mui/material/CircularProgress';

import Box from '@mui/material/Box';
import {
  getUsableCategories,
  getUsableItems,
  resetItemListLoadedCount
} from "app/modules/patient-table-editor/patient-table-editor.reducer";

export const MultiTableEditor = () => {
  const dispatch = useAppDispatch();

  const categories = useAppSelector(state => state.patientTableEditor.categories);

  const count = useAppSelector(state => state.patientTableEditor.count);
  const itemContainer = useAppSelector(state => state.patientTableEditor.itemContainer);

  const loading = !categories || categories.length === 0 || count.item !== categories.length || count.dataSource !== categories.length;

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
      dispatch(resetItemListLoadedCount());
    }
  }, [JSON.stringify(categories)]);

  return !loading ? (
    <div>
      {categories.map(category => <SingleTableEditor key={category.id} category={category}/>)}
    </div>
  ) : <Box sx={{display: 'flex', justifyContent: 'center', alignItems: 'center', height: '50vh'}}>
    <CircularProgress/>
  </Box>;
}

export default MultiTableEditor;
