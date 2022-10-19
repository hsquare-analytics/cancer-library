import React, {useEffect} from 'react';
import {Link, useParams} from 'react-router-dom';
import {Button, Col, Row} from 'reactstrap';
import {Translate} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';

import {getEntity} from './item.reducer';

export const ItemDetail = () => {
  const dispatch = useAppDispatch();

  const { id } = useParams<'id'>();

  useEffect(() => {
    dispatch(getEntity(id));
  }, []);

  const itemEntity = useAppSelector(state => state.item.entity);
  return (
    <Row>
      <Col md="8">
        <h2 data-cy="itemDetailsHeading">
          <Translate contentKey="cancerLibraryApp.item.detail.title">Library</Translate>
        </h2>
        <dl className="jh-entity-details">
          <dt>
            <span id="id">
              <Translate contentKey="global.field.id">ID</Translate>
            </span>
          </dt>
          <dd>{itemEntity.id}</dd>
          <dt>
            <span id="title">
              <Translate contentKey="cancerLibraryApp.item.title">Title</Translate>
            </span>
          </dt>
          <dd>{itemEntity.title}</dd>
          <dt>
            <span id="description">
              <Translate contentKey="cancerLibraryApp.item.description">Description</Translate>
            </span>
          </dt>
          <dd>{itemEntity.description}</dd>
          <dt>
            <span id="activated">
              <Translate contentKey="cancerLibraryApp.item.activated">Activated</Translate>
            </span>
          </dt>
          <dd>{itemEntity.activated ? 'true' : 'false'}</dd>
          <dt>
            <span id="category">
              <Translate contentKey="cancerLibraryApp.item.category.title">Category Title</Translate>
            </span>
          </dt>
          <dd>{itemEntity.category?.title}</dd>
          <dt>
            <span id="type">
              <Translate contentKey="cancerLibraryApp.item.attribute.dataType">Data Type</Translate>
            </span>
          </dt>
          <dd>{itemEntity.attribute?.dataType}</dd>
          <dt>
            <span id="visibleIndex">
              <Translate contentKey="cancerLibraryApp.item.property.visibleIndex">Visible Index</Translate>
            </span>
          </dt>
          <dd>{itemEntity.property?.visibleIndex}</dd>
          <dt>
            <span id="caption">
              <Translate contentKey="cancerLibraryApp.item.property.caption">Caption</Translate>
            </span>
          </dt>
          <dd>{itemEntity.property?.caption}</dd>
          <dt>
            <span id="allowEditing">
              <Translate contentKey="cancerLibraryApp.item.property.allowEditing">Allow Editing</Translate>
            </span>
          </dt>
          <dd>{itemEntity.property?.allowEditing}</dd>
          <dt>
            <span id="lookup">
              <Translate contentKey="cancerLibraryApp.item.lookup">Lookup</Translate>
            </span>
          </dt>
          <dd>{itemEntity.lookup}</dd>
        </dl>
        <Button tag={Link} to="/admin/item" replace color="info" data-cy="entityDetailsBackButton">
          <FontAwesomeIcon icon="arrow-left" />{' '}
          <span className="d-none d-md-inline">
            <Translate contentKey="entity.action.back">Back</Translate>
          </span>
        </Button>
        &nbsp;
        <Button tag={Link} to={`/admin/item/${itemEntity.id}/edit`} replace color="primary">
          <FontAwesomeIcon icon="pencil-alt" />{' '}
          <span className="d-none d-md-inline">
            <Translate contentKey="entity.action.edit">Edit</Translate>
          </span>
        </Button>
      </Col>
    </Row>
  );
};

export default ItemDetail;
