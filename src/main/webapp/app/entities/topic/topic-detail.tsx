import React, {useEffect} from 'react';
import {Link, useParams} from 'react-router-dom';
import {Button, Col, Row} from 'reactstrap';
import {Translate, TextFormat} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';

import {getEntity} from './topic.reducer';
import {APP_DATE_FORMAT} from 'app/config/constants';

export const TopicDetail = () => {
  const dispatch = useAppDispatch();

  const {id} = useParams<'id'>();

  useEffect(() => {
    dispatch(getEntity(id));
  }, []);

  const topicEntity = useAppSelector(state => state.topic.entity);
  return (
    <div className="wrap-page">
      <Row>
        <Col md="8">
          <h2 data-cy="libraryDetailsHeading" className="title-page">
            <Translate contentKey="cancerLibraryApp.topic.detail.title">Topic</Translate>
          </h2>
          <dl className="jh-entity-details">
            <dt>
              <span id="id">
                <Translate contentKey="global.field.id">ID</Translate>
              </span>
            </dt>
            <dd>{topicEntity.id}</dd>
            <dt>
              <span id="title">
                <Translate contentKey="cancerLibraryApp.topic.title">Name</Translate>
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
              <span id="orderNo">
                <Translate contentKey="cancerLibraryApp.topic.orderNo">Order No</Translate>
              </span>
            </dt>
            <dd>{topicEntity.orderNo}</dd>
            <dt>
              <span id="subject-title">
                <Translate contentKey="cancerLibraryApp.topic.subject.title">subject title</Translate>
              </span>
            </dt>
            <dd>{topicEntity.subject?.title}</dd>
            <dt>
              <Translate contentKey="cancerLibraryApp.topic.createdBy">Created By</Translate>
            </dt>
            <dd>{topicEntity.createdBy}</dd>
            <dt>
              <Translate contentKey="cancerLibraryApp.topic.createdDate">Created Date</Translate>
            </dt>
            <dd>
              {topicEntity.createdDate ? (
                <TextFormat value={topicEntity.createdDate} type="date" format={APP_DATE_FORMAT} blankOnInvalid />
              ) : null}
            </dd>
            <dt>
              <Translate contentKey="cancerLibraryApp.topic.lastModifiedBy">Last Modified By</Translate>
            </dt>
            <dd>{topicEntity.lastModifiedBy}</dd>
            <dt>
              <Translate contentKey="cancerLibraryApp.topic.lastModifiedDate">Last Modified Date</Translate>
            </dt>
            <dd>
              {topicEntity.lastModifiedDate ? (
                <TextFormat value={topicEntity.lastModifiedDate} type="date" format={APP_DATE_FORMAT} blankOnInvalid />
              ) : null}
            </dd>
          </dl>
          <Button tag={Link} to="/admin/topic" replace color="info" data-cy="entityDetailsBackButton">
            <FontAwesomeIcon icon="arrow-left" />{' '}
            <span className="d-none d-md-inline">
              <Translate contentKey="entity.action.back">Back</Translate>
            </span>
          </Button>
          &nbsp;
          <Button tag={Link} to={`/admin/topic/${topicEntity.id}/edit`} replace color="primary">
            <FontAwesomeIcon icon="pencil-alt" />{' '}
            <span className="d-none d-md-inline">
              <Translate contentKey="entity.action.edit">Edit</Translate>
            </span>
          </Button>
        </Col>
      </Row>
    </div>
  );
};

export default TopicDetail;
