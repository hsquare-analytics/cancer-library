import React from 'react';
import {convertDateFromServer} from "app/shared/util/date-utils";
import CardContent from '@mui/material/CardContent';
import Typography from '@mui/material/Typography';
import {translate} from 'react-jhipster';
import './patient-profile-card-detail.scss';
import TextField from '@mui/material/TextField';
import CreateOutlinedIcon from '@mui/icons-material/CreateOutlined';
import IconButton from '@mui/material/IconButton';
import {IPatient} from "app/shared/model/patient.model";

interface IPatientProfileDetailProps {
  patient: IPatient;
}
export const PatientProfileCalendar = (props: IPatientProfileDetailProps) => {
  const {patient} = props;

  return <CardContent>
    <Typography
      color="text.secondary">{translate("cancerLibraryApp.patient.fsrMedDt")}
      <IconButton onClick={() => {
      }} style={{padding: '0', marginLeft: '3px'}}
                  className="icon-patient-detail">
        <CreateOutlinedIcon/>
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
  </CardContent>;
};
