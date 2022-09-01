import React, {useEffect} from 'react';
import {Link, useNavigate, useParams} from 'react-router-dom';
import {Button, Col, Row} from 'reactstrap';
import {Translate, translate, ValidatedField, ValidatedForm} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {createEntity, getEntity, reset, updateEntity} from './user-category.reducer';
import {getEntities as getLibraries} from "app/entities/library/library.reducer";
import {languages, locales} from "app/config/translation";

export const UserCategoryUpdate = () => {
  const dispatch = useAppDispatch();

  const navigate = useNavigate();

  const {id} = useParams<'id'>();
  const isNew = id === undefined;

  const categoryEntity = useAppSelector(state => state.category.entity);
  const loading = useAppSelector(state => state.category.loading);
  const updating = useAppSelector(state => state.category.updating);
  const updateSuccess = useAppSelector(state => state.category.updateSuccess);
  const libraries = useAppSelector(state => state.library.entities);

  const handleClose = () => {
    navigate('/user-category');
  };

  useEffect(() => {
    if (isNew) {
      dispatch(reset());
    } else {
      dispatch(getEntity(id));
    }

    if (libraries.length === 0) {
      dispatch(getLibraries({}));
    }
  }, []);

  useEffect(() => {
    if (updateSuccess) {
      handleClose();
    }
  }, [updateSuccess]);

  const saveEntity = values => {
    const entity = {
      ...categoryEntity,
      ...values,
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
        ...categoryEntity,
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
                  id="category-id"
                  label={translate('global.field.id')}
                  validate={{required: true}}
                />
              ) : null}
              <ValidatedField
                label={translate('cancerLibraryApp.category.title')}
                id="category-title"
                name="title"
                data-cy="title"
                type="text"
                validate={{
                  required: {value: true, message: translate('entity.validation.required')},
                  maxLength: {value: 30, message: translate('entity.validation.maxlength', {max: 30})},
                }}
              />
              <ValidatedField
                label={translate('cancerLibraryApp.category.description')}
                id="category-description"
                name="description"
                data-cy="description"
                type="text"
              />
              <ValidatedField
                label={translate('cancerLibraryApp.category.activated')}
                id="category-activated"
                name="activated"
                data-cy="activated"
                check
                type="checkbox"
              />
              <ValidatedField type="select" name="library.id" data-cy="library"
                              label={translate('cancerLibraryApp.category.library')}>
                <option value="">-</option>
                {libraries.map(library => (
                  <option value={library.id} key={library}>
                    {library.title}
                  </option>
                ))}
              </ValidatedField>
              <Button tag={Link} id="cancel-save" data-cy="entityCreateCancelButton" to="/user-category" replace
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
