import * as React from 'react';
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
import PatientProfileCardDetail from "app/modules/datasource-editor/patient-profile/patient-profile-card-detail";

const PatientStatusChip = (status: string) => {
  switch (status) {
    case REVIEW_LIST.DECLINED:
      return <Chip label={translate("cancerLibraryApp.datasource.review.declined")} color="error"/>;
    case REVIEW_LIST.APPROVED:
      return <Chip label={translate("cancerLibraryApp.datasource.review.approved")} color="success"/>;
    case REVIEW_LIST.SUBMITTED:
      return <Chip label={translate("cancerLibraryApp.datasource.review.submitted")} color="info"/>;
    default:
      return <Chip label={translate("cancerLibraryApp.datasource.review.initial")} color="secondary"/>;
  }
}

export const PatientProfileCard = () => {
  const patient = useAppSelector<IPatient>(state => state.datasourcePatient.entity);
  const loading = useAppSelector<IPatient>(state => state.datasourcePatient.loading);

  return (
    <Accordion defaultExpanded={true}>
      <AccordionSummary expandIcon={<ExpandMoreIcon/>} aria-controls="panel1a-content" id="panel1a-header">
        <Typography sx={{display: 'flex', alignItems: 'center', marginRight: "15px"}}>
          {translate("cancerLibraryApp.datasource.profileCard.title", patient ? {
            no: patient.ptNo, name: patient.ptNm
          } : '')}</Typography>
        {patient && PatientStatusChip(patient.status)}
      </AccordionSummary>
      <AccordionDetails sx={{padding: "0 0 8px 0"}}>
        {!loading ?
          <PatientProfileCardDetail patient={patient}/> :
          <Box sx={{
            width: '100%', height: '200px', display: 'flex', justifyContent: 'center',
            alignItems: 'center', border: '1px solid lightgrey'
          }}> <CircularProgress/> </Box>
        }
      </AccordionDetails>
    </Accordion>
  )
}

export default PatientProfileCard;
