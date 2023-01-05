import React, {useState} from 'react';
import DateRangePicker, {IDateRange} from "app/modules/date-range-picker";
import moment from "moment";
import BarChart from "app/modules/reviewer-statistics/component/bar-chart";
import "./reviewer-statistics.scss";
import DoughnutChart from "app/modules/reviewer-statistics/component/doughnut-chart";

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
      <div className="m-2 mt-4 d-flex justify-content-end">
        <DateRangePicker dateRange={dateRange} setDateRange={setDateRange}/>
      </div>
      <article>
        <div className="left-section">
          <BarChart/>
        </div>
        <div className="right-section">
          <div className="top-section">
            <DoughnutChart/>
          </div>
          <div className="bottom-section">
          </div>
        </div>
      </article>
    </div>
  );
};

export default ReviewerStatistics;
