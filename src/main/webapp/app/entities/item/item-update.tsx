import React, {useEffect} from 'react';
import {Link, useNavigate, useParams} from 'react-router-dom';
import {Button, Col, Row} from 'reactstrap';
import {Translate, translate, ValidatedField, ValidatedForm} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {createEntity, getEntity, reset, updateEntity} from './item.reducer';
import {getEntities as getCategories} from 'app/entities/category/category.reducer';
import {getEntities as getCodebooks} from 'app/entities/codebook/codebook.reducer';
import _ from 'lodash';

export const ItemUpdate = () => {
  const dispatch = useAppDispatch();

  const navigate = useNavigate();

  const {id} = useParams<'id'>();
  const isNew = id === undefined;

  const itemEntity = useAppSelector(state => state.item.entity);
  const loading = useAppSelector(state => state.item.loading);
  const updating = useAppSelector(state => state.item.updating);
  const updateSuccess = useAppSelector(state => state.item.updateSuccess);
  const categories = useAppSelector(state => state.category.entities);
  const codebooks = useAppSelector(state => state.codebook.entities);

  const handleClose = () => {
    navigate('/admin/item');
  };

  useEffect(() => {
    if (isNew) {
      dispatch(reset());
    } else {
      dispatch(getEntity(id));
    }

    if (categories.length === 0) {
      dispatch(getCategories({}));
    }

    if (codebooks.length === 0) {
      dispatch(getCodebooks({}));
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

  const dataTypeList = ['number', 'boolean', 'string', 'date', 'datetime', 'selectbox'];

  return (
    <div className="wrap-page">
      <Row>
        <Col md="8">
          <h2 id="cancerLibraryApp.item.home.createOrEditLabel" data-cy="CategoryCreateUpdateHeading" className="title-page">
            <Translate contentKey="cancerLibraryApp.item.home.createOrEditLabel">Create or edit a Category</Translate>
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
                <ValidatedField name="id" required readOnly id="item-id" label={translate('global.field.id')} validate={{required: true}} />
              ) : null}
              <ValidatedField
                label={translate('cancerLibraryApp.item.title')}
                id="item-title"
                name="title"
                data-cy="title"
                type="text"
                validate={{
                  required: {value: true, message: translate('entity.validation.required')},
                  maxLength: {value: 30, message: translate('entity.validation.maxlength', {max: 30})},
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
              <ValidatedField type="select" name="codebook.id" data-cy="codebook" label={translate('cancerLibraryApp.item.codebook.title')}>
                <option value="">-</option>
                {_.orderBy(codebooks, 'title').map(codebook => (
                  <option value={codebook.id} key={codebook}>
                    {codebook.title}
                  </option>
                ))}
              </ValidatedField>
              <ValidatedField
                label={translate('cancerLibraryApp.item.attribute.caption')}
                id="item-caption"
                name="attribute.caption"
                data-cy="attribute.caption"
                type="text"
              />
              <ValidatedField
                label={translate('cancerLibraryApp.item.attribute.required')}
                id="item-required"
                name="attribute.required"
                data-cy="attribute.required"
                check
                type="checkbox"
              />
              <ValidatedField
                label={translate('cancerLibraryApp.item.attribute.format')}
                id="item-format"
                name="attribute.format"
                data-cy="attribute.format"
                type="text"
              />
              <ValidatedField
                label={translate('cancerLibraryApp.item.attribute.dataType')}
                id="item-dataType"
                name="attribute.dataType"
                data-cy="attribute.dataType"
                type="select"
              >
                <option value="">-</option>
                {_.orderBy(dataTypeList).map(data => (
                  <option value={data} key={data}>
                    {' '}
                    {data}{' '}
                  </option>
                ))}
              </ValidatedField>
              <ValidatedField
                label={translate('cancerLibraryApp.item.property.allowEditing')}
                id="item-allowEditing"
                name="property.allowEditing"
                data-cy="property.allowEditing"
                check
                type="checkbox"
              />
              <ValidatedField
                label={translate('cancerLibraryApp.item.property.sortIndex')}
                id="item-sortIndex"
                name="property.sortIndex"
                data-cy="property.sortIndex"
                type="number"
              />
              <ValidatedField
                label={translate('cancerLibraryApp.item.property.sortDirection')}
                id="item-sortDirection"
                name="property.sortDirection"
                data-cy="property.sortDirection"
                type="text"
              />
              <ValidatedField
                label={translate('cancerLibraryApp.item.property.visible')}
                id="item-visible"
                name="property.visible"
                data-cy="property.visible"
                check
                type="checkbox"
              />
              <ValidatedField
                label={translate('cancerLibraryApp.item.property.labelColumn')}
                id="item-labelColumn"
                name="property.labelColumn"
                data-cy="property.labelColumn"
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
