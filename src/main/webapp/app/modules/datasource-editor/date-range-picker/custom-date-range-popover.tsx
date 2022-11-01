import React, {useState} from "react";
import {APP_LOCAL_DATE_FORMAT} from "app/config/constants";
import {CustomDateRangePicker} from "app/modules/datasource-editor/date-range-picker/custom-date-range-picker";
import Button from '@mui/material/Button';
import Popover from '@mui/material/Popover';
import moment from "moment";
import Search from '@mui/icons-material/Search';
import IconButton from '@mui/material/IconButton';


export const CustomDateRangePopover = () => {

  const [selectionRange, setSelectionRange] = useState({
    startDate: moment(new Date()).subtract(3, 'month').toDate(),
    endDate: new Date(),
  });

  const [anchorEl, setAnchorEl] = React.useState<HTMLButtonElement | null>(null);

  const onDateRangeBoxClick = (event: React.MouseEvent<HTMLButtonElement>) => {
    setAnchorEl(event.currentTarget);
  };

  const onPopoverClose = () => {
    setAnchorEl(null);
  }

  return <>
    <Button variant="outlined"
            className={"me-2"}
            onClick={onDateRangeBoxClick}>{`제출일: ${moment(selectionRange.startDate).format(APP_LOCAL_DATE_FORMAT)} ~ ${moment(selectionRange.endDate).format(APP_LOCAL_DATE_FORMAT)}`}</Button>
    <IconButton color="primary" aria-label="upload picture" component="label">
      <Search />
    </IconButton>
    <Popover
      id={open ? 'simple-popover' : undefined}
      open={Boolean(anchorEl)}
      anchorEl={anchorEl}
      onClose={onPopoverClose}
      anchorOrigin={{
        vertical: 'bottom',
        horizontal: 'center',
      }}
      transformOrigin={{
        vertical: 'top',
        horizontal: 'center',
      }}
    >
      <CustomDateRangePicker selectionRange={selectionRange} onChange={(value) => setSelectionRange(value)}/>
    </Popover>
  </>
}
