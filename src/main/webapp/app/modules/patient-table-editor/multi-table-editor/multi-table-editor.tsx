import React from "react";
import {useAppSelector} from "app/config/store";
import SingleTableEditor from "app/modules/patient-table-editor/multi-table-editor/single-table-editor";
import CircularProgress from '@mui/material/CircularProgress';

import Box from '@mui/material/Box';

export const MultiTableEditor = () => {
  const categories = useAppSelector(state => state.patientTableEditor.categories);

  const itemListLoadedCount = useAppSelector(state => state.patientTableEditor.itemListLoadedCount);
  const dataSourceLoadedCount = useAppSelector(state => state.patientTableEditor.dataSourceLoadedCount);

  const loading = !categories || categories.length === 0 || itemListLoadedCount !== categories.length || dataSourceLoadedCount !== categories.length;

  return !loading ? (
    <div>
      {categories.map(category => <SingleTableEditor key={category.id} category={category}/>)}
    </div>
  ) : <Box >
    <CircularProgress/>
  </Box>;
}

export default MultiTableEditor;
