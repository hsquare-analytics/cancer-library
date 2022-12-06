import React, {useEffect} from 'react';
import {Link, useParams} from 'react-router-dom';
import {Button, Col, Row} from 'reactstrap';
import {Translate, TextFormat} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';

import {getEntity} from './group.reducer';
import {APP_DATE_FORMAT} from 'app/config/constants';

export const GroupDetail = () => {
  const dispatch = useAppDispatch();

  const {id} = useParams<'id'>();

  useEffect(() => {
    dispatch(getEntity(id));
  }, []);

  const groupEntity = useAppSelector(state => state.group.entity);
  return (
    <div className="wrap-page">
      <Row>
        <Col md="8">
          <h2 data-cy="libraryDetailsHeading" className="title-page">
            <Translate contentKey="cancerLibraryApp.group.detail.title">Subject</Translate>
          </h2>
          <dl className="jh-entity-details">
            <dt>
              <span id="id">
                <Translate contentKey="global.field.id">ID</Translate>
              </span>
            </dt>
            <dd>{groupEntity.id}</dd>
            <dt>
              <span id="title">
                <Translate contentKey="cancerLibraryApp.group.title">Title</Translate>
              </span>
            </dt>
            <dd>{groupEntity.title}</dd>
            <dt>
              <span id="activated">
                <Translate contentKey="cancerLibraryApp.group.activated">Activated</Translate>
              </span>
            </dt>
            <dd>{groupEntity.activated ? 'true' : 'false'}</dd>
            <dt>
              <span id="orderNo">
                <Translate contentKey="cancerLibraryApp.group.orderNo">Order No</Translate>
              </span>
            </dt>
            <dd>{groupEntity.orderNo}</dd>
            <dt>
              <span id="category-title">
                <Translate contentKey="cancerLibraryApp.group.category.title">category title</Translate>
              </span>
            </dt>
            <dd>{groupEntity.category?.name}</dd>
            <dt>
              <Translate contentKey="cancerLibraryApp.group.createdBy">Created By</Translate>
            </dt>
            <dd>{groupEntity.createdBy}</dd>
            <dt>
              <Translate contentKey="cancerLibraryApp.group.createdDate">Created Date</Translate>
            </dt>
            <dd>
              {groupEntity.createdDate ? (
                <TextFormat value={groupEntity.createdDate} type="date" format={APP_DATE_FORMAT} blankOnInvalid />
              ) : null}
            </dd>
            <dt>
              <Translate contentKey="cancerLibraryApp.group.lastModifiedBy">Last Modified By</Translate>
            </dt>
            <dd>{groupEntity.lastModifiedBy}</dd>
            <dt>
              <Translate contentKey="cancerLibraryApp.group.lastModifiedDate">Last Modified Date</Translate>
            </dt>
            <dd>
              {groupEntity.lastModifiedDate ? (
                <TextFormat value={groupEntity.lastModifiedDate} type="date" format={APP_DATE_FORMAT} blankOnInvalid />
              ) : null}
            </dd>
          </dl>
          <Button tag={Link} to="/admin/group" replace color="info" data-cy="entityDetailsBackButton">
            <FontAwesomeIcon icon="arrow-left" />{' '}
            <span className="d-none d-md-inline">
              <Translate contentKey="entity.action.back">Back</Translate>
            </span>
          </Button>
          &nbsp;
          <Button tag={Link} to={`/admin/group/${groupEntity.id}/edit`} replace color="primary">
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

export default GroupDetail;
