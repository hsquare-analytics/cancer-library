import React, {useEffect} from 'react';
import {Link, useParams} from 'react-router-dom';
import {Button, Col, Row} from 'reactstrap';
import {Translate} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';

import {getEntity} from './category.reducer';

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
            <span id="seq">
              <Translate contentKey="cancerLibraryApp.category.seq">Sequence</Translate>
            </span>
          </dt>
          <dd>{categoryEntity.seq}</dd>
          <dt>
            <span id="name">
              <Translate contentKey="cancerLibraryApp.category.name">Name</Translate>
            </span>
          </dt>
          <dd>{categoryEntity.name}</dd>
          <dt>
            <span id="tableName">
              <Translate contentKey="cancerLibraryApp.category.tableName">Table Name</Translate>
            </span>
          </dt>
          <dd>{categoryEntity.tableName}</dd>
          <dt>
            <span id="indexDate">
              <Translate contentKey="cancerLibraryApp.category.indexDate">Index Date</Translate>
            </span>
          </dt>
          <dd>{categoryEntity.indexDate}</dd>
          <dt>
            <span id="activated">
              <Translate contentKey="cancerLibraryApp.category.activated">Activated</Translate>
            </span>
          </dt>
          <dd>{categoryEntity.activated ? 'true' : 'false'}</dd>
          <dt>
            <span id="topic-name">
              <Translate contentKey="cancerLibraryApp.category.topic.name">Topic Name</Translate>
            </span>
          </dt>
          <dd>{categoryEntity.topic?.name}</dd>
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
