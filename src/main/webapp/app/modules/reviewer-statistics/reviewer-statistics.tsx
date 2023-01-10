import React, {useEffect, useState} from 'react';
import DateRangePicker, {IDateRange} from "app/modules/date-range-picker";
import ReviewStatisticsBarChart from "app/modules/reviewer-statistics/component/review-statistics.bar-chart";
import "./reviewer-statistics.scss";
import ReviewStatisticsDoughnutChart from "app/modules/reviewer-statistics/component/review-statistics.doughnut-chart";
import ReviewStatisticsDatagrid from "app/modules/reviewer-statistics/component/review-statistics.datagrid";
import {getEntities, getTotalPatientCount} from "app/modules/reviewer-statistics/reviewer-statistics.reducer";
import moment from "moment";
import {useAppDispatch, useAppSelector} from 'app/config/store';
import CircularProgress from '@mui/material/CircularProgress';
import Box from '@mui/material/Box';


const ReviewerStatistics = () => {
  const dispatch = useAppDispatch();

  const loading = useAppSelector(state => state.reviewerStatistics.loading);

  const [dateRange, setDateRange] = useState<IDateRange>({
    startDate: moment().startOf('day').toDate(),
    endDate: moment().endOf('day').toDate()
  });

  const [dateRangeString, setDateRangeString] = useState<string>('');

  useEffect(() => {
    dispatch(getEntities({
      startDate: moment(dateRange.startDate).toISOString(), endDate: moment(dateRange.endDate).toISOString()
    }));
    dispatch(getTotalPatientCount());
  }, []);

  return (
    <div className="reviewer-statistics-wrapper wrap-page">
      <h1 className="title-page">Reviewer Statistics</h1>
      <div className="m-2 mt-4 d-flex justify-content-end">
        <DateRangePicker dateRange={dateRange} setDateRange={setDateRange}
                         onSearchClick={() => {
                           dispatch(getEntities({
                             startDate: moment(dateRange.startDate).startOf('day').toISOString(),
                             endDate: moment(dateRange.endDate).endOf('day').toISOString()
                           }));

                           setDateRangeString(moment(dateRange.startDate).format('YYYY-MM-DD') + ' ~ ' + moment(dateRange.endDate).format('YYYY-MM-DD'));
                         }}/>
      </div>
      {
        !loading ?
          <article>
            <div className="left-section">
              <ReviewStatisticsBarChart/>
            </div>
            <div className="right-section">
              <div className="top-section">
                <ReviewStatisticsDoughnutChart/>
              </div>
              <div className="bottom-section">
                <ReviewStatisticsDatagrid dateRangeString={dateRangeString}/>
              </div>
            </div>
          </article>
          : <Box sx={{display: 'flex', justifyContent: 'center', alignItems: 'center', height: '80vh', width: '100%'}}>
            <div>Loading ...</div>
            <CircularProgress/>
          </Box>
      }
    </div>
  );
};

export default ReviewerStatistics;
