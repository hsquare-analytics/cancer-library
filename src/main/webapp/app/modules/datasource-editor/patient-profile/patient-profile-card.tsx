import * as React from 'react';
import Typography from '@mui/material/Typography';
import Accordion from '@mui/material/Accordion';
import AccordionSummary from '@mui/material/AccordionSummary';
import AccordionDetails from '@mui/material/AccordionDetails';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
import { IPatient } from 'app/shared/model/patient.model';
import { translate } from 'react-jhipster';
import Chip from '@mui/material/Chip';
import { useAppSelector } from 'app/config/store';
import CircularProgress from '@mui/material/CircularProgress';

import Box from '@mui/material/Box';
import PatientProfileCardDetail from 'app/modules/datasource-editor/patient-profile/patient-profile-card-detail';
import { REVIEW_LIST } from 'app/config/datasource-constants';
import DatasourceStackButton from 'app/modules/datasource-editor/stack-button/datasource-stack-button';
import { Badge } from 'reactstrap';

const PatientStatusChip = (status: string) => {
  switch (status) {
    case REVIEW_LIST.DECLINED:
      return (
        // <Chip label={translate('cancerLibraryApp.datasourceEditor.review.declined')} color="error" size="small" />
        <span className="badge-chip declined">{translate('cancerLibraryApp.datasourceEditor.review.declined')}</span>
      );
    case REVIEW_LIST.APPROVED:
      return (
        // <Chip label={translate('cancerLibraryApp.datasourceEditor.review.approved')} color="success" size="small" />
        <span className="badge-chip approved">{translate('cancerLibraryApp.datasourceEditor.review.approved')}</span>
      );
    case REVIEW_LIST.SUBMITTED:
      return (
        // <Chip label={translate('cancerLibraryApp.datasourceEditor.review.submitted')} color="info" size="small" />
        <span className="badge-chip submitted">{translate('cancerLibraryApp.datasourceEditor.review.submitted')}</span>
      );
    default:
      return (
        // <Chip label={translate('cancerLibraryApp.datasourceEditor.review.initial')} color="secondary" size="small" />
        <span className="badge-chip">{translate('cancerLibraryApp.datasourceEditor.review.initial')}</span>
      );
  }
};

interface IPatientProfileCardProps {
  setPopupVisible: (popupVisible: boolean) => void;
}

export const PatientProfileCard = (props: IPatientProfileCardProps) => {
  const patient = useAppSelector<IPatient>(state => state.datasourcePatient.entity);
  const loading = useAppSelector<IPatient>(state => state.datasourcePatient.loading);

  return (
    <Accordion
      defaultExpanded={true}
      sx={{
        '& .MuiAccordionSummary-contentGutters': { justifyContent: 'space-between' },
      }}
    >
      <AccordionSummary expandIcon={<ExpandMoreIcon />} aria-controls="panel1a-content" id="panel1a-header">
        <div className={'d-flex'} style={{ alignItems: 'center' }}>
          <Typography sx={{ display: 'flex', alignItems: 'center', marginRight: '15px' }}>
            {translate(
              'cancerLibraryApp.datasourceEditor.profileCard.title',
              patient
                ? {
                    no: patient.ptNo,
                    name: patient.ptNm,
                  }
                : ''
            )}
          </Typography>
          {patient && PatientStatusChip(patient.status)}
        </div>
        <DatasourceStackButton setPopupVisible={props.setPopupVisible} />
      </AccordionSummary>
      <AccordionDetails sx={{ padding: '0 0 8px 0' }}>
        {!loading ? (
          <PatientProfileCardDetail patient={patient} />
        ) : (
          <Box
            sx={{
              width: '100%',
              height: '200px',
              display: 'flex',
              justifyContent: 'center',
              alignItems: 'center',
              border: '1px solid lightgrey',
            }}
          >
            {' '}
            <CircularProgress />{' '}
          </Box>
        )}
      </AccordionDetails>
    </Accordion>
  );
};

export default PatientProfileCard;
