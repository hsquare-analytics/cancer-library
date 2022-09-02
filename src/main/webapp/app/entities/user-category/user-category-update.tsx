import React, {useEffect} from 'react';
import {Link, useNavigate, useParams} from 'react-router-dom';
import {Button, Col, Row} from 'reactstrap';
import {Translate, translate, ValidatedField, ValidatedForm} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {createEntity, getEntity, reset, updateEntity} from './user-category.reducer';
import {getUsers} from "app/modules/administration/user-management/user-management.reducer";
import {getEntities as getCategories} from "app/entities/category/category.reducer";

export const UserCategoryUpdate = () => {
  const dispatch = useAppDispatch();

  const navigate = useNavigate();

  const {id} = useParams<'id'>();
  const isNew = id === undefined;

  const userCategoryEntity = useAppSelector(state => state.userCategory.entity);
  const loading = useAppSelector(state => state.userCategory.loading);
  const updating = useAppSelector(state => state.userCategory.updating);
  const updateSuccess = useAppSelector(state => state.userCategory.updateSuccess);
  const users = useAppSelector(state => state.userManagement.users);
  const categories = useAppSelector(state => state.category.entities);

  const handleClose = () => {
    navigate('/admin/user-category');
  };

  useEffect(() => {
    if (isNew) {
      dispatch(reset());
    } else {
      dispatch(getEntity(id));
    }

    if (users.length === 0) {
      dispatch(getUsers({}));
    }

    if (categories.length === 0) {
      dispatch(getCategories({}));
    }
  }, []);

  useEffect(() => {
    if (updateSuccess) {
      handleClose();
    }
  }, [updateSuccess]);

  const saveEntity = values => {
    const entity = {
      ...userCategoryEntity,
      ...values,
      "termStart" : new Date(values.termStart),
      "termEnd" : new Date(values.termEnd)
    };

    if (isNew) {
      dispatch(createEntity(entity));
    } else {
      dispatch(updateEntity(entity));
    }
  };

  const defaultValues = () =>
    isNew
      ? {}
      : {
        ...userCategoryEntity,
      };

  return (
    <div>
      <Row className="justify-content-center">
        <Col md="8">
          <h2 id="cancerLibraryApp.category.home.createOrEditLabel" data-cy="UserCategoryCreateUpdateHeading">
            <Translate contentKey="cancerLibraryApp.category.home.createOrEditLabel">Create or edit a User
              Category</Translate>
          </h2>
        </Col>
      </Row>
      <Row className="justify-content-center">
        <Col md="8">
          {loading ? (
            <p>Loading...</p>
          ) : (
            <ValidatedForm defaultValues={defaultValues()} onSubmit={saveEntity}>
              {!isNew ? (
                <ValidatedField
                  name="id"
                  required
                  readOnly
                  id="user-category-id"
                  label={translate('global.field.id')}
                  validate={{required: true}}
                />
              ) : null}
              <ValidatedField type="select" name="user.id" data-cy="user"
                              label={translate('cancerLibraryApp.userCategory.user')}
                              validate={{required: true}}
              >
                <option value="">-</option>
                {users.map(user => (
                  <option value={user.id} key={user}>
                    {user.login}
                  </option>
                ))}
              </ValidatedField>
              <ValidatedField type="select" name="category.id" data-cy="category"
                              label={translate('cancerLibraryApp.userCategory.category')}
                              validate={{required: true}}
              >
                <option value="">-</option>
                {categories.map(category => (
                  <option value={category.id} key={category}>
                    {category.title}
                  </option>
                ))}
              </ValidatedField>
              <ValidatedField
                label={translate('cancerLibraryApp.userCategory.activated')}
                id="category-activated"
                name="activated"
                data-cy="activated"
                check
                type="checkbox"
              />
              <ValidatedField
                label={translate('cancerLibraryApp.userCategory.termStart')}
                id="user-category-activated"
                name="termStart"
                data-cy="termStart"
                type="datetime-local"
                validate={{required: true}}
              />
              <ValidatedField
                label={translate('cancerLibraryApp.userCategory.termEnd')}
                id="user-category-activated"
                name="termEnd"
                data-cy="termEnd"
                type="datetime-local"
                validate={{required: true}}
              />
              <Button tag={Link} id="cancel-save" data-cy="entityCreateCancelButton" to="/admin/user-category" replace
                      color="info">
                <FontAwesomeIcon icon="arrow-left"/>
                &nbsp;
                <span className="d-none d-md-inline">
                  <Translate contentKey="entity.action.back">Back</Translate>
                </span>
              </Button>
              &nbsp;
              <Button color="primary" id="save-entity" data-cy="entityCreateSaveButton" type="submit"
                      disabled={updating}>
                <FontAwesomeIcon icon="save"/>
                &nbsp;
                <Translate contentKey="entity.action.save">Save</Translate>
              </Button>
            </ValidatedForm>
          )}
        </Col>
      </Row>
    </div>
  );
};

export default UserCategoryUpdate;
