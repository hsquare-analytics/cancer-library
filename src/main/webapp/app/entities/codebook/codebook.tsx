import React, {useEffect, useState} from 'react';
import {Link, useLocation, useNavigate} from 'react-router-dom';
import {Button} from 'reactstrap';
import {getSortState, JhiItemCount, JhiPagination, Translate} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {ASC, DESC, ITEMS_PER_PAGE, SORT} from 'app/shared/util/pagination.constants';
import {overridePaginationStateWithQueryParams} from 'app/shared/util/entity-utils';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {getEntities} from './codebook.reducer';
import DataGrid, {Column} from 'devextreme-react/data-grid';
import {getDxButtonColumns} from "app/entities/entities.utils";
import CodebookColumns from "app/entities/codebook/codebook.column";

export const Codebook = () => {
  const dispatch = useAppDispatch();

  const location = useLocation();
  const navigate = useNavigate();

  const [paginationState, setPaginationState] = useState(
    overridePaginationStateWithQueryParams(getSortState(location, ITEMS_PER_PAGE, 'id'), location.search)
  );

  const codebookList = useAppSelector(state => state.codebook.entities);
  const loading = useAppSelector(state => state.codebook.loading);
  const totalItems = useAppSelector(state => state.codebook.totalItems);

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
      <h2 id="codebook-heading" data-cy="CodebookHeading">
        <Translate contentKey="cancerLibraryApp.codebook.home.title">Codebooks</Translate>
        <div className="d-flex justify-content-end">
          <Button className="me-2" color="info" onClick={handleSyncList} disabled={loading}>
            <FontAwesomeIcon icon="sync" spin={loading}/>{' '}
          </Button>
          <Link to="/admin/codebook/new" className="btn btn-primary jh-create-entity" id="jh-create-entity"
                data-cy="entityCreateButton">
            <FontAwesomeIcon icon="plus"/>
          </Link>
        </div>
      </h2>
      <div className="table-responsive">
        {codebookList && codebookList.length > 0 ? (
          <DataGrid
            dataSource={codebookList}
            showBorders={true}
            filterRow={{visible: true}}
            headerFilter={{visible: true}}
            showColumnLines={true}
            showRowLines={true}
            rowAlternationEnabled={true}
            showColumnHeaders={true}
            editing={{
              mode: "row",
              useIcons: true,
              allowUpdating: true,
              allowDeleting: true
            }}
            paging={{pageSize: 22}}
          >
            {CodebookColumns.map((column, index) => <Column
              key={index}
              dataField={column.dataField}
              caption={column.caption}
              dataType={column.dataType}
              visible={column.visible}
              width={column.width}
              format={column.format}
              sortIndex={column.sortIndex}
              sortOrder={column.sortOrder}
              alignment={'center'}
            />)}
            <Column type="buttons" width={110} buttons={getDxButtonColumns(navigate)}/>
          </DataGrid>
        ) : (
          !loading && (
            <div className="alert alert-warning">
              <Translate contentKey="cancerLibraryApp.codebook.home.notFound">No Codebooks found</Translate>
            </div>
          )
        )}
      </div>
      {totalItems ? (
        <div className={codebookList && codebookList.length > 0 ? '' : 'd-none'}>
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

export default Codebook;
