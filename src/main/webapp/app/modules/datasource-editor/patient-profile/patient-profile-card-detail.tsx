import React, {useState} from 'react';
import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import Typography from '@mui/material/Typography';
import {IPatient} from 'app/shared/model/patient.model';
import {translate} from 'react-jhipster';
import Box from '@mui/material/Box';
import AccessiblePatientColumn from 'app/modules/datasource-editor/accessible-patient.column';
import TextArea from 'devextreme-react/text-area';
import IconButton from '@mui/material/IconButton';
import CreateOutlinedIcon from '@mui/icons-material/CreateOutlined';
import {IDxColumn} from 'app/shared/model/dx-column.model';
import {convertDateFromServer, convertDateTimeFromServer} from 'app/shared/util/date-utils';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {Popup} from 'devextreme-react/popup';
import {updateEntity} from 'app/modules/datasource-editor/reducer/datasource.patient.reducer';
import './patient-profile-card-detail.scss';
import TextField from '@mui/material/TextField';
import {createTheme, ThemeProvider} from '@mui/material/styles';

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
  const dispatch = useAppDispatch();
  const dateRange = useAppSelector(state => state.datasourceStatus.dateRange);

  const {patient} = props;

  const [commentValue, setCommentValue] = useState(patient && patient.detail ? patient.detail.comment : '');
  const [isPopupVisible, setIsPopupVisible] = useState<boolean>(false);

  return (
    <div>
      <ThemeProvider theme={theme}>
        <Box>
          <Card variant="outlined" className="box-patient-profile">
            <div className="d-flex align-items-center">
              {AccessiblePatientColumn.map(column => getTextFieldCardContent(column, patient))}
            </div>
            <CardContent>
              <Typography color="text.secondary">
                * {translate('cancerLibraryApp.datasourceEditor.profileCard.comment')}
                <IconButton onClick={() => setIsPopupVisible(true)} style={{marginLeft: '3px'}}
                            className="icon-patient-detail">
                  <CreateOutlinedIcon/>
                </IconButton>
              </Typography>
              <Box>
                {patient.detail.comment && patient.detail.comment.length > 0 ? (
                  <TextArea
                    id={'patient-profiel-card-detail-comment-text-area'}
                    height={100}
                    readOnly={true}
                    defaultValue={patient.detail.comment}
                  />
                ) : (
                  <Typography component="span" color="text.default">
                    {translate('cancerLibraryApp.datasourceEditor.profileCard.noComment')}
                  </Typography>
                )}
              </Box>
            </CardContent>
          </Card>
        </Box>
        <Popup
          visible={isPopupVisible}
          onHiding={() => setIsPopupVisible(false)}
          dragEnabled={false}
          hideOnOutsideClick={true}
          showCloseButton={false}
          showTitle={false}
          width={'60vw'}
          height={'50vh'}
          toolbarItems={[
            {
              location: 'after',
              widget: 'dxButton',
              toolbar: 'bottom',
              options: {
                text: 'SAVE',
                onClick() {
                  dispatch(updateEntity({entity: {...patient, detail: {comment: commentValue}}, dateRange}));
                  setIsPopupVisible(false);
                },
              },
            },
            {
              location: 'after',
              widget: 'dxButton',
              toolbar: 'bottom',
              options: {
                text: 'CANCEL',
                onClick() {
                  setCommentValue(patient.detail.comment);
                  setIsPopupVisible(false);
                },
              },
            },
          ]}
        >
          <TextArea
            id={'patient-profiel-card-detail-comment-text-area'}
            height={'43vh'}
            width={'100%'}
            defaultValue={patient.detail.comment}
            value={commentValue}
            onValueChanged={e => setCommentValue(e.value)}
          />
        </Popup>
      </ThemeProvider>
    </div>
  );
};

export default PatientProfileCardDetail;
