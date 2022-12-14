import React, {useEffect} from 'react';
import {Link, useParams} from 'react-router-dom';
import {Button, Col, Row} from 'reactstrap';
import {Translate} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';

import {getEntity} from './item.reducer';

export const ItemDetail = () => {
  const dispatch = useAppDispatch();

  const {id} = useParams<'id'>();

  useEffect(() => {
    dispatch(getEntity(id));
  }, []);

  const itemEntity = useAppSelector(state => state.item.entity);
  return (
    <div className="wrap-page">
      <Row>
        <Col md="8">
          <h2 data-cy="itemDetailsHeading" className="title-page">
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
              <span id="orderNo">
                <Translate contentKey="cancerLibraryApp.item.orderNo">Order No</Translate>
              </span>
            </dt>
            <dd>{itemEntity.orderNo}</dd>
            <dt>
              <span id="category">
                <Translate contentKey="cancerLibraryApp.item.category.title">Category Title</Translate>
              </span>
            </dt>
            <dd>{itemEntity.category?.title}</dd>
            <dt>
              <span id="codebook">
                <Translate contentKey="cancerLibraryApp.item.codebook.title">Codebook Title</Translate>
              </span>
            </dt>
            <dd>{itemEntity.codebook?.title}</dd>
            <dt>
              <span id="caption">
                <Translate contentKey="cancerLibraryApp.item.attribute.caption">Caption</Translate>
              </span>
            </dt>
            <dd>{itemEntity.attribute?.caption}</dd>
            <dt>
              <span id="required">
                <Translate contentKey="cancerLibraryApp.item.attribute.required">Required</Translate>
              </span>
            </dt>
            <dd>{itemEntity.attribute?.required}</dd>
            <dt>
              <span id="format">
                <Translate contentKey="cancerLibraryApp.item.attribute.format">format</Translate>
              </span>
            </dt>
            <dd>{itemEntity.attribute?.format}</dd>
            <dt>
              <span id="type">
                <Translate contentKey="cancerLibraryApp.item.attribute.dataType">Data Type</Translate>
              </span>
            </dt>
            <dd>{itemEntity.attribute?.dataType}</dd>
            <dt>
              <span id="maxLength">
                <Translate contentKey="cancerLibraryApp.item.attribute.maxLength">Max Length</Translate>
              </span>
            </dt>
            <dd>{itemEntity.attribute?.maxLength}</dd>
            <dt>
              <span id="allowEditing">
                <Translate contentKey="cancerLibraryApp.item.attribute.allowEditing">Allow Editing</Translate>
              </span>
            </dt>
            <dd>{itemEntity.attribute?.allowEditing}</dd>
            <dt>
              <span id="sortIndex">
                <Translate contentKey="cancerLibraryApp.item.property.sortIndex">Sort Index</Translate>
              </span>
            </dt>
            <dd>{itemEntity.property?.sortIndex}</dd>
            <dt>
              <span id="visible">
                <Translate contentKey="cancerLibraryApp.item.property.visible">Visible</Translate>
              </span>
            </dt>
            <dd>{itemEntity.property?.visible}</dd>
            <dt>
              <span id="labelColumn">
                <Translate contentKey="cancerLibraryApp.item.property.labelColumn">Label Column</Translate>
              </span>
            </dt>
            <dd>{itemEntity.property?.labelColumn}</dd>
            <dt>
              <span id="cssClass">
                <Translate contentKey="cancerLibraryApp.item.property.cssClass">Css Class</Translate>
              </span>
            </dt>
            <dd>{itemEntity.property?.cssClass}</dd>
            <dt>
              <span id="sortDirection">
                <Translate contentKey="cancerLibraryApp.item.property.sortDirection">Sort Direction</Translate>
              </span>
            </dt>
            <dd>{itemEntity.property?.sortDirection}</dd>
          </dl>
          <Button tag={Link} to="/admin/item" replace color="info" data-cy="entityDetailsBackButton">
            <FontAwesomeIcon icon="arrow-left"/>{' '}
            <span className="d-none d-md-inline">
              <Translate contentKey="entity.action.back">Back</Translate>
            </span>
          </Button>
          &nbsp;
          <Button tag={Link} to={`/admin/item/${itemEntity.id}/edit`} replace color="primary">
            <FontAwesomeIcon icon="pencil-alt"/>{' '}
            <span className="d-none d-md-inline">
              <Translate contentKey="entity.action.edit">Edit</Translate>
            </span>
          </Button>
        </Col>
      </Row>
    </div>
  );
};

export default ItemDetail;
