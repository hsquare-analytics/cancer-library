import React, {useEffect} from 'react';
import {Link, useLocation, useNavigate} from 'react-router-dom';
import {Button, Table} from 'reactstrap';
import {Translate} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {getEntities} from './user-category.reducer';

export const UserCategory = () => {
  const dispatch = useAppDispatch();

  const location = useLocation();
  const navigate = useNavigate();

  const userCategoryList = useAppSelector(state => state.userCategory.entities);
  const loading = useAppSelector(state => state.userCategory.loading);

  useEffect(() => {
    dispatch(getEntities({}));
  }, []);

  const handleSyncList = () => {
    dispatch(getEntities({}));
  };

  return (
    <div>
      <h2 id="category-heading" data-cy="CategoryHeading">
        <Translate contentKey="cancerLibraryApp.userCategory.home.title">Categories</Translate>
        <div className="d-flex justify-content-end">
          <Button className="me-2" color="info" onClick={handleSyncList} disabled={loading}>
            <FontAwesomeIcon icon="sync" spin={loading} />{' '}
            <Translate contentKey="cancerLibraryApp.userCategory.home.refreshListLabel">Refresh List</Translate>
          </Button>
          <Link to="/user-category/new" className="btn btn-primary jh-create-entity" id="jh-create-entity" data-cy="entityCreateButton">
            <FontAwesomeIcon icon="plus" />
            &nbsp;
            <Translate contentKey="cancerLibraryApp.userCategory.home.createLabel">Create new Category</Translate>
          </Link>
        </div>
      </h2>
      <div className="table-responsive">
        {userCategoryList && userCategoryList.length > 0 ? (
          <Table responsive>
            <thead>
              <tr>
                <th>
                  <Translate contentKey="cancerLibraryApp.userCategory.id">ID</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.userCategory.user">User</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.userCategory.category">Category</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.userCategory.activated">Activated</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.userCategory.termStart">Term Start</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.userCategory.termEnd">Term End</Translate>
                </th>
                <th />
              </tr>
            </thead>
            <tbody>
              {userCategoryList.map((userCategory, i) => (
                <tr key={`entity-${i}`} data-cy="entityTable">
                  <td>
                    <Button tag={Link} to={`/user-category/${userCategory.id}`} color="link" size="sm">
                      {userCategory.id}
                    </Button>
                  </td>
                  <td>{userCategory.user.login}</td>
                  <td>{userCategory.category.title}</td>
                  <td>{userCategory.activated ? 'true' : 'false'}</td>
                  <td>{userCategory.termStart}</td>
                  <td>{userCategory.termEnd}</td>
                  <td className="text-end">
                    <div className="btn-group flex-btn-group-container">
                      <Button tag={Link} to={`/user-category/${userCategory.id}`} color="info" size="sm" data-cy="entityDetailsButton">
                        <FontAwesomeIcon icon="eye" />{' '}
                        <span className="d-none d-md-inline">
                          <Translate contentKey="entity.action.view">View</Translate>
                        </span>
                      </Button>
                      <Button tag={Link} to={`/user-category/${userCategory.id}/edit`} color="primary" size="sm" data-cy="entityEditButton">
                        <FontAwesomeIcon icon="pencil-alt" />{' '}
                        <span className="d-none d-md-inline">
                          <Translate contentKey="entity.action.edit">Edit</Translate>
                        </span>
                      </Button>
                      <Button tag={Link} to={`/user-category/${userCategory.id}/delete`} color="danger" size="sm" data-cy="entityDeleteButton">
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
              <Translate contentKey="cancerLibraryApp.userCategory.home.notFound">No Categoies found</Translate>
            </div>
          )
        )}
      </div>
    </div>
  );
};

export default UserCategory;
