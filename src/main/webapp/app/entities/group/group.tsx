import React, {useEffect} from 'react';
import {Link, useLocation, useNavigate} from 'react-router-dom';
import {Button, Table} from 'reactstrap';
import {Translate, TextFormat} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {getEntities} from './group.reducer';
import {APP_DATE_FORMAT} from "app/config/constants";

export const Group = () => {
  const dispatch = useAppDispatch();

  const location = useLocation();
  const navigate = useNavigate();

  const groupList = useAppSelector(state => state.group.entities);
  const loading = useAppSelector(state => state.group.loading);

  useEffect(() => {
    dispatch(getEntities({}));
  }, []);

  const handleSyncList = () => {
    dispatch(getEntities({}));
  };

  return (
    <div>
      <h2 id="group-heading" data-cy="SubjectHeading">
        <Translate contentKey="cancerLibraryApp.group.home.title">Categories</Translate>
        <div className="d-flex justify-content-end">
          <Button className="me-2" color="info" onClick={handleSyncList} disabled={loading}>
            <FontAwesomeIcon icon="sync" spin={loading}/>{' '}
            <Translate contentKey="cancerLibraryApp.group.home.refreshListLabel">Refresh List</Translate>
          </Button>
          <Link to="./new" className="btn btn-primary jh-create-entity" id="jh-create-entity"
                data-cy="entityCreateButton">
            <FontAwesomeIcon icon="plus"/>
            &nbsp;
            <Translate contentKey="cancerLibraryApp.group.home.createLabel">Create new Subject</Translate>
          </Link>
        </div>
      </h2>
      <div className="table-responsive">
        {groupList && groupList.length > 0 ? (
          <Table responsive>
            <thead>
            <tr>
              <th>
                <Translate contentKey="cancerLibraryApp.group.id">ID</Translate>
              </th>
              <th>
                <Translate contentKey="cancerLibraryApp.group.title">Title</Translate>
              </th>
              <th>
                <Translate contentKey="cancerLibraryApp.group.activated">Activated</Translate>
              </th>
              <th>
                <Translate contentKey="cancerLibraryApp.group.orderNo">Order No</Translate>
              </th>
              <th>
                <Translate contentKey="cancerLibraryApp.group.category.title">Category Title</Translate>
              </th>
              <th>
                <Translate contentKey="cancerLibraryApp.group.createdDate">Created Date</Translate>
              </th>
              <th>
                <Translate contentKey="cancerLibraryApp.group.lastModifiedBy">Last Modified By</Translate>
              </th>
              <th>
                <Translate contentKey="cancerLibraryApp.group.lastModifiedDate">Last Modified Date</Translate>
              </th>
              <th/>
            </tr>
            </thead>
            <tbody>
            {groupList.map((group, i) => (
              <tr key={`entity-${i}`} data-cy="entityTable">
                <td>
                  <Button tag={Link} to={`./${group.id}`} color="link" size="sm">
                    {group.id}
                  </Button>
                </td>
                <td>{group.title}</td>
                <td>{group.activated ? 'true' : 'false'}</td>
                <td>{group.orderNo}</td>
                <td>{group.category?.title}</td>
                <td>
                  {group.createdDate ? <TextFormat value={group.createdDate} type="date" format={APP_DATE_FORMAT} blankOnInvalid /> : null}
                </td>
                <td>{group.lastModifiedBy}</td>
                <td>
                  {group.lastModifiedDate ? (
                    <TextFormat value={group.lastModifiedDate} type="date" format={APP_DATE_FORMAT} blankOnInvalid />
                  ) : null}
                </td>
                <td className="text-end">
                  <div className="btn-group flex-btn-group-container">
                    <Button tag={Link} to={`./${group.id}`} color="info" size="sm" data-cy="entityDetailsButton">
                      <FontAwesomeIcon icon="eye"/>{' '}
                      <span className="d-none d-md-inline">
                          <Translate contentKey="entity.action.view">View</Translate>
                        </span>
                    </Button>
                    <Button tag={Link} to={`./${group.id}/edit`} color="primary" size="sm" data-cy="entityEditButton">
                      <FontAwesomeIcon icon="pencil-alt"/>{' '}
                      <span className="d-none d-md-inline">
                          <Translate contentKey="entity.action.edit">Edit</Translate>
                        </span>
                    </Button>
                    <Button tag={Link} to={`./${group.id}/delete`} color="danger" size="sm"
                            data-cy="entityDeleteButton">
                      <FontAwesomeIcon icon="trash"/>{' '}
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
              <Translate contentKey="cancerLibraryApp.group.home.notFound">No Categoies found</Translate>
            </div>
          )
        )}
      </div>
    </div>
  );
};

export default Group;
