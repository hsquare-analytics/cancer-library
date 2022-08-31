import React, { useEffect } from 'react';
import { Link, useParams } from 'react-router-dom';
import { Button, Row, Col } from 'reactstrap';
import { Translate } from 'react-jhipster';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

import { APP_DATE_FORMAT, APP_LOCAL_DATE_FORMAT } from 'app/config/constants';
import { useAppDispatch, useAppSelector } from 'app/config/store';

import { getEntity } from './category.reducer';

export const CategoryDetail = () => {
  const dispatch = useAppDispatch();

  const { id } = useParams<'id'>();

  useEffect(() => {
    dispatch(getEntity(id));
  }, []);

  const libraryEntity = useAppSelector(state => state.library.entity);
  return (
    <Row>
      <Col md="8">
        <h2 data-cy="libraryDetailsHeading">
          <Translate contentKey="cancerLibraryApp.library.detail.title">Library</Translate>
        </h2>
        <dl className="jh-entity-details">
          <dt>
            <span id="id">
              <Translate contentKey="global.field.id">ID</Translate>
            </span>
          </dt>
          <dd>{libraryEntity.id}</dd>
          <dt>
            <span id="title">
              <Translate contentKey="cancerLibraryApp.library.title">Title</Translate>
            </span>
          </dt>
          <dd>{libraryEntity.title}</dd>
          <dt>
            <span id="description">
              <Translate contentKey="cancerLibraryApp.library.description">Description</Translate>
            </span>
          </dt>
          <dd>{libraryEntity.description}</dd>
          <dt>
            <span id="activated">
              <Translate contentKey="cancerLibraryApp.library.activated">Activated</Translate>
            </span>
          </dt>
          <dd>{libraryEntity.activated ? 'true' : 'false'}</dd>
        </dl>
        <Button tag={Link} to="/library" replace color="info" data-cy="entityDetailsBackButton">
          <FontAwesomeIcon icon="arrow-left" />{' '}
          <span className="d-none d-md-inline">
            <Translate contentKey="entity.action.back">Back</Translate>
          </span>
        </Button>
        &nbsp;
        <Button tag={Link} to={`/library/${libraryEntity.id}/edit`} replace color="primary">
          <FontAwesomeIcon icon="pencil-alt" />{' '}
          <span className="d-none d-md-inline">
            <Translate contentKey="entity.action.edit">Edit</Translate>
          </span>
        </Button>
      </Col>
    </Row>
  );
};

export default CategoryDetail;
