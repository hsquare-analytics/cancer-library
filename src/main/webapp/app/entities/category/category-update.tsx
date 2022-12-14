import React, {useEffect} from 'react';
import {Link, useNavigate, useParams} from 'react-router-dom';
import {Button, Col, Row} from 'reactstrap';
import {Translate, translate, ValidatedField, ValidatedForm} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {createEntity, getEntity, reset, updateEntity} from './category.reducer';
import {getEntities as getTopics} from 'app/entities/topic/topic.reducer';

export const CategoryUpdate = () => {
  const dispatch = useAppDispatch();

  const navigate = useNavigate();

  const {id} = useParams<'id'>();
  const isNew = id === undefined;

  const categoryEntity = useAppSelector(state => state.category.entity);
  const loading = useAppSelector(state => state.category.loading);
  const updating = useAppSelector(state => state.category.updating);
  const updateSuccess = useAppSelector(state => state.category.updateSuccess);
  const topics = useAppSelector(state => state.topic.entities);

  const handleClose = () => {
    navigate('/admin/category');
  };

  useEffect(() => {
    if (isNew) {
      dispatch(reset());
    } else {
      dispatch(getEntity(id));
    }

    if (topics.length === 0) {
      dispatch(getTopics({}));
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
    <div className="wrap-page">
      <Row>
        <Col md="8">
          <h2 id="cancerLibraryApp.category.home.createOrEditLabel" data-cy="CategoryCreateUpdateHeading" className="title-page">
            <Translate contentKey="cancerLibraryApp.category.home.createOrEditLabel">Create or edit a Category</Translate>
          </h2>
        </Col>
      </Row>
      <Row>
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
                validate={{
                  required: {value: true, message: translate('entity.validation.required')},
                  maxLength: {value: 30, message: translate('entity.validation.maxlength', {max: 30})},
                }}
              />
              <ValidatedField
                label={translate('cancerLibraryApp.category.activated')}
                id="category-activated"
                name="activated"
                data-cy="activated"
                check
                type="checkbox"
              />
              <ValidatedField
                label={translate('cancerLibraryApp.category.orderNo')}
                id="category-orderNo"
                name="orderNo"
                data-cy="orderNo"
                type="number"
                validate={{
                  required: {value: true, message: translate('entity.validation.required')},
                }}
              />
              <ValidatedField
                label={translate('cancerLibraryApp.category.attribute.dateColumn')}
                id="category-attribute"
                name="attribute.dateColumn"
                data-cy="attribute.dateColumn"
                type="text"
              />
              <ValidatedField
                label={translate('cancerLibraryApp.category.attribute.caption')}
                id="category-attribute"
                name="attribute.caption"
                data-cy="attribute.caption"
                type="text"
              />
              <ValidatedField
                label={translate('cancerLibraryApp.category.attribute.autoincrementField')}
                id="category-autoincrementField"
                name="attribute.autoincrementField"
                data-cy="attribute.autoincrementField"
                type="text"
              />
              <ValidatedField type="select" name="topic.id" data-cy="topic" label={translate('cancerLibraryApp.category.topic.title')}>
                <option value="">-</option>
                {topics.map(topic => (
                  <option value={topic.id} key={topic}>
                    {topic.title}
                  </option>
                ))}
              </ValidatedField>
              <Button tag={Link} id="cancel-save" data-cy="entityCreateCancelButton" to="/admin/category" replace color="info">
                <FontAwesomeIcon icon="arrow-left" />
                &nbsp;
                <span className="d-none d-md-inline">
                  <Translate contentKey="entity.action.back">Back</Translate>
                </span>
              </Button>
              &nbsp;
              <Button color="primary" id="save-entity" data-cy="entityCreateSaveButton" type="submit" disabled={updating}>
                <FontAwesomeIcon icon="save" />
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

export default CategoryUpdate;
