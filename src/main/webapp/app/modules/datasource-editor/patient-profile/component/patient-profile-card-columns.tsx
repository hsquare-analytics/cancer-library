import React from 'react';
import {useAppSelector} from "app/config/store";
import {IPatient} from "app/shared/model/patient.model";
import AccessiblePatientColumn from "app/modules/datasource-editor/accessible-patient.column";
import {IDxColumn} from "app/shared/model/dx-column.model";
import CardContent from '@mui/material/CardContent';
import Typography from '@mui/material/Typography';
import {translate} from 'react-jhipster';
import {convertDateFromServer, convertDateTimeFromServer} from 'app/shared/util/date-utils';
import './patient-profile-card-detail.scss';
import TextField from '@mui/material/TextField';

const getFormattedValue: (value: any, column: IDxColumn) => string = (value, column) => {
  if (column.dataType === 'date') {
    return convertDateFromServer(value);
  } else if (column.dataType === 'datetime') {
    return convertDateTimeFromServer(value);
  }
  return value;
};
const TextFieldCardContent = (props: { column: IDxColumn, patient: IPatient }) => {
  const {column, patient} = props;
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

const UserMarkingCardContent = (props: { column, users, patient }) => {
  const {column, users, patient} = props;

  const foundedUser = users.find(user => user.login === patient.detail[column])
  if (foundedUser) {
    return <CardContent key={column}>
      <Typography
        color="text.secondary">{translate(`cancerLibraryApp.patient.detail.${column}`)}</Typography>
      <Typography component="span" color="text.default">
        <TextField
          value={`${foundedUser.name} (${foundedUser.login})`}
          variant={'standard'}
          InputProps={{readOnly: true}}
          className="text-field"
        />
      </Typography>
    </CardContent>
  }
};

export const PatientProfileCardColumns = () => {
  const patient = useAppSelector<IPatient>(state => state.datasourcePatient.entity);
  const users = useAppSelector(state => state.userManagement.users);

  const result = AccessiblePatientColumn.filter(column => column.dataField !== 'fsrMedDt').map(column =>
    <TextFieldCardContent key={column.dataField} column={column} patient={patient}/>);

  result.splice(AccessiblePatientColumn.length - 3, 0, <UserMarkingCardContent column={'createdBy'} users={users}
                                                                             patient={patient}/>);

  result.splice(AccessiblePatientColumn.length - 1, 0, <UserMarkingCardContent column={'lastModifiedBy'} users={users}
                                                                             patient={patient}/>);

  return <>{result}</>;
}
