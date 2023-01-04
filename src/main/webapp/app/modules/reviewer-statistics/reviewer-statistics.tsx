import React, {useState} from 'react';
import DateRangePicker, {IDateRange} from "app/modules/date-range-picker";
import moment from "moment";

export interface IReviewStatisticsProps {
}

const ReviewerStatistics = (props: IReviewStatisticsProps) => {
  const [dateRange, setDateRange] = useState<IDateRange>({
    startDate: moment().subtract(1, 'days').toDate(),
    endDate: moment().subtract(1, 'days').toDate()
  });

  return (
    <div className="reviewer-statistics-wrapper wrap-page">
      <h1 className="title-page">Reviewer Statistics</h1>
      <div>
        <DateRangePicker dateRange={dateRange} setDateRange={setDateRange}/>
      </div>
      <div>
        {dateRange.startDate.toString()}
      </div>
      <div>
        {dateRange.endDate.toString()}
      </div>
    </div>
  );
};

export default ReviewerStatistics;
