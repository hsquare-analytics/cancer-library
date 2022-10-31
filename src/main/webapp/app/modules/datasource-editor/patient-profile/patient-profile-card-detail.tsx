import React, {useState} from 'react';
import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import Typography from '@mui/material/Typography';
import {IPatient} from "app/shared/model/patient.model";
import {translate} from "react-jhipster";
import Box from '@mui/material/Box';
import TextBox from 'devextreme-react/text-box';
import AccessiblePatientColumn from "app/modules/datasource-editor/accessible-patient.column";
import TextArea from 'devextreme-react/text-area';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import Button from '@mui/material/Button';
import {IDxColumn} from "app/shared/model/dx-column.model";
import {convertDateFromServer, convertDateTimeFromServer} from "app/shared/util/date-utils";
import {useAppDispatch} from "app/config/store";
import {Popup} from 'devextreme-react/popup';
import {updateEntity} from "app/modules/datasource-editor/reducer/datasource.patient.reducer";


const getFormattedValue: (value: any, column: IDxColumn) => string = (value, column) => {
  if (column.dataType === 'date') {
    return convertDateFromServer(value);
  } else if (column.dataType === 'datetime') {
    return convertDateTimeFromServer(value);
  }
  return value;
}

interface IPatientProfileDetailProps {
  patient: IPatient;
}

export const PatientProfileCardDetail = (props: IPatientProfileDetailProps) => {
  const dispatch = useAppDispatch();

  const {patient} = props;

  const [commentValue, setCommentValue] = useState(patient ? patient.comment : '');
  const [isPopupVisible, setIsPopupVisible] = useState<boolean>(false);

  return (
    <div>
      <Box>
        <Card variant="outlined">
          <div className="d-flex align-items-center">
            {AccessiblePatientColumn.map((column) => <CardContent key={column.dataField}>
                <Typography color="text.secondary">
                  {translate("cancerLibraryApp.patient." + column.dataField)}
                </Typography>
                <Typography component="span" color="text.default">
                  <TextBox value={getFormattedValue(patient[column.dataField], column)} readOnly={true}
                           stylingMode={"underlined"}/>
                </Typography>
              </CardContent>
            )}
          </div>
          <CardContent>
            <Typography color="text.secondary">
              {translate("cancerLibraryApp.datasource.profileCard.comment")}
              <Button variant={"text"} onClick={() => setIsPopupVisible(true)}>
                <FontAwesomeIcon icon={"pencil-alt"}/>
              </Button>
            </Typography>
            <TextArea height={90}
                      readOnly={true}
                      defaultValue={patient.comment}/>
          </CardContent>
        </Card>
      </Box>
      <Popup
        visible={isPopupVisible} onHiding={() => setIsPopupVisible(false)} dragEnabled={false} hideOnOutsideClick={true}
        showCloseButton={false} showTitle={false} width={'60vw'} height={'50vh'}
        toolbarItems={[{
          location: 'after', widget: 'dxButton', toolbar: "bottom",
          options: {
            text: 'SAVE', onClick() {
              dispatch(updateEntity({...patient, comment: commentValue}))
              setIsPopupVisible(false);
              setCommentValue('');
            },
          },
        }, {
          location: 'after', widget: 'dxButton', toolbar: "bottom",
          options: {
            text: 'CANCEL', onClick() {
              setIsPopupVisible(false);
              setCommentValue('');
            },
          },
        },
        ]}
      >
        <TextArea height={'43vh'} width={'100%'} defaultValue={patient.comment} value={commentValue}
                  onValueChanged={(e) => setCommentValue(e.value)}/>
      </Popup>
    </div>
  );
};

export default PatientProfileCardDetail;
