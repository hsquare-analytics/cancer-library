import React from "react";
import 'react-date-range/dist/styles.css'; // main style file
import 'react-date-range/dist/theme/default.css'; // theme css file
import './custom-date-range-picker.scss';
import {DateRangePicker} from 'react-date-range';
import moment from "moment";
import ko from "date-fns/locale/ko";
import {useAppDispatch, useAppSelector} from "app/config/store";
import {setDateRange} from "app/modules/datasource-editor/reducer/datasource.status.reducer"; // the locale you want


export const CustomDateRangePicker = () => {
  const dispatch = useAppDispatch();

  const dateRange = useAppSelector(state => state.datasourceStatus.dateRange);

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
        onChange={(e) => dispatch(setDateRange(e.selection))}
        editableDateInputs={true}
        dateDisplayFormat="yyyy-MM-dd"
      />
    </div>
  );
};

