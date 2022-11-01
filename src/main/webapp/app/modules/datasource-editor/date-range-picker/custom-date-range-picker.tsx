import React, {useState} from "react";
import 'react-date-range/dist/styles.css'; // main style file
import 'react-date-range/dist/theme/default.css'; // theme css file
import './custom-date-range-picker.scss';
import {DateRangePicker} from 'react-date-range';

export const CustomDateRangePicker = () => {

  const [selectionRange, setSelectionRange] = useState({
    startDate: new Date(), endDate: new Date(), key: 'selection'
  });

  const onChange = (selection) => {
    setSelectionRange(selection);
  }

  return (
    <div className={"custom-date-range-picker-wrapper"}>
      <DateRangePicker
        staticRanges={[]}
        inputRanges={[]}
        ranges={[selectionRange]}
        onChange={(e) => onChange(e.selection)}
        editableDateInputs={true}
      />
    </div>
  );
};

