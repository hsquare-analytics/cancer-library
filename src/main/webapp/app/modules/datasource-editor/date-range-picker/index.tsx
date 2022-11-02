import React from "react";
import {APP_LOCAL_DATE_FORMAT} from "app/config/constants";
import {CustomDateRangePicker} from "app/modules/datasource-editor/date-range-picker/custom-date-range-picker";
import Button from '@mui/material/Button';
import Popover from '@mui/material/Popover';
import moment from "moment";
import Search from '@mui/icons-material/Search';
import IconButton from '@mui/material/IconButton';
import {useAppDispatch, useAppSelector} from "app/config/store";
import {getEntities} from "app/modules/datasource-editor/reducer/datasource.patient.reducer";


export const CustomDateRangePopover = () => {
  const dispatch = useAppDispatch();

  const dateRange = useAppSelector(state => state.datasourceStatus.dateRange);

  const [anchorEl, setAnchorEl] = React.useState<HTMLButtonElement | null>(null);

  const onDateRangeBoxClick = (event: React.MouseEvent<HTMLButtonElement>) => {
    setAnchorEl(event.currentTarget);
  };

  const onPopoverClose = () => {
    setAnchorEl(null);
  }

  const onSearchClick = () => {
    dispatch(getEntities(dateRange));
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
      <CustomDateRangePicker/>
    </Popover>
  </>
}

export default CustomDateRangePopover;
