import * as React from 'react';
import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import Typography from '@mui/material/Typography';
import Accordion from '@mui/material/Accordion';
import AccordionSummary from '@mui/material/AccordionSummary';
import AccordionDetails from '@mui/material/AccordionDetails';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
import {IPatient} from "app/shared/model/patient.model";
import {translate} from "react-jhipster";
import Chip from '@mui/material/Chip';
import {REVIEW_LIST} from "app/config/constants";
import {useAppSelector} from "app/config/store";
import CircularProgress from '@mui/material/CircularProgress';
import Box from '@mui/material/Box';
import {convertDateFromServer, convertDateTimeFromServer} from "app/shared/util/date-utils";
import TextBox from 'devextreme-react/text-box';

const PatientStatusChip = (status: string) => {
  switch (status) {
    case REVIEW_LIST.DECLINED:
      return <Chip label={translate("cancerLibraryApp.patientTableEditor.review.declined")} color="error"/>;
    case REVIEW_LIST.APPROVED:
      return <Chip label={translate("cancerLibraryApp.patientTableEditor.review.approved")} color="success"/>;
    case REVIEW_LIST.SUBMITTED:
      return <Chip label={translate("cancerLibraryApp.patientTableEditor.review.submitted")} color="info"/>;
    default:
      return <Chip label={translate("cancerLibraryApp.patientTableEditor.review.initial")} color="secondary"/>;
  }
}

const getFormattedValue: (string, any, array) => string = (key: string, value: any, dateKeys: string[]) => {
  if (Date.parse(value)) {
    if (dateKeys.includes(key)) {
      return convertDateFromServer(value);
    }
    return convertDateTimeFromServer(value);
  }
  return value;
}
const PatientProfileDetail = (patient: IPatient) => {
  return (<Box>
    <Card variant="outlined" sx={{display: "flex"}}>
      {patient ? Object.entries(patient).map(([key, value]) => <CardContent key={key}>
          <Typography color="text.secondary">
            {translate("cancerLibraryApp.patient." + key)}
          </Typography>
          <Typography component="span" color="text.default">
            <TextBox value={getFormattedValue(key, value, ['ptBrdyDt', 'idxDt'])} readOnly={true} stylingMode={"underlined"}/>
          </Typography>
        </CardContent>
      ) : null}
    </Card>
  </Box>);
};

export const PatientProfileCard = () => {
  const patient = useAppSelector<IPatient>(state => state.patientTableEditor.patient);
  const loading = useAppSelector<IPatient>(state => state.patientTableEditor.loading.patient);

  return (
    <Accordion defaultExpanded={true} expanded={true}>
      <AccordionSummary expandIcon={<ExpandMoreIcon/>} aria-controls="panel1a-content" id="panel1a-header">
        <Typography sx={{display: 'flex', alignItems: 'center', marginRight: "15px"}}>
          {translate("cancerLibraryApp.patientTableEditor.profileCard.title", patient ? {
            no: patient.ptNo, name: patient.ptNm
          } : '')}</Typography>
        {patient && PatientStatusChip(patient.status)}
      </AccordionSummary>
      <AccordionDetails sx={{padding: "0 0 8px 0"}}>
        {!loading ?
          PatientProfileDetail(patient)
          : <Box sx={{
            width: '100%', height: '100px', display: 'flex', justifyContent: 'center',
            alignItems: 'center', border: '1px solid lightgrey'
          }}> <CircularProgress/> </Box>
        }
      </AccordionDetails>
    </Accordion>
  )
}

export default PatientProfileCard;
