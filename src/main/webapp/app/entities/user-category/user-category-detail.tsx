import React, {useEffect} from 'react';
import {Link, useParams} from 'react-router-dom';
import {Button, Col, Row} from 'reactstrap';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import { Translate, TextFormat } from 'react-jhipster';


import {getEntity} from './user-category.reducer';
import {APP_DATE_FORMAT} from "app/config/constants";

export const UserCategoryDetail = () => {
  const dispatch = useAppDispatch();

  const {id} = useParams<'id'>();

  useEffect(() => {
    dispatch(getEntity(id));
  }, []);

  const userCategoryEntity = useAppSelector(state => state.userCategory.entity);
  return (
    <Row>
      <Col md="8">
        <h2 data-cy="libraryDetailsHeading">
          <Translate contentKey="cancerLibraryApp.userCategory.detail.title">User Category</Translate>
        </h2>
        <dl className="jh-entity-details">
          <dt>
            <span id="id">
              <Translate contentKey="global.field.id">ID</Translate>
            </span>
          </dt>
          <dd>{userCategoryEntity.id}</dd>
          <dt>
            <span id="user">
              <Translate contentKey="cancerLibraryApp.userCategory.user">User</Translate>
            </span>
          </dt>
          <dd>{userCategoryEntity.user?.login}</dd>
          <dt>
            <span id="category">
              <Translate contentKey="cancerLibraryApp.userCategory.category">Category</Translate>
            </span>
          </dt>
          <dd>{userCategoryEntity.category?.title}</dd>
          <dt>
            <span id="activated">
              <Translate contentKey="cancerLibraryApp.userCategory.activated">Activated</Translate>
            </span>
          </dt>
          <dd>{userCategoryEntity.activated ? 'true' : 'false'}</dd>
          <dt>
            <span id="termStart">
              <Translate contentKey="cancerLibraryApp.userCategory.termStart">Term Start</Translate>
            </span>
          </dt>
          <dd>
            {userCategoryEntity.termStart?
            <TextFormat value={userCategoryEntity.termStart} type="date" format={APP_DATE_FORMAT} blankOnInvalid />
            :null}
          </dd>
          <dt>
            <span id="termEnd">
              <Translate contentKey="cancerLibraryApp.userCategory.termEnd">Term End</Translate>
            </span>
          </dt>
          <dd>
            {userCategoryEntity.termEnd?
              <TextFormat value={userCategoryEntity.termEnd} type="date" format={APP_DATE_FORMAT} blankOnInvalid />
              :null}
          </dd>
        </dl>
        <Button tag={Link} to="/user-category" replace color="info" data-cy="entityDetailsBackButton">
          <FontAwesomeIcon icon="arrow-left"/>{' '}
          <span className="d-none d-md-inline">
            <Translate contentKey="entity.action.back">Back</Translate>
          </span>
        </Button>
        &nbsp;
        <Button tag={Link} to={`/user-category/${userCategoryEntity.id}/edit`} replace color="primary">
          <FontAwesomeIcon icon="pencil-alt"/>{' '}
          <span className="d-none d-md-inline">
            <Translate contentKey="entity.action.edit">Edit</Translate>
          </span>
        </Button>
      </Col>
    </Row>
  );
};

export default UserCategoryDetail;
