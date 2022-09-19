import React, {useEffect} from 'react';
import {Link, useLocation, useNavigate} from 'react-router-dom';
import {Button, Table} from 'reactstrap';
import {Translate,TextFormat} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {getEntities} from './topic.reducer';
import {APP_DATE_FORMAT} from "app/config/constants";

export const Topic = () => {
  const dispatch = useAppDispatch();

  const location = useLocation();
  const navigate = useNavigate();

  const topicList = useAppSelector(state => state.topic.entities);
  const loading = useAppSelector(state => state.topic.loading);

  useEffect(() => {
    dispatch(getEntities({}));
  }, []);

  const handleSyncList = () => {
    dispatch(getEntities({}));
  };

  return (
    <div>
      <h2 id="topic-heading" data-cy="SubjectHeading">
        <Translate contentKey="cancerLibraryApp.topic.home.title">Categories</Translate>
        <div className="d-flex justify-content-end">
          <Button className="me-2" color="info" onClick={handleSyncList} disabled={loading}>
            <FontAwesomeIcon icon="sync" spin={loading} />{' '}
            <Translate contentKey="cancerLibraryApp.topic.home.refreshListLabel">Refresh List</Translate>
          </Button>
          <Link to="./new" className="btn btn-primary jh-create-entity" id="jh-create-entity" data-cy="entityCreateButton">
            <FontAwesomeIcon icon="plus" />
            &nbsp;
            <Translate contentKey="cancerLibraryApp.topic.home.createLabel">Create new Subject</Translate>
          </Link>
        </div>
      </h2>
      <div className="table-responsive">
        {topicList && topicList.length > 0 ? (
          <Table responsive>
            <thead>
              <tr>
                <th>
                  <Translate contentKey="cancerLibraryApp.topic.id">ID</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.topic.seq">Seq</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.topic.name">Name</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.topic.activated">Activated</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.topic.loadDtm">Load DTM</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.topic.subject.name">Subject Name</Translate>
                </th>
                <th />
              </tr>
            </thead>
            <tbody>
              {topicList.map((topic, i) => (
                <tr key={`entity-${i}`} data-cy="entityTable">
                  <td>
                    <Button tag={Link} to={`./${topic.id}`} color="link" size="sm">
                      {topic.id}
                    </Button>
                  </td>
                  <td>{topic.seq}</td>
                  <td>{topic.name}</td>
                  <td>{topic.activated ? 'true' : 'false'}</td>
                  <td>{topic.loadDtm ? <TextFormat value={topic.loadDtm} type="date" format={APP_DATE_FORMAT} blankOnInvalid /> : null}</td>
                  <td>{topic.subject.name}</td>

                  <td className="text-end">
                    <div className="btn-group flex-btn-group-container">
                      <Button tag={Link} to={`./${topic.id}`} color="info" size="sm" data-cy="entityDetailsButton">
                        <FontAwesomeIcon icon="eye" />{' '}
                        <span className="d-none d-md-inline">
                          <Translate contentKey="entity.action.view">View</Translate>
                        </span>
                      </Button>
                      <Button tag={Link} to={`./${topic.id}/edit`} color="primary" size="sm" data-cy="entityEditButton">
                        <FontAwesomeIcon icon="pencil-alt" />{' '}
                        <span className="d-none d-md-inline">
                          <Translate contentKey="entity.action.edit">Edit</Translate>
                        </span>
                      </Button>
                      <Button tag={Link} to={`./${topic.id}/delete`} color="danger" size="sm" data-cy="entityDeleteButton">
                        <FontAwesomeIcon icon="trash" />{' '}
                        <span className="d-none d-md-inline">
                          <Translate contentKey="entity.action.delete">Delete</Translate>
                        </span>
                      </Button>
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </Table>
        ) : (
          !loading && (
            <div className="alert alert-warning">
              <Translate contentKey="cancerLibraryApp.topic.home.notFound">No Categoies found</Translate>
            </div>
          )
        )}
      </div>
    </div>
  );
};

export default Topic;