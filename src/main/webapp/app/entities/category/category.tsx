import React, {useEffect} from 'react';
import {Link, useLocation, useNavigate} from 'react-router-dom';
import {Button, Table} from 'reactstrap';
import {Translate, TextFormat} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {getEntities} from './category.reducer';
import {APP_DATE_FORMAT} from "app/config/constants";

export const Category = () => {
  const dispatch = useAppDispatch();

  const location = useLocation();
  const navigate = useNavigate();

  const categoryList = useAppSelector(state => state.category.entities);
  const loading = useAppSelector(state => state.category.loading);

  useEffect(() => {
    dispatch(getEntities({}));
  }, []);

  const handleSyncList = () => {
    dispatch(getEntities({}));
  };

  return (
    <div>
      <h2 id="category-heading" data-cy="CategoryHeading">
        <Translate contentKey="cancerLibraryApp.category.home.title">Categories</Translate>
        <div className="d-flex justify-content-end">
          <Button className="me-2" color="info" onClick={handleSyncList} disabled={loading}>
            <FontAwesomeIcon icon="sync" spin={loading} />{' '}
            <Translate contentKey="cancerLibraryApp.category.home.refreshListLabel">Refresh List</Translate>
          </Button>
          <Link to="./new" className="btn btn-primary jh-create-entity" id="jh-create-entity" data-cy="entityCreateButton">
            <FontAwesomeIcon icon="plus" />
            &nbsp;
            <Translate contentKey="cancerLibraryApp.category.home.createLabel">Create new Category</Translate>
          </Link>
        </div>
      </h2>
      <div className="table-responsive">
        {categoryList && categoryList.length > 0 ? (
          <Table responsive>
            <thead>
              <tr>
                <th>
                  <Translate contentKey="cancerLibraryApp.category.id">ID</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.category.title">title</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.category.description">Description</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.category.dateColumn">Date Column</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.category.activated">Activated</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.category.orderNo">Order No</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.category.topic.title">Topic Title</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.subject.createdDate">Created Date</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.subject.lastModifiedBy">Last Modified By</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.subject.lastModifiedDate">Last Modified Date</Translate>
                </th>
                <th />
              </tr>
            </thead>
            <tbody>
              {categoryList.map((category, i) => (
                <tr key={`entity-${i}`} data-cy="entityTable">
                  <td>
                    <Button tag={Link} to={`./${category.id}`} color="link" size="sm">
                      {category.id}
                    </Button>
                  </td>
                  <td>{category.title}</td>
                  <td>{category.description}</td>
                  <td>{category.dateColumn}</td>
                  <td>{category.activated ? 'true' : 'false'}</td>
                  <td>{category.orderNo}</td>
                  <td>{category.topic.title}</td>
                  <td>
                    {category.createdDate ? <TextFormat value={category.createdDate} type="date" format={APP_DATE_FORMAT} blankOnInvalid /> : null}
                  </td>
                  <td>{category.lastModifiedBy}</td>
                  <td>
                    {category.lastModifiedDate ? (
                      <TextFormat value={category.lastModifiedDate} type="date" format={APP_DATE_FORMAT} blankOnInvalid />
                    ) : null}
                  </td>
                  <td className="text-end">
                    <div className="btn-group flex-btn-group-container">
                      <Button tag={Link} to={`./${category.id}`} color="info" size="sm" data-cy="entityDetailsButton">
                        <FontAwesomeIcon icon="eye" />{' '}
                        <span className="d-none d-md-inline">
                          <Translate contentKey="entity.action.view">View</Translate>
                        </span>
                      </Button>
                      <Button tag={Link} to={`./${category.id}/edit`} color="primary" size="sm" data-cy="entityEditButton">
                        <FontAwesomeIcon icon="pencil-alt" />{' '}
                        <span className="d-none d-md-inline">
                          <Translate contentKey="entity.action.edit">Edit</Translate>
                        </span>
                      </Button>
                      <Button tag={Link} to={`./${category.id}/delete`} color="danger" size="sm" data-cy="entityDeleteButton">
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
              <Translate contentKey="cancerLibraryApp.category.home.notFound">No Categoies found</Translate>
            </div>
          )
        )}
      </div>
    </div>
  );
};

export default Category;
