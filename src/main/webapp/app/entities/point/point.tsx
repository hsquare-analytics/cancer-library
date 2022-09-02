import React, {useState, useEffect, useCallback} from 'react';
import { Link, useLocation, useNavigate } from 'react-router-dom';
import { Button, Table } from 'reactstrap';
import { Translate, getSortState, JhiPagination, JhiItemCount } from 'react-jhipster';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

import { ASC, DESC, ITEMS_PER_PAGE, SORT } from 'app/shared/util/pagination.constants';
import { overridePaginationStateWithQueryParams } from 'app/shared/util/entity-utils';
import { useAppDispatch, useAppSelector } from 'app/config/store';

// Dev Extreme
import { DataGrid,  Form, Editing, Paging, Popup } from 'devextreme-react/data-grid';
import { Item } from 'devextreme-react/form';

// Dev Extreme CSS
import 'devextreme/dist/css/dx.material.lime.light.compact.css'

import { getEntities, createEntity } from './point.reducer';

import { cloneDeep } from 'lodash'
import { IPoint } from "app/shared/model/point.model";

export const Point = () => {
  const dispatch = useAppDispatch();

  const location = useLocation();
  const navigate = useNavigate();

  const [paginationState, setPaginationState] = useState(
    overridePaginationStateWithQueryParams(getSortState(location, ITEMS_PER_PAGE, 'id'), location.search)
  );

  const pointList = useAppSelector(state => state.point.entities);
  const loading = useAppSelector(state => state.point.loading);
  const totalItems = useAppSelector(state => state.point.totalItems);

  const copyItem = (origin) => {
    return cloneDeep(origin);
  }

  const [pointListCopy, setPointListCopy] = useState(copyItem(pointList))

  const getAllEntities = () => {
    dispatch(
      getEntities({
        page: paginationState.activePage - 1,
        size: paginationState.itemsPerPage,
        sort: `${paginationState.sort},${paginationState.order}`,
      })
    );
  };

  const createEntities = (data : IPoint) => {
    dispatch(createEntity(
      data
    ))
  }

  const onRowInsert = (e) => {
    console.log(e.data)
    const data : IPoint = e.data;

    createEntities(data)
  }

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

  useEffect(() => {
    const temp = copyItem(pointList);
    setPointListCopy(temp)
  }, [pointList])

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
      <DataGrid
        dataSource={pointListCopy}
        keyExpr='id'
        defaultColumns={['id', 'title', 'description']}
        showBorders={true}
        onRowInserting={onRowInsert}
        onRowUpdating={(e) => console.log("onRowUpdating")}
        onEditCanceled={(e) => console.log("onEditCanceled")}
      >
        <Paging enabled={false} />
        <Editing
          mode="popup"
          allowUpdating={true}
          allowAdding={true}
          allowDeleting={true}
        >
          <Popup
            title={'Point DevExtrem Test'}
            showTitle={true}
            width={700}
            height={525}
          />

          <Form>
            <Item
              itemType="group"
              colCount={2}
              colSpan={2}
            >
              <Item dataField={"title"} />
              <Item dataField={"description"}/>
            </Item>
          </Form>
        </Editing>
      </DataGrid>
      <h2 id="point-heading" data-cy="PointHeading">
        <Translate contentKey="cancerLibraryApp.point.home.title">Points</Translate>
        <div className="d-flex justify-content-end">
          <Button className="me-2" color="info" onClick={handleSyncList} disabled={loading}>
            <FontAwesomeIcon icon="sync" spin={loading} />{' '}
            <Translate contentKey="cancerLibraryApp.point.home.refreshListLabel">Refresh List</Translate>
          </Button>
          <Link to="/point/new" className="btn btn-primary jh-create-entity" id="jh-create-entity" data-cy="entityCreateButton">
            <FontAwesomeIcon icon="plus" />
            &nbsp;
            <Translate contentKey="cancerLibraryApp.point.home.createLabel">Create new Point</Translate>
          </Link>
        </div>
      </h2>
      <div className="table-responsive">
        {pointList && pointList.length > 0 ? (
          <Table responsive>
            <thead>
              <tr>
                <th className="hand" onClick={sort('id')}>
                  <Translate contentKey="cancerLibraryApp.point.id">ID</Translate> <FontAwesomeIcon icon="sort" />
                </th>
                <th className="hand" onClick={sort('title')}>
                  <Translate contentKey="cancerLibraryApp.point.title">Title</Translate> <FontAwesomeIcon icon="sort" />
                </th>
                <th className="hand" onClick={sort('description')}>
                  <Translate contentKey="cancerLibraryApp.point.description">Description</Translate> <FontAwesomeIcon icon="sort" />
                </th>
                <th />
              </tr>
            </thead>
            <tbody>
              {pointList.map((point, i) => (
                <tr key={`entity-${i}`} data-cy="entityTable">
                  <td>
                    <Button tag={Link} to={`/point/${point.id}`} color="link" size="sm">
                      {point.id}
                    </Button>
                  </td>
                  <td>{point.title}</td>
                  <td>{point.description}</td>
                  <td className="text-end">
                    <div className="btn-group flex-btn-group-container">
                      <Button tag={Link} to={`/point/${point.id}`} color="info" size="sm" data-cy="entityDetailsButton">
                        <FontAwesomeIcon icon="eye" />{' '}
                        <span className="d-none d-md-inline">
                          <Translate contentKey="entity.action.view">View</Translate>
                        </span>
                      </Button>
                      <Button
                        tag={Link}
                        to={`/point/${point.id}/edit?page=${paginationState.activePage}&sort=${paginationState.sort},${paginationState.order}`}
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
                        to={`/point/${point.id}/delete?page=${paginationState.activePage}&sort=${paginationState.sort},${paginationState.order}`}
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
              <Translate contentKey="cancerLibraryApp.point.home.notFound">No Points found</Translate>
            </div>
          )
        )}
      </div>
      {totalItems ? (
        <div className={pointList && pointList.length > 0 ? '' : 'd-none'}>
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

export default Point;
