import React from "react";
import 'react-date-range/dist/styles.css'; // main style file
import 'react-date-range/dist/theme/default.css'; // theme css file
import './custom-date-range-picker.scss';
import {DateRangePicker} from 'react-date-range';
import moment from "moment";
import ko from "date-fns/locale/ko";
import {IDateRange} from "app/modules/date-range-picker/index";

interface ICustomDateRangePickerProps {
  dateRange: IDateRange;
  setDateRange: (dateRange: any) => void;
}

export const CustomDateRangePicker = (props: ICustomDateRangePickerProps) => {
  const {dateRange} = props;
  return (
    <div className={"custom-date-range-picker-wrapper"}>
      <DateRangePicker
        locale={ko}
        staticRanges={[]}
        inputRanges={[]}
        minDate={moment().subtract(5, 'years').toDate()}
        maxDate={new Date()}
        ranges={[{
          startDate: dateRange?.startDate,
          endDate: dateRange?.endDate,
          key: 'selection'
        }]}
        onChange={(e) => props.setDateRange(e.selection)}
        editableDateInputs={true}
        dateDisplayFormat="yyyy-MM-dd"
      />
    </div>
  );
};

