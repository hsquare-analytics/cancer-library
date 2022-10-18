import React, {useEffect} from 'react';
import {Link, useNavigate, useParams} from 'react-router-dom';
import {Button, Col, Row} from 'reactstrap';
import {Translate, translate, ValidatedField, ValidatedForm} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {createEntity, getEntity, reset, updateEntity} from './item.reducer';
import {getEntities as getCategories} from "app/entities/category/category.reducer";

export const ItemUpdate = () => {
  const dispatch = useAppDispatch();

  const navigate = useNavigate();

  const { id } = useParams<'id'>();
  const isNew = id === undefined;

  const itemEntity = useAppSelector(state => state.item.entity);
  const loading = useAppSelector(state => state.item.loading);
  const updating = useAppSelector(state => state.item.updating);
  const updateSuccess = useAppSelector(state => state.item.updateSuccess);
  const categories = useAppSelector(state => state.category.entities);

  const handleClose = () => {
    navigate('/admin/item');
  };

  useEffect(() => {
    if (isNew) {
      dispatch(reset());
    } else {
      dispatch(getEntity(id));
    }

    if (categories.length === 0)
    {
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
      ...itemEntity,
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
          ...itemEntity,
        };

  return (
    <div>
      <Row className="justify-content-center">
        <Col md="8">
          <h2 id="cancerLibraryApp.item.home.createOrEditLabel" data-cy="CategoryCreateUpdateHeading">
            <Translate contentKey="cancerLibraryApp.item.home.createOrEditLabel">Create or edit a Category</Translate>
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
                  id="item-id"
                  label={translate('global.field.id')}
                  validate={{ required: true }}
                />
              ) : null}
              <ValidatedField
                label={translate('cancerLibraryApp.item.title')}
                id="item-title"
                name="title"
                data-cy="title"
                type="text"
                validate={{
                  required: { value: true, message: translate('entity.validation.required') },
                  maxLength: { value: 30, message: translate('entity.validation.maxlength', { max: 30 }) },
                }}
              />
              <ValidatedField
                label={translate('cancerLibraryApp.item.description')}
                id="item-description"
                name="description"
                data-cy="description"
                type="text"
              />
              <ValidatedField
                label={translate('cancerLibraryApp.item.activated')}
                id="item-activated"
                name="activated"
                data-cy="activated"
                check
                type="checkbox"
              />
              <ValidatedField type="select" name="category.id" data-cy="category" label={translate('cancerLibraryApp.item.category.title')}>
                <option value="">-</option>
                {categories.map(category => (
                  <option value={category.id} key={category}>
                    {category.title}
                  </option>
                ))}
              </ValidatedField>
              <ValidatedField
                label={translate('cancerLibraryApp.item.attribute.dataType')}
                id="item-dataType"
                name="attribute.dataType"
                data-cy="attribute.dataType"
                type="text"
              />
              <ValidatedField
                label={translate('cancerLibraryApp.item.property.visibleIndex')}
                id="item-visibleIndex"
                name="property.visibleIndex"
                data-cy="property.visibleIndex"
                type="number"
              />
              <ValidatedField
                label={translate('cancerLibraryApp.item.property.caption')}
                id="item-caption"
                name="property.caption"
                data-cy="property.caption"
                type="text"
              />
              <Button tag={Link} id="cancel-save" data-cy="entityCreateCancelButton" to="/admin/item" replace color="info">
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

export default ItemUpdate;
