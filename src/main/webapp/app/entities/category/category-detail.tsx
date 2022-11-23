import React, {useEffect} from 'react';
import {Link, useParams} from 'react-router-dom';
import {Button, Col, Row} from 'reactstrap';
import {TextFormat, Translate} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';

import {getEntity} from './category.reducer';
import {APP_DATE_FORMAT} from "app/config/constants";

export const CategoryDetail = () => {
  const dispatch = useAppDispatch();

  const {id} = useParams<'id'>();

  useEffect(() => {
    dispatch(getEntity(id));
  }, []);

  const categoryEntity = useAppSelector(state => state.category.entity);
  return (
    <Row>
      <Col md="8">
        <h2 data-cy="libraryDetailsHeading">
          <Translate contentKey="cancerLibraryApp.category.detail.title">Category</Translate>
        </h2>
        <dl className="jh-entity-details">
          <dt>
            <span id="id">
              <Translate contentKey="global.field.id">ID</Translate>
            </span>
          </dt>
          <dd>{categoryEntity.id}</dd>
          <dt>
            <span id="title">
              <Translate contentKey="cancerLibraryApp.category.title">Title</Translate>
            </span>
          </dt>
          <dd>{categoryEntity.title}</dd>
          <dt>
            <span id="description">
              <Translate contentKey="cancerLibraryApp.category.description">Description</Translate>
            </span>
          </dt>
          <dd>{categoryEntity.description}</dd>
          <dt>
            <span id="activated">
              <Translate contentKey="cancerLibraryApp.category.activated">Activated</Translate>
            </span>
          </dt>
          <dd>{categoryEntity.activated ? 'true' : 'false'}</dd>
          <dt>
            <span id="orderNo">
              <Translate contentKey="cancerLibraryApp.category.orderNo">Order No</Translate>
            </span>
          </dt>
          <dd>{categoryEntity.orderNo}</dd>
          <dt>
            <span id="attribute-dateColumn">
              <Translate contentKey="cancerLibraryApp.category.attribute.dateColumn">Date Column</Translate>
            </span>
          </dt>
          <dd>{categoryEntity.attribute.dateColumn}</dd>
          <dt>
            <span id="attribute-caption">
              <Translate contentKey="cancerLibraryApp.category.attribute.caption">Caption</Translate>
            </span>
          </dt>
          <dd>{categoryEntity.attribute.caption}</dd>
          <dt>
            <span id="topic-name">
              <Translate contentKey="cancerLibraryApp.category.topic.title">Topic Title</Translate>
            </span>
          </dt>
          <dd>{categoryEntity.topic?.name}</dd>
          <dt>
            <Translate contentKey="cancerLibraryApp.group.createdBy">Created By</Translate>
          </dt>
          <dd>{categoryEntity.createdBy}</dd>
          <dt>
            <Translate contentKey="cancerLibraryApp.group.createdDate">Created Date</Translate>
          </dt>
          <dd>{categoryEntity.createdDate ? <TextFormat value={categoryEntity.createdDate} type="date" format={APP_DATE_FORMAT} blankOnInvalid /> : null}</dd>
          <dt>
            <Translate contentKey="cancerLibraryApp.group.lastModifiedBy">Last Modified By</Translate>
          </dt>
          <dd>{categoryEntity.lastModifiedBy}</dd>
          <dt>
            <Translate contentKey="cancerLibraryApp.group.lastModifiedDate">Last Modified Date</Translate>
          </dt>
          <dd>
            {categoryEntity.lastModifiedDate ? (
              <TextFormat value={categoryEntity.lastModifiedDate} type="date" format={APP_DATE_FORMAT} blankOnInvalid />
            ) : null}
          </dd>
        </dl>
        <Button tag={Link} to="/admin/category" replace color="info" data-cy="entityDetailsBackButton">
          <FontAwesomeIcon icon="arrow-left"/>{' '}
          <span className="d-none d-md-inline">
            <Translate contentKey="entity.action.back">Back</Translate>
          </span>
        </Button>
        &nbsp;
        <Button tag={Link} to={`/admin/category/${categoryEntity.id}/edit`} replace color="primary">
          <FontAwesomeIcon icon="pencil-alt"/>{' '}
          <span className="d-none d-md-inline">
            <Translate contentKey="entity.action.edit">Edit</Translate>
          </span>
        </Button>
      </Col>
    </Row>
  );
};

export default CategoryDetail;
