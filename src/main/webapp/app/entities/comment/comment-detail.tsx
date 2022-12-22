import React, {useEffect} from 'react';
import {Link, useParams} from 'react-router-dom';
import {Button, Col, Row} from 'reactstrap';
import {Translate, TextFormat} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';

import {getEntity} from './comment.reducer';
import {APP_DATE_FORMAT} from 'app/config/constants';

export const CommentDetail = () => {
  const dispatch = useAppDispatch();

  const {id} = useParams<'id'>();

  useEffect(() => {
    dispatch(getEntity(id));
  }, []);

  const commentEntity = useAppSelector(state => state.comment.entity);
  return (
    <div className="wrap-page">
      <Row>
        <Col md="8">
          <h2 data-cy="libraryDetailsHeading" className="title-page">
            <Translate contentKey="cancerLibraryApp.comment.detail.title">Comment</Translate>
          </h2>
          <dl className="jh-entity-details">
            <dt>
              <span id="id">
                <Translate contentKey="global.field.id">ID</Translate>
              </span>
            </dt>
            <dd>{commentEntity.id}</dd>
            <dt>
              <span id="ptNo">
                <Translate contentKey="cancerLibraryApp.comment.ptNo">ptNo</Translate>
              </span>
            </dt>
            <dd>{commentEntity.ptNo}</dd>
            <dt>
              <span id="rowId">
                <Translate contentKey="cancerLibraryApp.comment.rowId">rowId</Translate>
              </span>
            </dt>
            <dd>{commentEntity.rowId}</dd>
            <dt>
              <span id="comment">
                <Translate contentKey="cancerLibraryApp.comment.comment">comment</Translate>
              </span>
            </dt>
            <dd>{commentEntity.comment}</dd>
            <dt>
              <span id="category-title">
                <Translate contentKey="cancerLibraryApp.comment.category.id">category title</Translate>
              </span>
            </dt>
            <dd>{commentEntity.category?.title}</dd>
            <dt>
              <Translate contentKey="cancerLibraryApp.comment.createdBy">Created By</Translate>
            </dt>
            <dd>{commentEntity.createdBy}</dd>
            <dt>
              <Translate contentKey="cancerLibraryApp.comment.createdDate">Created Date</Translate>
            </dt>
            <dd>
              {commentEntity.createdDate ? (
                <TextFormat value={commentEntity.createdDate} type="date" format={APP_DATE_FORMAT} blankOnInvalid />
              ) : null}
            </dd>
            <dt>
              <Translate contentKey="cancerLibraryApp.comment.lastModifiedBy">Last Modified By</Translate>
            </dt>
            <dd>{commentEntity.lastModifiedBy}</dd>
            <dt>
              <Translate contentKey="cancerLibraryApp.comment.lastModifiedDate">Last Modified Date</Translate>
            </dt>
            <dd>
              {commentEntity.lastModifiedDate ? (
                <TextFormat value={commentEntity.lastModifiedDate} type="date" format={APP_DATE_FORMAT} blankOnInvalid />
              ) : null}
            </dd>
          </dl>
          <Button tag={Link} to="/admin/comment" replace color="info" data-cy="entityDetailsBackButton">
            <FontAwesomeIcon icon="arrow-left" />{' '}
            <span className="d-none d-md-inline">
              <Translate contentKey="entity.action.back">Back</Translate>
            </span>
          </Button>
          &nbsp;
          <Button tag={Link} to={`/admin/comment/${commentEntity.id}/edit`} replace color="primary">
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

export default CommentDetail;
