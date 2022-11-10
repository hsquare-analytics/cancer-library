import React, {useEffect, useState} from 'react';
import {Link, useNavigate, useParams} from 'react-router-dom';
import {Button, Col, Row} from 'reactstrap';
import {Translate, translate, ValidatedField, ValidatedForm} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {createEntity, getEntity, reset, updateEntity} from './codebook.reducer';
import MuiButton from '@mui/material/Button';
import LookupEditor from "app/modules/datasource-editor/multi-table-editor/lookup-editor/lookup-editor";


export const CodebookUpdate = () => {
  const dispatch = useAppDispatch();

  const navigate = useNavigate();

  const {id} = useParams<'id'>();
  const isNew = id === undefined;

  const codebookEntity = useAppSelector(state => state.codebook.entity);
  const loading = useAppSelector(state => state.codebook.loading);
  const updating = useAppSelector(state => state.codebook.updating);
  const updateSuccess = useAppSelector(state => state.codebook.updateSuccess);

  const [showLookup, setShowLookup] = useState(false);

  const handleClose = () => {
    navigate('/admin/codebook' + location.search);
  };

  useEffect(() => {
    if (isNew) {
      dispatch(reset());
    } else {
      dispatch(getEntity(id));
    }
  }, []);

  useEffect(() => {
    if (updateSuccess) {
      handleClose();
    }
  }, [updateSuccess]);

  const saveEntity = values => {
    const entity = {
      ...codebookEntity,
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
        ...codebookEntity,
      };

  return (
    <div>
      <Row className="justify-content-center">
        <Col md="8">
          <h2 id="cancerLibraryApp.codebook.home.createOrEditLabel" data-cy="CodebookCreateUpdateHeading">
            <Translate contentKey="cancerLibraryApp.codebook.home.createOrEditLabel">Create or edit a
              Codebook</Translate>
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
                  id="codebook-id"
                  label={translate('global.field.id')}
                  validate={{required: true}}
                />
              ) : null}
              <ValidatedField
                label={translate('cancerLibraryApp.codebook.title')}
                id="codebook-title"
                name="title"
                data-cy="title"
                type="text"
                validate={{
                  required: {value: true, message: translate('entity.validation.required')},
                  minLength: {value: 1, message: translate('entity.validation.minlength', {min: 1})},
                  maxLength: {value: 50, message: translate('entity.validation.maxlength', {max: 50})},
                }}
              />
              <ValidatedField
                label={translate('cancerLibraryApp.codebook.description')}
                id="codebook-description"
                name="description"
                data-cy="description"
                type="text"
              />
              <div>
                {translate('cancerLibraryApp.codebook.lookupList')}
                <MuiButton variant="text" onClick={() => setShowLookup(true)}>
                  <FontAwesomeIcon icon="pencil-alt"/>{' '}
                </MuiButton>
                {codebookEntity.lookupList && codebookEntity.lookupList.length > 0 ?
                  <LookupEditor visible={showLookup} setVisible={setShowLookup}
                                dataSource={codebookEntity.lookupList.filter(data => data).map(data => {
                                  return {
                                    codebookId: codebookEntity.id,
                                    title: data.title,
                                    description: data.description,
                                  }
                                })}/> : null}
                <ValidatedField
                  id="codebook-lookupList"
                  name="lookupList"
                  data-cy="lookupList"
                  type="select"
                  multiple
                >
                  {codebookEntity.lookupList?.filter(data => data).map(lookup => (
                    <option value={lookup} key={lookup}>
                      {lookup.title}
                    </option>
                  ))}
                </ValidatedField>
              </div>
              <Button tag={Link} id="cancel-save" data-cy="entityCreateCancelButton" to="/admin/codebook" replace
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

export default CodebookUpdate;
