import React from 'react';
import {DateRangePicker} from 'react-date-range';
import 'react-date-range/dist/styles.css'; // main style file
import 'react-date-range/dist/theme/default.css'; // theme css file

export interface IReviewStatisticsProps {
}

const ReviewerStatistics = (props: IReviewStatisticsProps) => {
  const selectionRange = {
    startDate: new Date(),
    endDate: new Date(),
    key: 'selection',
  }
  return (
    <div className="reviewer-statistics-wrapper wrap-page">
      <h1 className="title-page">Reviewer Statistics</h1>
      <div>
        <DateRangePicker
          ranges={[selectionRange]}
          onChange={() => {
          }}
        />
      </div>
    </div>
  );
};

export default ReviewerStatistics;
