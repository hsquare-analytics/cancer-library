import React from "react";
import 'react-date-range/dist/styles.css'; // main style file
import 'react-date-range/dist/theme/default.css'; // theme css file
import './custom-date-range-picker.scss';
import {DateRangePicker} from 'react-date-range';
import moment from "moment";
import ko from "date-fns/locale/ko"; // the locale you want

interface ICustomDateRangePickerProps {
  selectionRange: {
    startDate: Date,
    endDate: Date
  },
  onChange: (selectionRange: any) => void;
}

export const CustomDateRangePicker = (props: ICustomDateRangePickerProps) => {

  const {selectionRange, onChange} = props;

  return (
    <div className={"custom-date-range-picker-wrapper"}>
      <DateRangePicker
        locale={ko}
        staticRanges={[]}
        inputRanges={[]}
        minDate={moment().subtract(5, 'years').toDate()}
        maxDate={new Date()}
        ranges={[{
          startDate: selectionRange?.startDate,
          endDate: selectionRange?.endDate,
          key: 'selection'
        }]}
        onChange={(e) => onChange(e.selection)}
        editableDateInputs={true}
      />
    </div>
  );
};

