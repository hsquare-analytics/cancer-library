import React, {useEffect} from 'react';
import {convertDateFromServer} from "app/shared/util/date-utils";
import CardContent from '@mui/material/CardContent';
import Typography from '@mui/material/Typography';
import {translate} from 'react-jhipster';
import './patient-profile-card-detail.scss';
import TextField from '@mui/material/TextField';
import CreateOutlinedIcon from '@mui/icons-material/CreateOutlined';
import IconButton from '@mui/material/IconButton';
import {IPatient} from "app/shared/model/patient.model";
import DialogTitle from '@mui/material/DialogTitle';
import Dialog from '@mui/material/Dialog';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogActions from '@mui/material/DialogActions';
import Button from '@mui/material/Button';
import dayjs, {Dayjs} from 'dayjs';
import {AdapterDayjs} from '@mui/x-date-pickers/AdapterDayjs';
import {LocalizationProvider} from '@mui/x-date-pickers/LocalizationProvider';
import {StaticDatePicker} from '@mui/x-date-pickers/StaticDatePicker';
import CalendarMonthIcon from '@mui/icons-material/CalendarMonth';
import {useAppDispatch} from "app/config/store";
import {updateFirstVisitDate} from "app/modules/datasource-editor/reducer/datasource.patient.reducer";


interface IPatientProfileDetailProps {
  patient: IPatient;
}

export const PatientProfileCalendar = (props: IPatientProfileDetailProps) => {
  const dispatch = useAppDispatch();
  const {patient} = props;

  const [value, setValue] = React.useState<Dayjs | null>(dayjs('2022-04-07'));

  const [open, setOpen] = React.useState(false);

  const handleClose = () => {
    setOpen(true);
  };


  useEffect(() => {
    setValue(dayjs(patient['fsrMedDt']));
  }, [patient]);


  const onClickSave = () => {
    setOpen(false);
    dispatch(updateFirstVisitDate({
      ptNo: patient.ptNo,
      fsrMedDt: new Date(value.toString())
    }));

  }


  return <div>
    <CardContent>
      <Typography
        color="text.secondary">{translate("cancerLibraryApp.patient.fsrMedDt")}
        <IconButton onClick={() => setOpen(true)} style={{padding: '0', marginLeft: '3px'}}
                    className="icon-patient-detail">
          <CalendarMonthIcon/>
        </IconButton>
      </Typography>
      <Typography component="span" color="text.default">
        <TextField
          value={convertDateFromServer(patient['fsrMedDt'])}
          variant={'standard'}
          InputProps={{readOnly: true}}
          className="text-field"
        />
      </Typography>
    </CardContent>
    <Dialog
      open={open}
      onClose={() => setOpen(false)}
      aria-labelledby="responsive-dialog-title"
      style={{
        zIndex: 1502
      }}
      sx={{
        '& .MuiDialogContent-root': {
          padding: '0'
        }
      }}
    >
      <DialogTitle id="responsive-dialog-title">
        {"암초진일 변경"}
      </DialogTitle>
      <DialogContent>
        <LocalizationProvider dateAdapter={AdapterDayjs}>
          <StaticDatePicker
            displayStaticWrapperAs="desktop"
            openTo="day"
            value={value}
            onChange={(newValue) => {
              setValue(newValue);
            }}
            renderInput={(params) => <TextField {...params} />}
          />
        </LocalizationProvider>
      </DialogContent>
      <DialogActions>
        <Button onClick={() => onClickSave()} autoFocus>
          Save
        </Button>
        <Button autoFocus onClick={() => setOpen(false)}>
          Cancel
        </Button>
      </DialogActions>
    </Dialog>
  </div>

};
