import React, {useEffect} from 'react';
import {Link, useParams} from 'react-router-dom';
import {Button, Col, Row} from 'reactstrap';
import {Translate} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';

import {getEntity} from './codebook.reducer';

export const CodebookDetail = () => {
  const dispatch = useAppDispatch();

  const {id} = useParams<'id'>();

  useEffect(() => {
    dispatch(getEntity(id));
  }, []);

  const codebookEntity = useAppSelector(state => state.codebook.entity);
  return (
    <div className="wrap-page">
      <Row>
        <Col md="8">
          <h2 data-cy="codebookDetailsHeading" className="title-page">
            <Translate contentKey="cancerLibraryApp.codebook.detail.title">Codebook</Translate>
          </h2>
          <dl className="jh-entity-details">
            <dt>
              <span id="id">
                <Translate contentKey="global.field.id">ID</Translate>
              </span>
            </dt>
            <dd>{codebookEntity.id}</dd>
            <dt>
              <span id="title">
                <Translate contentKey="cancerLibraryApp.codebook.title">Title</Translate>
              </span>
            </dt>
            <dd>{codebookEntity.title}</dd>
            <dt>
              <span id="description">
                <Translate contentKey="cancerLibraryApp.codebook.description">Description</Translate>
              </span>
            </dt>
            <dd>{codebookEntity.description}</dd>
            <dt>
              <span id="lookupList">
                <Translate contentKey="cancerLibraryApp.codebook.lookupList">Lookup</Translate>
              </span>
            </dt>
            <dd>{JSON.stringify(codebookEntity.lookupList?.filter(data => data))}</dd>
          </dl>
          <Button tag={Link} to="/admin/codebook" replace color="info" data-cy="entityDetailsBackButton">
            <FontAwesomeIcon icon="arrow-left" />{' '}
            <span className="d-none d-md-inline">
              <Translate contentKey="entity.action.back">Back</Translate>
            </span>
          </Button>
          &nbsp;
          <Button tag={Link} to={`/admin/codebook/${codebookEntity.id}/edit`} replace color="primary">
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

export default CodebookDetail;
