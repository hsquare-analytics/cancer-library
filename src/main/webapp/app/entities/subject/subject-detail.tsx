import React, {useEffect} from 'react';
import {Link, useParams} from 'react-router-dom';
import {Button, Col, Row} from 'reactstrap';
import {Translate, TextFormat} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';

import {getEntity} from './subject.reducer';
import {APP_DATE_FORMAT} from "app/config/constants";

export const SubjectDetail = () => {
  const dispatch = useAppDispatch();

  const {id} = useParams<'id'>();

  useEffect(() => {
    dispatch(getEntity(id));
  }, []);

  const subjectEntity = useAppSelector(state => state.subject.entity);
  return (
    <Row>
      <Col md="8">
        <h2 data-cy="libraryDetailsHeading">
          <Translate contentKey="cancerLibraryApp.subject.detail.title">Subject</Translate>
        </h2>
        <dl className="jh-entity-details">
          <dt>
            <span id="id">
              <Translate contentKey="global.field.id">ID</Translate>
            </span>
          </dt>
          <dd>{subjectEntity.id}</dd>
          <dt>
            <span id="seq">
              <Translate contentKey="cancerLibraryApp.subject.seq">Seq</Translate>
            </span>
          </dt>
          <dt>
            <span id="name">
              <Translate contentKey="cancerLibraryApp.subject.name">Name</Translate>
            </span>
          </dt>
          <dd>{subjectEntity.name}</dd>
          <dt>
            <span id="activated">
              <Translate contentKey="cancerLibraryApp.subject.activated">Activated</Translate>
            </span>
          </dt>
          <dd>{subjectEntity.activated ? 'true' : 'false'}</dd>
          <dt>
            <span id="loadDtm">
              <Translate contentKey="cancerLibraryApp.subject.loadDtm">loadDtm</Translate>
            </span>
          </dt>
          <dd>{subjectEntity.loadDtm ? <TextFormat value={subjectEntity.loadDtm} type="date" format={APP_DATE_FORMAT} blankOnInvalid /> : null}</dd>
        </dl>
        <Button tag={Link} to="/admin/subject" replace color="info" data-cy="entityDetailsBackButton">
          <FontAwesomeIcon icon="arrow-left"/>{' '}
          <span className="d-none d-md-inline">
            <Translate contentKey="entity.action.back">Back</Translate>
          </span>
        </Button>
        &nbsp;
        <Button tag={Link} to={`/admin/subject/${subjectEntity.id}/edit`} replace color="primary">
          <FontAwesomeIcon icon="pencil-alt"/>{' '}
          <span className="d-none d-md-inline">
            <Translate contentKey="entity.action.edit">Edit</Translate>
          </span>
        </Button>
      </Col>
    </Row>
  );
};

export default SubjectDetail;
