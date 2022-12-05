import React, {useEffect} from 'react';
import {Link, useNavigate, useParams} from 'react-router-dom';
import {Button, Col, Row} from 'reactstrap';
import {Translate, translate, ValidatedField, ValidatedForm} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {createEntity, getEntity, reset, updateEntity} from './topic.reducer';
import {getEntities as getSubjects} from 'app/entities/subject/subject.reducer';

export const TopicUpdate = () => {
  const dispatch = useAppDispatch();

  const navigate = useNavigate();

  const {id} = useParams<'id'>();
  const isNew = id === undefined;

  const topicEntity = useAppSelector(state => state.topic.entity);
  const loading = useAppSelector(state => state.topic.loading);
  const updating = useAppSelector(state => state.topic.updating);
  const updateSuccess = useAppSelector(state => state.topic.updateSuccess);
  const subjects = useAppSelector(state => state.subject.entities);

  const handleClose = () => {
    navigate('/admin/topic');
  };

  useEffect(() => {
    if (isNew) {
      dispatch(reset());
    } else {
      dispatch(getEntity(id));
    }

    if (subjects.length === 0) {
      dispatch(getSubjects({}));
    }
  }, []);

  useEffect(() => {
    if (updateSuccess) {
      handleClose();
    }
  }, [updateSuccess]);

  const saveEntity = values => {
    const entity = {
      ...topicEntity,
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
          ...topicEntity,
        };

  return (
    <div className="wrap-page">
      <Row>
        <Col md="8">
          <h2 id="cancerLibraryApp.topic.home.createOrEditLabel" data-cy="CategoryCreateUpdateHeading" className="title-page">
            <Translate contentKey="cancerLibraryApp.topic.home.createOrEditLabel">Create or edit a Category</Translate>
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
                  id="topic-id"
                  label={translate('global.field.id')}
                  validate={{required: true}}
                />
              ) : null}
              <ValidatedField
                label={translate('cancerLibraryApp.topic.title')}
                id="topic-title"
                name="title"
                data-cy="title"
                type="text"
                validate={{
                  required: {value: true, message: translate('entity.validation.required')},
                  maxLength: {value: 30, message: translate('entity.validation.maxlength', {max: 30})},
                }}
              />
              <ValidatedField
                label={translate('cancerLibraryApp.topic.activated')}
                id="topic-activated"
                name="activated"
                data-cy="activated"
                check
                type="checkbox"
              />
              <ValidatedField
                label={translate('cancerLibraryApp.topic.orderNo')}
                id="topic-orderNo"
                name="orderNo"
                data-cy="orderNo"
                type="number"
                validate={{
                  required: {value: true, message: translate('entity.validation.required')},
                }}
              />
              <ValidatedField type="select" name="subject.id" data-cy="subject" label={translate('cancerLibraryApp.topic.subject.title')}>
                <option value="">-</option>
                {subjects.map(subject => (
                  <option value={subject.id} key={subject}>
                    {subject.title}
                  </option>
                ))}
              </ValidatedField>
              <Button tag={Link} id="cancel-save" data-cy="entityCreateCancelButton" to="/admin/topic" replace color="info">
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

export default TopicUpdate;
