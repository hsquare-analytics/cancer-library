import React, {useState} from "react";
import Typography from '@mui/material/Typography';
import {translate} from 'react-jhipster';
import Box from '@mui/material/Box';
import TextArea from 'devextreme-react/text-area';
import IconButton from '@mui/material/IconButton';
import CreateOutlinedIcon from '@mui/icons-material/CreateOutlined';
import '../patient-profile-card-detail.scss';
import {useAppDispatch, useAppSelector} from "app/config/store";
import {IPatient} from "app/shared/model/patient.model";
import Grid from '@mui/material/Grid';
import {updateEntity} from "app/modules/datasource-editor/reducer/datasource.patient.reducer";
import {Popup} from 'devextreme-react/popup';

interface IPatientDeclineReasonarea {
}

export const PatientDeclineReasonArea = (props: IPatientDeclineReasonarea) => {
  const dispatch = useAppDispatch();

  const patient = useAppSelector<IPatient>(state => state.datasourcePatient.entity);

  const [value, setValue] = useState(patient && patient.detail ? patient.detail.declineReason : '');
  const [popupVisible, setPopupVisible] = useState(false);


  return <Grid item xs={6}>
    <Typography color="text.secondary">
      * {translate('cancerLibraryApp.datasourceEditor.profileCard.declineReason')}
      <IconButton onClick={() => setPopupVisible(true)} style={{marginLeft: '3px'}}
                  className="icon-patient-detail">
        <CreateOutlinedIcon/>
      </IconButton>
    </Typography>
    <Box>
      {patient.detail.declineReason && patient.detail.declineReason.length > 0 ? (
        <TextArea
          id={'patient-profiel-card-detail-comment-text-area'}
          height={100}
          readOnly={true}
          defaultValue={patient.detail.declineReason}
        />
      ) : (
        <Typography component="span" color="text.default">
          {translate('cancerLibraryApp.datasourceEditor.profileCard.emptyContent')}
        </Typography>
      )}
      <Popup
        visible={popupVisible}
        onHiding={() => setPopupVisible(false)}
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
                dispatch(updateEntity({...patient, detail: {declineReason: value}}));
                setPopupVisible(false);
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
                setValue(patient.detail.declineReason);
                setPopupVisible(false);
              },
            },
          },
        ]}
      >
        <TextArea
          id={'patient-profiel-card-detail-comment-text-area'}
          height={'43vh'}
          width={'100%'}
          defaultValue={patient.detail.declineReason}
          value={value}
          onValueChanged={e => setValue(e.value)}
        />
      </Popup>
    </Box>
  </Grid>
}
