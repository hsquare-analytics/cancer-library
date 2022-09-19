import React, {useEffect} from 'react';
import {Link, useParams} from 'react-router-dom';
import {Button, Col, Row} from 'reactstrap';
import {Translate, TextFormat} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';

import {getEntity} from './topic.reducer';
import {APP_DATE_FORMAT} from "app/config/constants";

export const TopicDetail = () => {
  const dispatch = useAppDispatch();

  const {id} = useParams<'id'>();

  useEffect(() => {
    dispatch(getEntity(id));
  }, []);

  const topicEntity = useAppSelector(state => state.topic.entity);
  return (
    <Row>
      <Col md="8">
        <h2 data-cy="libraryDetailsHeading">
          <Translate contentKey="cancerLibraryApp.topic.detail.title">Subject</Translate>
        </h2>
        <dl className="jh-entity-details">
          <dt>
            <span id="id">
              <Translate contentKey="global.field.id">ID</Translate>
            </span>
          </dt>
          <dd>{topicEntity.id}</dd>
          <dt>
            <span id="seq">
              <Translate contentKey="cancerLibraryApp.topic.seq">Seq</Translate>
            </span>
          </dt>
          <dt>
            <span id="name">
              <Translate contentKey="cancerLibraryApp.topic.name">Name</Translate>
            </span>
          </dt>
          <dd>{topicEntity.name}</dd>
          <dt>
            <span id="activated">
              <Translate contentKey="cancerLibraryApp.topic.activated">Activated</Translate>
            </span>
          </dt>
          <dd>{topicEntity.activated ? 'true' : 'false'}</dd>
          <dt>
            <span id="loadDtm">
              <Translate contentKey="cancerLibraryApp.topic.loadDtm">loadDtm</Translate>
            </span>
          </dt>
          <dd>{topicEntity.loadDtm ? <TextFormat value={topicEntity.loadDtm} type="date" format={APP_DATE_FORMAT} blankOnInvalid /> : null}</dd>
          <dt>
            <span id="subject-name">
              <Translate contentKey="cancerLibraryApp.topic.subject.name">subject name</Translate>
            </span>
          </dt>
          <dd>{topicEntity.subject?.name}</dd>
        </dl>
        <Button tag={Link} to="/admin/topic" replace color="info" data-cy="entityDetailsBackButton">
          <FontAwesomeIcon icon="arrow-left"/>{' '}
          <span className="d-none d-md-inline">
            <Translate contentKey="entity.action.back">Back</Translate>
          </span>
        </Button>
        &nbsp;
        <Button tag={Link} to={`/admin/topic/${topicEntity.id}/edit`} replace color="primary">
          <FontAwesomeIcon icon="pencil-alt"/>{' '}
          <span className="d-none d-md-inline">
            <Translate contentKey="entity.action.edit">Edit</Translate>
          </span>
        </Button>
      </Col>
    </Row>
  );
};

export default TopicDetail;
