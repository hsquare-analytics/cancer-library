import React from 'react';
import {AUTHORITIES} from 'app/config/constants';
import Button from '@mui/material/Button';
import Stack from '@mui/material/Stack';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {hasAnyAuthority} from 'app/shared/auth/private-route';
import {updateEntity as updatePatient} from 'app/modules/datasource-editor/reducer/datasource.patient.reducer';
import {translate} from 'react-jhipster';
import {
  fireApprovedSwal,
  fireDeclineReasonSwal,
  fireDeclineSwal,
  fireSubmitSwal,
} from 'app/modules/datasource-editor/stack-button/datasource.swal-fires';
import {PatientStatus} from 'app/config/datasource-constants';
import {IPatient} from "app/shared/model/patient.model";
import {canNotEditDatasource} from "app/modules/datasource-editor/stack-button/datasource.editchecker.utils";

interface IPatientTableEditorStackButtonProps {
  setPopupVisible: (popupVisible: boolean) => void;
}

export const DatasourceStackButton = (props: IPatientTableEditorStackButtonProps) => {
  const dispatch = useAppDispatch();

  const canDecline = useAppSelector(state =>
    hasAnyAuthority(state.authentication.account.authorities, [AUTHORITIES.ADMIN, AUTHORITIES.SUPERVISOR])
  );
  const canNotDecline = () => {
    return !canDecline;
  };
  const patient = useAppSelector(state => state.datasourcePatient.entity);
  const login = useAppSelector(state => state.authentication.account.login);

  const getLocalPatient = (status: string) => {
    const result: IPatient = {
      ...patient,
      detail: {
        status,
        lastModifiedBy: login,
        lastModifiedDate: new Date(),
      }
    };

    if (status === PatientStatus.REVIEW_SUBMITTED) {
      return {
        ...result,
        detail: {
          ...result.detail,
          createdBy: login,
          createdDate: new Date(),
        },
      };
    }

    return result;
  };

  const onDeclinedButtonClick = () => {
    fireDeclineSwal(patient).then(({isConfirmed, text}) => {
      if (isConfirmed) {
        const entity = {...getLocalPatient(PatientStatus.REVIEW_DECLINED)};
        entity['detail']['declineReason'] = text;
        dispatch(updatePatient(entity));
      }
    });
  };

  const onApprovedButtonClick = () => {
    fireApprovedSwal(patient).then(({isConfirmed}) => {
      if (isConfirmed) {
        const entity = getLocalPatient(PatientStatus.REVIEW_APPROVED);
        dispatch(updatePatient(entity));
      }
    });
  };

  const onSubmittedButtonClick = () => {
    fireSubmitSwal(patient).then(({isConfirmed}) => {
      if (isConfirmed) {
        const entity = getLocalPatient(PatientStatus.REVIEW_SUBMITTED);
        dispatch(updatePatient(entity));
      }
    });
  };

  const onDeclineReasonButtonClick = () => {
    fireDeclineReasonSwal(patient);
  };

  return (
    <Stack direction="row-reverse" spacing={1}>
      <Button
        variant="outlined"
        color="secondary"
        size={'small'}
        onClick={e => {
          e.stopPropagation();
          props.setPopupVisible(false);
        }}
      >
        ??????
      </Button>
      {patient && patient.detail.status === PatientStatus.REVIEW_DECLINED && canNotDecline() && (
        <Button
          variant="outlined"
          color="warning"
          size={'small'}
          onClick={e => {
            e.stopPropagation();
            onDeclineReasonButtonClick();
          }}
        >
          ?????? ??????
        </Button>
      )}

      {canDecline ? (
        <>
          <Button
            variant="contained"
            className="btn-error"
            color="error"
            onClick={e => {
              e.stopPropagation();
              onDeclinedButtonClick();
            }}
            disabled={patient.detail.status === PatientStatus.REVIEW_DECLINED}
          >
            {translate('cancerLibraryApp.datasource.reviewButton.decline')}
          </Button>
          <Button
            variant="contained"
            color="primary"
            onClick={e => {
              e.stopPropagation();
              onApprovedButtonClick();
            }}
            disabled={patient.detail.status === PatientStatus.REVIEW_APPROVED}
          >
            {translate('cancerLibraryApp.datasource.reviewButton.approve')}
          </Button>{' '}
        </>
      ) : (
        <Button
          variant="contained"
          color="info"
          disabled={canNotEditDatasource(patient)}
          onClick={e => {
            e.stopPropagation();
            onSubmittedButtonClick();
          }}
        >
          {translate('cancerLibraryApp.datasource.reviewButton.submit')}
        </Button>
      )}
    </Stack>
  );
};

export default DatasourceStackButton;
