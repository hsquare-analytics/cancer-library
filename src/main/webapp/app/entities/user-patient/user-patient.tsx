import React, {useEffect, useRef, useState} from 'react';
import {Link, useLocation, useNavigate} from 'react-router-dom';
import {Button} from 'reactstrap';
import {getSortState, JhiItemCount, JhiPagination, Translate, translate} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {ASC, DESC, ITEMS_PER_PAGE, SORT} from 'app/shared/util/pagination.constants';
import {overridePaginationStateWithQueryParams} from 'app/shared/util/entity-utils';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {getEntities} from './user-patient.reducer';
import DataGrid, {Column} from 'devextreme-react/data-grid';
import {getDxButtonColumns} from 'app/entities/entities.utils';
import UserPatientColumns from 'app/entities/user-patient/user-patient.column';

export const UserPatient = () => {
  const dispatch = useAppDispatch();

  const location = useLocation();
  const navigate = useNavigate();
  const dataGrid = useRef(null);

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
    <div className="wrap-page">
      <h2 id="userPatient-heading" data-cy="UserPatientHeading" className="title-page">
        <Translate contentKey="cancerLibraryApp.userPatient.home.title">UserPatients</Translate>
        <div className="d-flex justify-content-end">
          <Button className="me-2" color="secondary" onClick={() => dataGrid.current.instance.showColumnChooser()}>
            <FontAwesomeIcon icon="book"/>{' '}
          </Button>
          <Button className="me-2" color="info" onClick={handleSyncList} disabled={loading}>
            <FontAwesomeIcon icon="sync" spin={loading}/>{' '}
          </Button>
          <Link
            to="/admin/user-patient/new"
            className="btn btn-primary jh-create-entity"
            id="jh-create-entity"
            data-cy="entityCreateButton"
          >
            <FontAwesomeIcon icon="plus"/>
          </Link>
        </div>
      </h2>
      <div className="table-responsive">
        {userPatientList && userPatientList.length > 0 ? (
          <DataGrid
            ref={dataGrid}
            dataSource={userPatientList}
            showBorders={true}
            filterRow={{visible: true}}
            headerFilter={{visible: true}}
            showColumnLines={true}
            showRowLines={true}
            rowAlternationEnabled={true}
            showColumnHeaders={true}
            hoverStateEnabled={true}
            allowColumnReordering={true}
            allowColumnResizing={true}
            columnResizingMode={'widget'}
            editing={{
              mode: 'row',
              useIcons: true,
              allowUpdating: true,
              allowDeleting: true,
            }}
            paging={{pageSize: 20}}
columnChooser={{mode: 'select', height: 600, width: 500, sortOrder: 'asc', allowSearch: true}}
          >
            {UserPatientColumns.map((column, index) => (
              <Column
                key={index}
                dataField={column.dataField}
                caption={translate('cancerLibraryApp.userPatient.' + column.dataField)}
                dataType={column.dataType}
                visible={column.visible}
                width={column.width}
                format={column.format}
                sortIndex={column.sortIndex}
                sortOrder={column.sortOrder}
                alignment={'center'}
              />
            ))}
            <Column type="buttons" width={110} buttons={getDxButtonColumns(navigate)}/>
          </DataGrid>
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
            <JhiItemCount page={paginationState.activePage} total={totalItems}
                          itemsPerPage={paginationState.itemsPerPage} i18nEnabled/>
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
