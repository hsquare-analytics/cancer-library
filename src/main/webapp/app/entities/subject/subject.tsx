import React, {useEffect} from 'react';
import {Link, useLocation, useNavigate} from 'react-router-dom';
import {Button, Table} from 'reactstrap';
import {Translate,TextFormat} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {getEntities} from './subject.reducer';
import {APP_DATE_FORMAT} from "app/config/constants";

export const Subject = () => {
  const dispatch = useAppDispatch();

  const location = useLocation();
  const navigate = useNavigate();

  const subjectList = useAppSelector(state => state.subject.entities);
  const loading = useAppSelector(state => state.subject.loading);

  useEffect(() => {
    dispatch(getEntities({}));
  }, []);

  const handleSyncList = () => {
    dispatch(getEntities({}));
  };

  return (
    <div>
      <h2 id="subject-heading" data-cy="SubjectHeading">
        <Translate contentKey="cancerLibraryApp.subject.home.title">Categories</Translate>
        <div className="d-flex justify-content-end">
          <Button className="me-2" color="info" onClick={handleSyncList} disabled={loading}>
            <FontAwesomeIcon icon="sync" spin={loading} />{' '}
            <Translate contentKey="cancerLibraryApp.subject.home.refreshListLabel">Refresh List</Translate>
          </Button>
          <Link to="./new" className="btn btn-primary jh-create-entity" id="jh-create-entity" data-cy="entityCreateButton">
            <FontAwesomeIcon icon="plus" />
            &nbsp;
            <Translate contentKey="cancerLibraryApp.subject.home.createLabel">Create new Subject</Translate>
          </Link>
        </div>
      </h2>
      <div className="table-responsive">
        {subjectList && subjectList.length > 0 ? (
          <Table responsive>
            <thead>
              <tr>
                <th>
                  <Translate contentKey="cancerLibraryApp.subject.id">ID</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.subject.title">Name</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.subject.activated">Activated</Translate>
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.subject.orderNo">Order No</Translate>
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
              {subjectList.map((subject, i) => (
                <tr key={`entity-${i}`} data-cy="entityTable">
                  <td>
                    <Button tag={Link} to={`./${subject.id}`} color="link" size="sm">
                      {subject.id}
                    </Button>
                  </td>
                  <td>{subject.title}</td>
                  <td>{subject.activated ? 'true' : 'false'}</td>
                  <td>{subject.orderNo}</td>
                  <td>
                    {subject.createdDate ? <TextFormat value={subject.createdDate} type="date" format={APP_DATE_FORMAT} blankOnInvalid /> : null}
                  </td>
                  <td>{subject.lastModifiedBy}</td>
                  <td>
                    {subject.lastModifiedDate ? (
                      <TextFormat value={subject.lastModifiedDate} type="date" format={APP_DATE_FORMAT} blankOnInvalid />
                    ) : null}
                  </td>
                  <td className="text-end">
                    <div className="btn-group flex-btn-group-container">
                      <Button tag={Link} to={`./${subject.id}`} color="info" size="sm" data-cy="entityDetailsButton">
                        <FontAwesomeIcon icon="eye" />{' '}
                        <span className="d-none d-md-inline">
                          <Translate contentKey="entity.action.view">View</Translate>
                        </span>
                      </Button>
                      <Button tag={Link} to={`./${subject.id}/edit`} color="primary" size="sm" data-cy="entityEditButton">
                        <FontAwesomeIcon icon="pencil-alt" />{' '}
                        <span className="d-none d-md-inline">
                          <Translate contentKey="entity.action.edit">Edit</Translate>
                        </span>
                      </Button>
                      <Button tag={Link} to={`./${subject.id}/delete`} color="danger" size="sm" data-cy="entityDeleteButton">
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
              <Translate contentKey="cancerLibraryApp.subject.home.notFound">No Categoies found</Translate>
            </div>
          )
        )}
      </div>
    </div>
  );
};

export default Subject;
