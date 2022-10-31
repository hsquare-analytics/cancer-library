import * as React from 'react';
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
import {useAppSelector} from "app/config/store";

const getFormattedValue: (value: any, column: IDxColumn) => string = (value, column) => {
  if (column.dataType === 'date') {
    return convertDateFromServer(value);
  } else if (column.dataType === 'datetime') {
    return convertDateTimeFromServer(value);
  }
  return value;
}

export const PatientProfileDetail = () => {
  const patient = useAppSelector<IPatient>(state => state.datasourcePatient.entity);

  return (<Box>
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
          환자 상세
          <Button variant={"text"}>
            <FontAwesomeIcon icon={"pencil-alt"}/>
          </Button>
        </Typography>
        <TextArea height={90}
                  readOnly={true}
                  value={"Prepare 2013 Marketing Plan: We need to double revenues in 2013 and our marketing strategy is going to be key here." +
                    " R&D is improving existing products and creating new products so we can deliver great AV equipment to our customers.Robert," +
                    " please make certain to create a PowerPoint presentation for the members of the executive team."}/>
      </CardContent>
    </Card>
  </Box>);
};

export default PatientProfileDetail;
