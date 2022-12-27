import * as React from 'react';
import Typography from '@mui/material/Typography';
import Accordion from '@mui/material/Accordion';
import AccordionSummary from '@mui/material/AccordionSummary';
import AccordionDetails from '@mui/material/AccordionDetails';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
import {IPatient} from 'app/shared/model/patient.model';
import {translate} from 'react-jhipster';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import CircularProgress from '@mui/material/CircularProgress';

import Box from '@mui/material/Box';
import PatientProfileCardDetail from 'app/modules/datasource-editor/patient-profile/patient-profile-card-detail';
import {REVIEW_LIST} from 'app/config/datasource-constants';
import DatasourceStackButton from 'app/modules/datasource-editor/stack-button/datasource-stack-button';
import {setOpenAll} from "app/modules/datasource-editor/reducer/datasource.status.reducer";
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import Tooltip from '@mui/material/Tooltip';
import IconButton from '@mui/material/IconButton';


const PatientStatusChip = (status: string) => {
  switch (status) {
    case REVIEW_LIST.DECLINED:
      return (
        // <Chip label={translate('cancerLibraryApp.datasource.review.declined')} color="error" size="small" />
        <span className="badge-chip declined">{translate('cancerLibraryApp.datasource.review.declined')}</span>
      );
    case REVIEW_LIST.APPROVED:
      return (
        // <Chip label={translate('cancerLibraryApp.datasource.review.approved')} color="success" size="small" />
        <span className="badge-chip approved">{translate('cancerLibraryApp.datasource.review.approved')}</span>
      );
    case REVIEW_LIST.SUBMITTED:
      return (
        // <Chip label={translate('cancerLibraryApp.datasource.review.submitted')} color="info" size="small" />
        <span className="badge-chip submitted">{translate('cancerLibraryApp.datasource.review.submitted')}</span>
      );
    default:
      return (
        // <Chip label={translate('cancerLibraryApp.datasource.review.initial')} color="secondary" size="small" />
        <span className="badge-chip">{translate('cancerLibraryApp.datasource.review.initial')}</span>
      );
  }
};

interface IPatientProfileCardProps {
  profileExpanded: boolean;
  setProfileExpanded: (value: boolean) => void;
  setPopupVisible: (popupVisible: boolean) => void;
}

export const PatientProfileCard = (props: IPatientProfileCardProps) => {
  const dispatch = useAppDispatch();

  const patient = useAppSelector<IPatient>(state => state.datasourcePatient.entity);
  const loading = useAppSelector<IPatient>(state => state.datasourcePatient.loading);
  const openAll = useAppSelector(state => state.datasourceStatus.openAll);

  return (
    <Accordion
      expanded={props.profileExpanded}
      sx={{
        '& .MuiAccordionSummary-contentGutters': {justifyContent: 'space-between'},
      }}
      onChange={() => props.setProfileExpanded(!props.profileExpanded)}
    >
      <AccordionSummary expandIcon={<ExpandMoreIcon/>} aria-controls="panel1a-content" id="panel1a-header">
        <div className={'d-flex'} style={{alignItems: 'center'}}>
          <Tooltip title="toggle expand">
            <IconButton
              className={"me-2"}
              onClick={
                (e) => {
                  e.stopPropagation();
                  dispatch(setOpenAll(!openAll))
                }}
            >
              {openAll ? <FontAwesomeIcon icon="folder-open"/> : <FontAwesomeIcon icon="folder"/>}
            </IconButton>
          </Tooltip>
          <Typography sx={{display: 'flex', alignItems: 'center', marginRight: '15px'}}>
            {translate(
              'cancerLibraryApp.datasource.profileCard.title',
              patient
                ? {
                  no: patient.ptNo,
                  name: patient.ptNm,
                }
                : ''
            )}
          </Typography>
          {patient && PatientStatusChip(patient.detail.status)}
        </div>
        <DatasourceStackButton setPopupVisible={props.setPopupVisible}/>
      </AccordionSummary>
      <AccordionDetails sx={{padding: '0 0 8px 0'}}>
        {!loading ? (
          <PatientProfileCardDetail/>
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
            <CircularProgress/>{' '}
          </Box>
        )}
      </AccordionDetails>
    </Accordion>
  );
};

export default PatientProfileCard;
