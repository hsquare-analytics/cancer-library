import React, {useEffect} from 'react';
import {Link, useLocation, useNavigate} from 'react-router-dom';
import {Button, Table} from 'reactstrap';
import {Translate} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {getEntities} from './library.reducer';

export const Library = () => {
  const dispatch = useAppDispatch();

  const location = useLocation();
  const navigate = useNavigate();

  const libraryList = useAppSelector(state => state.library.entities);
  const loading = useAppSelector(state => state.library.loading);

  useEffect(() => {
    dispatch(getEntities({}));
  }, []);

  const handleSyncList = () => {
    dispatch(getEntities({}));
  };

  return (
    <div>
      <h2 id="library-heading" data-cy="LibraryHeading">
        <Translate contentKey="cancerLibraryApp.library.home.title">Libraries</Translate>
        <div className="d-flex justify-content-end">
          <Button className="me-2" color="info" onClick={handleSyncList} disabled={loading}>
            <FontAwesomeIcon icon="sync" spin={loading} />{' '}
            <Translate contentKey="cancerLibraryApp.library.home.refreshListLabel">Refresh List</Translate>
          </Button>
          <Link to="./new" className="btn btn-primary jh-create-entity" id="jh-create-entity" data-cy="entityCreateButton">
            <FontAwesomeIcon icon="plus" />
            &nbsp;
            <Translate contentKey="cancerLibraryApp.library.home.createLabel">Create new Library</Translate>
          </Link>
        </div>
      </h2>
      <div className="table-responsive">
        {libraryList && libraryList.length > 0 ? (
          <Table responsive>
            <thead>
              <tr>
                <th>
                  <Translate contentKey="cancerLibraryApp.library.id">ID</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.library.title">Title</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.library.description">Description</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.library.activated">Activated</Translate>
                </th>
                <th />
              </tr>
            </thead>
            <tbody>
              {libraryList.map((library, i) => (
                <tr key={`entity-${i}`} data-cy="entityTable">
                  <td>
                    <Button tag={Link} to={`./${library.id}`} color="link" size="sm">
                      {library.id}
                    </Button>
                  </td>
                  <td>{library.title}</td>
                  <td>{library.description}</td>
                  <td>{library.activated ? 'true' : 'false'}</td>
                  <td className="text-end">
                    <div className="btn-group flex-btn-group-container">
                      <Button tag={Link} to={`./${library.id}`} color="info" size="sm" data-cy="entityDetailsButton">
                        <FontAwesomeIcon icon="eye" />{' '}
                        <span className="d-none d-md-inline">
                          <Translate contentKey="entity.action.view">View</Translate>
                        </span>
                      </Button>
                      <Button tag={Link} to={`./${library.id}/edit`} color="primary" size="sm" data-cy="entityEditButton">
                        <FontAwesomeIcon icon="pencil-alt" />{' '}
                        <span className="d-none d-md-inline">
                          <Translate contentKey="entity.action.edit">Edit</Translate>
                        </span>
                      </Button>
                      <Button tag={Link} to={`./${library.id}/delete`} color="danger" size="sm" data-cy="entityDeleteButton">
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
              <Translate contentKey="cancerLibraryApp.library.home.notFound">No Libraries found</Translate>
            </div>
          )
        )}
      </div>
    </div>
  );
};

export default Library;
