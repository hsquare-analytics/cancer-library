import React, {useEffect} from "react";
import {useAppDispatch, useAppSelector} from "app/config/store";
import SingleTableEditor from "app/modules/datasource-editor/multi-table-editor/single-table-editor";
import CircularProgress from '@mui/material/CircularProgress';
import Typography from '@mui/material/Typography';
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

  const loading = useAppSelector(state => state.datasourceContainer.loading) || itemCount < categories.length;

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

  const progressValue = Math.round((rawDataCount + itemCount) / (categories.length * 2) * 100);
  return (<div>
    {
      !loading ? (
          <div>
            <Box sx={{
              position: 'relative',
              flexDirection: 'row',
              display: (progressValue === 100) ? 'none' : 'inline-flex'
            }}>
              <CircularProgress variant="determinate" value={progressValue}/>
              <Box sx={{
                top: 0,
                left: 0,
                bottom: 0,
                right: 0,
                position: 'absolute',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
              }}
              >
                <Typography variant="caption" component="div" color="text.secondary">{`${progressValue}%`}</Typography>
              </Box>
            </Box>
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
