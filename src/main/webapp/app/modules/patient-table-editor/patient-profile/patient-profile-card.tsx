import * as React from 'react';
import Box from '@mui/material/Box';
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


const patientStatusChip = (status: string) => {
  switch (status) {
    case REVIEW_LIST.DECLINED:
      return <Chip label="승인 거부" color="error"/>;
    case REVIEW_LIST.APPROVED:
      return <Chip label="승인 완료" color="success"/>;
    case REVIEW_LIST.SUBMITTED:
      return <Chip label="승인 대기" color="info"/>;
    default:
      return <Chip label="처리전" color="secondary"/>;
  }
}

export const PatientProfileCard = () => {
  const patient = useAppSelector<IPatient>(state => state.patientTableEditor.patient);

  return (
    <Accordion defaultExpanded={true}>
      <AccordionSummary
        expandIcon={<ExpandMoreIcon/>}
        aria-controls="panel1a-content"
        id="panel1a-header"
      >
        <Typography sx={{display: 'flex', alignItems: 'center', marginRight: "15px"}}>환자
          정보 {patient ? ` - ${patient.ptNm} (${patient.ptNo})` : ''}</Typography>
        {patient && patientStatusChip(patient.status)}
      </AccordionSummary>
      <AccordionDetails sx={{padding: "0 0 8px 0"}}>
        <Box>
          <Card variant="outlined" sx={{display: "flex"}}>
            {patient ? Object.entries(patient).map(([key, value]) => <CardContent key={key}>
                <Typography color="text.secondary">
                  {translate("cancerLibraryApp.patient." + key)}
                </Typography>
                <Typography component="span" color="text.default">
                  {value}
                </Typography>
              </CardContent>
            ) : null}
          </Card>
        </Box>
      </AccordionDetails>
    </Accordion>
  );
}

export default PatientProfileCard;