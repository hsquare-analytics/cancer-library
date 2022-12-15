import React from 'react';
import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import Typography from '@mui/material/Typography';
import {IPatient} from 'app/shared/model/patient.model';
import {translate} from 'react-jhipster';
import Box from '@mui/material/Box';
import AccessiblePatientColumn from 'app/modules/datasource-editor/accessible-patient.column';
import {IDxColumn} from 'app/shared/model/dx-column.model';
import {convertDateFromServer, convertDateTimeFromServer} from 'app/shared/util/date-utils';
import './patient-profile-card-detail.scss';
import TextField from '@mui/material/TextField';
import {createTheme, ThemeProvider} from '@mui/material/styles';
import Grid from '@mui/material/Grid';
import {
  PatientProfileCardTextarea
} from "app/modules/datasource-editor/patient-profile/textarea/patient-profile-card-textarea";

const getFormattedValue: (value: any, column: IDxColumn) => string = (value, column) => {
  if (column.dataType === 'date') {
    return convertDateFromServer(value);
  } else if (column.dataType === 'datetime') {
    return convertDateTimeFromServer(value);
  }
  return value;
};

interface IPatientProfileDetailProps {
  patient: IPatient;
}

const theme = createTheme({
  components: {
    MuiInput: {
      styleOverrides: {
        root: {
          // '&:before': {
          //   borderBottom: '1px dotted rgba(0, 0, 0, 0.42)',
          // },
          // '&:hover:not(.Mui-disabled):before': {
          //   borderBottom: '1px dotted rgba(0, 0, 0, 0.42)',
          // },
        },
      },
    },
  },
});

const getTextFieldCardContent = (column: IDxColumn, patient: IPatient) => {
  const value = patient[column.dataField] || patient.detail[column.dataField.split(".")[1]];
  const formatted = getFormattedValue(value, column);
  return <CardContent key={column.dataField}>
    <Typography
      color="text.secondary">{translate(column.caption) || column.dataField}</Typography>
    <Typography component="span" color="text.default">
      <TextField
        value={formatted}
        variant={'standard'}
        InputProps={{readOnly: true}}
        className="text-field"
      />
    </Typography>
  </CardContent>;
}

export const PatientProfileCardDetail = (props: IPatientProfileDetailProps) => {
  const {patient} = props;

  return (
    <div>
      <ThemeProvider theme={theme}>
        <Box>
          <Card variant="outlined" className="box-patient-profile">
            <div className="d-flex align-items-center">
              {AccessiblePatientColumn.map(column => getTextFieldCardContent(column, patient))}
            </div>
            <CardContent>
              <Box>
                <Grid container spacing={2}>
                  <PatientProfileCardTextarea/>
                  <PatientProfileCardTextarea/>
                </Grid>
              </Box>

            </CardContent>
          </Card>
        </Box>

      </ThemeProvider>
    </div>
  );
};

export default PatientProfileCardDetail;
