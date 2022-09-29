import React, {useEffect, useState} from 'react';
import {Link, useLocation, useNavigate} from 'react-router-dom';
import {Button, Table} from 'reactstrap';
import {getSortState, JhiItemCount, JhiPagination, Translate, TextFormat} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {ASC, DESC, ITEMS_PER_PAGE, SORT} from 'app/shared/util/pagination.constants';
import {overridePaginationStateWithQueryParams} from 'app/shared/util/entity-utils';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {getEntities} from './user-patient.reducer';
import {APP_DATE_FORMAT} from "app/config/constants";

export const UserPatient = () => {
  const dispatch = useAppDispatch();

  const location = useLocation();
  const navigate = useNavigate();

  const [paginationState, setPaginationState] = useState(
    overridePaginationStateWithQueryParams(getSortState(location, ITEMS_PER_PAGE, 'id'), location.search)
  );

  const userPatientList = useAppSelector(state => state.userPatient.entities);
  const loading = useAppSelector(state => state.userPatient.loading);
  const totalItems = useAppSelector(state => state.userPatient.totalItems);

  const getAllEntities = () => {
    dispatch(
      getEntities({
        page: paginationState.activePage - 1,
        size: paginationState.itemsPerPage,
        sort: `${paginationState.sort},${paginationState.order}`,
      })
    );
  };

  const sortEntities = () => {
    getAllEntities();
    const endURL = `?page=${paginationState.activePage}&sort=${paginationState.sort},${paginationState.order}`;
    if (location.search !== endURL) {
      navigate(`${location.pathname}${endURL}`);
    }
  };

  useEffect(() => {
    sortEntities();
  }, [paginationState.activePage, paginationState.order, paginationState.sort]);

  useEffect(() => {
    const params = new URLSearchParams(location.search);
    const page = params.get('page');
    const sort = params.get(SORT);
    if (page && sort) {
      const sortSplit = sort.split(',');
      setPaginationState({
        ...paginationState,
        activePage: +page,
        sort: sortSplit[0],
        order: sortSplit[1],
      });
    }
  }, [location.search]);

  const sort = p => () => {
    setPaginationState({
      ...paginationState,
      order: paginationState.order === ASC ? DESC : ASC,
      sort: p,
    });
  };

  const handlePagination = currentPage =>
    setPaginationState({
      ...paginationState,
      activePage: currentPage,
    });

  const handleSyncList = () => {
    sortEntities();
  };

  return (
    <div>
      <h2 id="userPatient-heading" data-cy="UserPatientHeading">
        <Translate contentKey="cancerLibraryApp.userPatient.home.title">UserPatients</Translate>
        <div className="d-flex justify-content-end">
          <Button className="me-2" color="info" onClick={handleSyncList} disabled={loading}>
            <FontAwesomeIcon icon="sync" spin={loading} />{' '}
            <Translate contentKey="cancerLibraryApp.userPatient.home.refreshListLabel">Refresh List</Translate>
          </Button>
          <Link to="/admin/user-patient/new" className="btn btnPrimary jh-create-entity" id="jh-create-entity" data-cy="entityCreateButton">
            <FontAwesomeIcon icon="plus" />
            &nbsp;
            <Translate contentKey="cancerLibraryApp.userPatient.home.createLabel">Create new UserPatient</Translate>
          </Link>
        </div>
      </h2>
      <div className="table-responsive">
        {userPatientList && userPatientList.length > 0 ? (
          <Table responsive>
            <thead>
              <tr>
                <th>
                  <Translate contentKey="cancerLibraryApp.userPatient.id">ID</Translate> <FontAwesomeIcon icon="sort" />
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.userPatient.user.login">User Login</Translate> <FontAwesomeIcon icon="sort" />
                </th>
                <th>
                  <Translate contentKey="cancerLibraryApp.userPatient.patientNo">Patient No:</Translate> <FontAwesomeIcon icon="sort" />
                </th>
                  <th>
                      <Translate contentKey="cancerLibraryApp.userPatient.createdDate">Created Date</Translate>
                  </th>
                  <th>
                      <Translate contentKey="cancerLibraryApp.userPatient.lastModifiedBy">Last Modified By</Translate>
                  </th>
                  <th>
                      <Translate contentKey="cancerLibraryApp.userPatient.lastModifiedDate">Last Modified Date</Translate>
                  </th>
                  <th />
              </tr>
            </thead>
            <tbody>
              {userPatientList.map((userPatient, i) => (
                <tr key={`entity-${i}`} data-cy="entityTable">
                  <td>
                    <Button tag={Link} to={`/admin/user-patient/${userPatient.id}`} color="link" size="sm">
                      {userPatient.id}
                    </Button>
                  </td>
                  <td>{userPatient.user.login}</td>
                  <td>{userPatient.patientNo}</td>
                    <td>
                        {userPatient.createdDate ?
                            <TextFormat value={userPatient.createdDate} type="date" format={APP_DATE_FORMAT} blankOnInvalid/> : null}
                    </td>
                    <td>{userPatient.lastModifiedBy}</td>
                    <td>
                        {userPatient.lastModifiedDate ? (
                            <TextFormat value={userPatient.lastModifiedDate} type="date" format={APP_DATE_FORMAT} blankOnInvalid/>
                        ) : null}
                    </td>
                  <td className="text-end">
                    <div className="btn-group flex-btn-group-container">
                      <Button tag={Link} to={`/admin/user-patient/${userPatient.id}`} color="info" size="sm" data-cy="entityDetailsButton">
                        <FontAwesomeIcon icon="eye" />{' '}
                        <span className="d-none d-md-inline">
                          <Translate contentKey="entity.action.view">View</Translate>
                        </span>
                      </Button>
                      <Button
                        tag={Link}
                        to={`/admin/user-patient/${userPatient.id}/edit?page=${paginationState.activePage}&sort=${paginationState.sort},${paginationState.order}`}
                        color="primary"
                        size="sm"
                        data-cy="entityEditButton"
                      >
                        <FontAwesomeIcon icon="pencil-alt" />{' '}
                        <span className="d-none d-md-inline">
                          <Translate contentKey="entity.action.edit">Edit</Translate>
                        </span>
                      </Button>
                      <Button
                        tag={Link}
                        to={`/admin/user-patient/${userPatient.id}/delete?page=${paginationState.activePage}&sort=${paginationState.sort},${paginationState.order}`}
                        color="danger"
                        size="sm"
                        data-cy="entityDeleteButton"
                      >
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
              <Translate contentKey="cancerLibraryApp.userPatient.home.notFound">No UserPatients found</Translate>
            </div>
          )
        )}
      </div>
      {totalItems ? (
        <div className={userPatientList && userPatientList.length > 0 ? '' : 'd-none'}>
          <div className="justify-content-center d-flex">
            <JhiItemCount page={paginationState.activePage} total={totalItems} itemsPerPage={paginationState.itemsPerPage} i18nEnabled />
          </div>
          <div className="justify-content-center d-flex">
            <JhiPagination
              activePage={paginationState.activePage}
              onSelect={handlePagination}
              maxButtons={5}
              itemsPerPage={paginationState.itemsPerPage}
              totalItems={totalItems}
            />
          </div>
        </div>
      ) : (
        ''
      )}
    </div>
  );
};

export default UserPatient;
