import React, {useEffect} from 'react';
import {AUTHORITIES} from 'app/config/constants';
import Button from '@mui/material/Button';
import Stack from '@mui/material/Stack';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {hasAnyAuthority} from 'app/shared/auth/private-route';
import {getEntity, updateEntity as updatePatient} from 'app/modules/datasource-editor/reducer/datasource.patient.reducer';
import {translate} from 'react-jhipster';
import {
  fireApprovedSwal,
  fireDeclineReasonSwal,
  fireDeclineSwal,
  fireSubmitSwal,
} from 'app/modules/datasource-editor/stack-button/datasource.swal-fires';
import {REVIEW_LIST} from 'app/config/datasource-constants';

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
  const updateSuccess = useAppSelector(state => state.datasourcePatient.updateSuccess);
  const login = useAppSelector(state => state.authentication.account.login);
  const dateRange = useAppSelector(state => state.datasourceStatus.dateRange);

  useEffect(() => {
    if (updateSuccess) {
      dispatch(getEntity(patient.ptNo));
    }
  }, [updateSuccess]);

  const canSubmit = () => {
    if (!patient) {
      return false;
    }
    return patient.status !== REVIEW_LIST.APPROVED;
  };

  const canNotSubmit = () => {
    return !canSubmit();
  };

  const getLocalPatient = (status: string) => {
    const result = {
      ...patient,
      status,
      lastModifiedBy: login,
      lastModifiedDate: new Date(),
    };

    if (status === REVIEW_LIST.SUBMITTED) {
      return {
        ...result,
        createdBy: login,
        createdDate: new Date(),
      };
    }

    return result;
  };

  const onDeclinedButtonClick = () => {
    fireDeclineSwal(patient).then(({isConfirmed, text}) => {
      if (isConfirmed) {
        const payload = {
          entity: {...getLocalPatient(REVIEW_LIST.DECLINED), declineReason: text},
          dateRange,
        };
        dispatch(updatePatient(payload));
      }
    });
  };

  const onApprovedButtonClick = () => {
    fireApprovedSwal(patient).then(({isConfirmed}) => {
      if (isConfirmed) {
        const payload = {
          entity: {...getLocalPatient(REVIEW_LIST.APPROVED)},
          dateRange,
        };
        dispatch(updatePatient(payload));
      }
    });
  };

  const onSubmittedButtonClick = () => {
    fireSubmitSwal(patient).then(({isConfirmed}) => {
      if (isConfirmed) {
        const payload = {
          entity: {...getLocalPatient(REVIEW_LIST.SUBMITTED)},
          dateRange,
        };
        dispatch(updatePatient(payload));
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
        닫기
      </Button>
      {patient && patient.status === REVIEW_LIST.DECLINED && canNotDecline() && (
        <Button
          variant="outlined"
          color="warning"
          size={'small'}
          onClick={e => {
            e.stopPropagation();
            onDeclineReasonButtonClick();
          }}
        >
          거부 사유
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
          >
            {translate('cancerLibraryApp.datasourceEditor.reviewButton.decline')}
          </Button>
          <Button
            variant="contained"
            color="primary"
            onClick={e => {
              e.stopPropagation();
              onApprovedButtonClick();
            }}
          >
            {translate('cancerLibraryApp.datasourceEditor.reviewButton.approve')}
          </Button>{' '}
        </>
      ) : (
        <Button
          variant="contained"
          color="info"
          disabled={canNotSubmit()}
          onClick={e => {
            e.stopPropagation();
            onSubmittedButtonClick();
          }}
        >
          {translate('cancerLibraryApp.datasourceEditor.reviewButton.submit')}
        </Button>
      )}
    </Stack>
  );
};

export default DatasourceStackButton;
