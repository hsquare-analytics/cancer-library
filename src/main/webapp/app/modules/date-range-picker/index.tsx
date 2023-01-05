import React, {useState} from "react";
import {APP_LOCAL_DATE_FORMAT} from "app/config/constants";
import {CustomDateRangePicker} from "app/modules/date-range-picker/custom-date-range-picker";
import Button from '@mui/material/Button';
import Popover from '@mui/material/Popover';
import moment from "moment";
import Search from '@mui/icons-material/Search';
import IconButton from '@mui/material/IconButton';


export interface IDateRange {
  startDate: Date;
  endDate: Date;
}

interface ICustomDateRangePopoverProps {
  dateRange: IDateRange;
  setDateRange;

  onSearchClick: () => void;
}

export const CustomDateRangePopover = (props: ICustomDateRangePopoverProps) => {

  const {dateRange} = props;

  const [anchorEl, setAnchorEl] = React.useState<HTMLButtonElement | null>(null);

  const onDateRangeBoxClick = (event: React.MouseEvent<HTMLButtonElement>) => {
    setAnchorEl(event.currentTarget);
  };

  const onPopoverClose = () => {
    setAnchorEl(null);
  }

  const onSearchClick = () => {
    props.onSearchClick();
  }

  return <>
    <Button variant="outlined"
            className={"me-2"}
            onClick={onDateRangeBoxClick}>{`제출 기간: ${moment(dateRange.startDate).format(APP_LOCAL_DATE_FORMAT)} ~ ${moment(dateRange.endDate).format(APP_LOCAL_DATE_FORMAT)}`}</Button>
    <IconButton color="primary" aria-label="upload picture" component="label" onClick={onSearchClick}>
      <Search/>
    </IconButton>
    <Popover
      id={open ? 'simple-popover' : undefined}
      open={Boolean(anchorEl)}
      anchorEl={anchorEl}
      onClose={onPopoverClose}
      anchorOrigin={{
        vertical: 'bottom',
        horizontal: 'left',
      }}
      transformOrigin={{
        vertical: 'top',
        horizontal: 'left',
      }}
    >
      <CustomDateRangePicker
        dateRange={dateRange}
        setDateRange={props.setDateRange}
      />
    </Popover>
  </>
}

export default CustomDateRangePopover;
