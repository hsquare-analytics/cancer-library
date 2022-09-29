import React, { useEffect } from 'react';
import { Link, useParams } from 'react-router-dom';
import { Button, Row, Col } from 'reactstrap';
import { Translate, TextFormat } from 'react-jhipster';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

import { APP_DATE_FORMAT, APP_LOCAL_DATE_FORMAT } from 'app/config/constants';
import { useAppDispatch, useAppSelector } from 'app/config/store';

import { getEntity } from './user-patient.reducer';

export const UserPatientDetail = () => {
  const dispatch = useAppDispatch();

  const { id } = useParams<'id'>();

  useEffect(() => {
    dispatch(getEntity(id));
  }, []);

  const userPatientEntity = useAppSelector(state => state.userPatient.entity);
  return (
    <Row>
      <Col md="8">
        <h2 data-cy="pointDetailsHeading">
          <Translate contentKey="cancerLibraryApp.userPatient.detail.title">User Patient</Translate>
        </h2>
        <dl className="jh-entity-details">
          <dt>
            <span id="id">
              <Translate contentKey="global.field.id">ID</Translate>
            </span>
          </dt>
          <dd>{userPatientEntity.id}</dd>
          <dt>
            <span id="user.login">
              <Translate contentKey="cancerLibraryApp.userPatient.user.login">User Login</Translate>
            </span>
          </dt>
          <dd>{userPatientEntity.user?.login}</dd>
          <dt>
            <span id="patientNo">
              <Translate contentKey="cancerLibraryApp.userPatient.patientNo">Patient No </Translate>
            </span>
          </dt>
          <dd>{userPatientEntity.patientNo}</dd>
            <dt>
                <Translate contentKey="cancerLibraryApp.userPatient.createdBy">Created By</Translate>
            </dt>
            <dd>{userPatientEntity.createdBy}</dd>
            <dt>
                <Translate contentKey="cancerLibraryApp.userPatient.createdDate">Created Date</Translate>
            </dt>
            <dd>{userPatientEntity.createdDate ? <TextFormat value={userPatientEntity.createdDate} type="date" format={APP_DATE_FORMAT} blankOnInvalid /> : null}</dd>
            <dt>
                <Translate contentKey="cancerLibraryApp.userPatient.lastModifiedBy">Last Modified By</Translate>
            </dt>
            <dd>{userPatientEntity.lastModifiedBy}</dd>
            <dt>
                <Translate contentKey="cancerLibraryApp.userPatient.lastModifiedDate">Last Modified Date</Translate>
            </dt>
        </dl>
        <Button tag={Link} to="/admin/user-patient" replace color="info" data-cy="entityDetailsBackButton">
          <FontAwesomeIcon icon="arrow-left" />{' '}
          <span className="d-none d-md-inline">
            <Translate contentKey="entity.action.back">Back</Translate>
          </span>
        </Button>
        &nbsp;
        <Button tag={Link} to={`/admin/user-patient/${userPatientEntity.id}/edit`} replace color="primary">
          <FontAwesomeIcon icon="pencil-alt" />{' '}
          <span className="d-none d-md-inline">
            <Translate contentKey="entity.action.edit">Edit</Translate>
          </span>
        </Button>
      </Col>
    </Row>
  );
};

export default UserPatientDetail;
