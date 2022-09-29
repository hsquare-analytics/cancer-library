import React, {useEffect} from 'react';
import {Link, useNavigate, useParams} from 'react-router-dom';
import {Button, Col, Row} from 'reactstrap';
import {Translate, translate, ValidatedField, ValidatedForm} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {createEntity, getEntity, reset, updateEntity} from './user-patient.reducer';
import {getUsers} from "app/modules/administration/user-management/user-management.reducer";

export const UserPatientUpdate = () => {
  const dispatch = useAppDispatch();

  const navigate = useNavigate();

  const { id } = useParams<'id'>();
  const isNew = id === undefined;

  const userPatientEntity = useAppSelector(state => state.userPatient.entity);
  const loading = useAppSelector(state => state.userPatient.loading);
  const updating = useAppSelector(state => state.userPatient.updating);
  const updateSuccess = useAppSelector(state => state.userPatient.updateSuccess);
  const users = useAppSelector(state => state.userManagement.users);

  const handleClose = () => {
    navigate('/admin/user-patient' + location.search);
  };

  useEffect(() => {
    if (isNew) {
      dispatch(reset());
    } else {
      dispatch(getEntity(id));
    }

     if (users.length === 0) {
          dispatch(getUsers({}));
      }

  }, []);

  useEffect(() => {
    if (updateSuccess) {
      handleClose();
    }
  }, [updateSuccess]);

  const saveEntity = values => {
    const entity = {
      ...userPatientEntity,
      ...values,
    };

    if (isNew) {
      dispatch(createEntity(entity));
    } else {
      dispatch(updateEntity(entity));
    }
  };

  const defaultValues = () =>
    isNew
      ? {}
      : {
          ...userPatientEntity,
        };

  return (
    <div>
      <Row className="justify-content-center">
        <Col md="8">
          <h2 id="cancerLibraryApp.userPatient.home.createOrEditLabel" data-cy="PointCreateUpdateHeading">
            <Translate contentKey="cancerLibraryApp.userPatient.home.createOrEditLabel">Create or edit a Point</Translate>
          </h2>
        </Col>
      </Row>
      <Row className="justify-content-center">
        <Col md="8">
          {loading ? (
            <p>Loading...</p>
          ) : (
            <ValidatedForm defaultValues={defaultValues()} onSubmit={saveEntity}>
              {!isNew ? (
                <ValidatedField
                  name="id"
                  required
                  readOnly
                  id="user-patient-id"
                  label={translate('global.field.id')}
                  validate={{ required: true }}
                />
              ) : null}
                <ValidatedField type="select" name="user.id" data-cy="user"
                                label={translate('cancerLibraryApp.userPatient.user.login')}
                                validate={{required: true}} >
                    <option value="">-</option>
                    {users.map(user => (
                        <option value={user.id} key={user}>
                            {user.login}
                        </option>
                    ))}
                </ValidatedField>
              <ValidatedField
                label={translate('cancerLibraryApp.userPatient.patientNo')}
                id="user-patient-patientNo"
                name="patientNo"
                data-cy="patientNo"
                type="text"
                validate={{ required: { value: true, message: translate('entity.validation.required') }, }}
              />
              <Button tag={Link} id="cancel-save" data-cy="entityCreateCancelButton" to="/admin/user-patient" replace color="info">
                <FontAwesomeIcon icon="arrow-left" />
                &nbsp;
                <span className="d-none d-md-inline">
                  <Translate contentKey="entity.action.back">Back</Translate>
                </span>
              </Button>
              &nbsp;
              <Button color="primary" id="save-entity" data-cy="entityCreateSaveButton" type="submit" disabled={updating}>
                <FontAwesomeIcon icon="save" />
                &nbsp;
                <Translate contentKey="entity.action.save">Save</Translate>
              </Button>
            </ValidatedForm>
          )}
        </Col>
      </Row>
    </div>
  );
};

export default UserPatientUpdate;
