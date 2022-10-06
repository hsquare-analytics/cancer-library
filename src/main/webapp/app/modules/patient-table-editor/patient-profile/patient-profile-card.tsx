import * as React from 'react';
import Box from '@mui/material/Box';
import Card from '@mui/material/Card';
import CardActions from '@mui/material/CardActions';
import CardContent from '@mui/material/CardContent';
import Button from '@mui/material/Button';
import Typography from '@mui/material/Typography';
import Accordion from '@mui/material/Accordion';
import AccordionSummary from '@mui/material/AccordionSummary';
import AccordionDetails from '@mui/material/AccordionDetails';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
import {IPatient} from "app/shared/model/patient.model";

const card = (
  <React.Fragment>
    <CardContent>
      <Typography sx={{fontSize: 14}} color="text.secondary" gutterBottom>
        Word of the Day
      </Typography>
      <Typography variant="h5" component="div">
        이름
      </Typography>
      <Typography sx={{mb: 1.5}} color="text.secondary">
        adjective
      </Typography>
      <Typography variant="body2">
        well meaning and kindly.
        <br/>
        {'"a benevolent smile"'}
      </Typography>
    </CardContent>
    <CardActions>
      <Button size="small">제출</Button>
    </CardActions>
  </React.Fragment>
);

export interface IPatientProfileCard {
  patient: IPatient;
}

export const PatientProfileCard = (props: IPatientProfileCard) => {
  return (
    <Accordion defaultExpanded={true} >
      <AccordionSummary
        expandIcon={<ExpandMoreIcon/>}
        aria-controls="panel1a-content"
        id="panel1a-header"
      >
        <Typography>환자 정보</Typography>
      </AccordionSummary>
      <AccordionDetails sx={{padding: "0 0 8px 0"}}>
        <Box>
          <Card variant="outlined">{card}</Card>
        </Box>
      </AccordionDetails>
    </Accordion>
  );
}

export default PatientProfileCard;
