import React, {useEffect} from 'react';
import {AUTHORITIES} from 'app/config/constants';
import Button from '@mui/material/Button';
import Stack from '@mui/material/Stack';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {hasAnyAuthority} from 'app/shared/auth/private-route';
import {
  getEntity,
  updateEntity as updatePatient
} from 'app/modules/datasource-editor/reducer/datasource.patient.reducer';
import {translate} from 'react-jhipster';
import {
  fireApprovedSwal,
  fireDeclineReasonSwal,
  fireDeclineSwal,
  fireSubmitSwal,
} from 'app/modules/datasource-editor/stack-button/datasource.swal-fires';
import {REVIEW_LIST} from 'app/config/datasource-constants';
import {IPatient} from "app/shared/model/patient.model";

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

  const canSubmit = () => {
    if (!patient.detail || !patient.detail.status) {
      return true;
    }

    if (patient.detail.status === REVIEW_LIST.DECLINED) {
      return true;
    }

    return false;
  };

  const canNotSubmit = () => {
    return !canSubmit();
  };

  const getLocalPatient = (status: string) => {
    const result: IPatient = {
      ...patient,
      detail: {
        status,
        lastModifiedBy: login,
        lastModifiedDate: new Date(),
      }
    };

    if (status === REVIEW_LIST.SUBMITTED) {
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
        const entity = {...getLocalPatient(REVIEW_LIST.DECLINED)};
        entity['detail']['declineReason'] = text;
        dispatch(updatePatient(entity));
      }
    });
  };

  const onApprovedButtonClick = () => {
    fireApprovedSwal(patient).then(({isConfirmed}) => {
      if (isConfirmed) {
        const entity = getLocalPatient(REVIEW_LIST.APPROVED);
        dispatch(updatePatient(entity));
      }
    });
  };

  const onSubmittedButtonClick = () => {
    fireSubmitSwal(patient).then(({isConfirmed}) => {
      if (isConfirmed) {
        const entity = getLocalPatient(REVIEW_LIST.SUBMITTED);
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
        닫기
      </Button>
      {patient && patient.detail.status === REVIEW_LIST.DECLINED && canNotDecline() && (
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
            {translate('cancerLibraryApp.datasource.reviewButton.decline')}
          </Button>
          <Button
            variant="contained"
            color="primary"
            onClick={e => {
              e.stopPropagation();
              onApprovedButtonClick();
            }}
          >
            {translate('cancerLibraryApp.datasource.reviewButton.approve')}
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
          {translate('cancerLibraryApp.datasource.reviewButton.submit')}
        </Button>
      )}
    </Stack>
  );
};

export default DatasourceStackButton;
