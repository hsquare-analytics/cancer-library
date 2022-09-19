import React, {useEffect, useState} from 'react';
import {Link, useLocation, useNavigate} from 'react-router-dom';
import {Translate, getSortState , translate} from 'react-jhipster';

import { ITEMS_PER_PAGE, SORT } from 'app/shared/util/pagination.constants';
import { overridePaginationStateWithQueryParams } from 'app/shared/util/entity-utils';

import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';

import {ICategory} from "app/shared/model/category.model";

import { getEntities, createEntity, updateEntity, deleteEntity} from "./category.reducer";
import { getEntities as getLibraries } from "app/entities/library/library.reducer";

import {DxDataGridTemplate} from "app/entities/devextream-datagrid/datagrid-template";
import {IEntityColumn} from "app/shared/model/devextreme-column.model";

import metaCategoryColumnInfo from "./category-column-info"
import metaCategoryFormInfo from "app/entities/category/category-form-info";
import {IEntityForm} from "app/shared/model/devextreme-form.model";

export const Category = () => {
  const dispatch = useAppDispatch();

  const location = useLocation();
  const navigate = useNavigate();

  const [ paginationState, setPaginationState] = useState(
    overridePaginationStateWithQueryParams(getSortState(location, ITEMS_PER_PAGE, 'id'), location.search)
  );

  const columns : Array<IEntityColumn> = [
    ...metaCategoryColumnInfo,
  ]

  const forms : Array<IEntityForm> = [
    ...metaCategoryFormInfo,
  ]

  const categoryList = useAppSelector(state => state.category.entities);
  const libraryList = useAppSelector(state => state.library.entities);

  const getAllCategoryEntities = () => {
    dispatch(
      getEntities({
        page: paginationState.activePage -1,
        size: paginationState.itemsPerPage,
        sort: `${paginationState.sort},${paginationState.order}`,
      })
    )
  }

  const getAllLibraryEntities = () => {
    if (libraryList.length === 0 ) {
      dispatch(getLibraries({}))
    }
  }

  const onRowInsert = (e) => {
    const data : ICategory = e.data;

    if ( typeof data.activated === 'undefined' || data.activated == null) {
      data.activated = true;
    }

    dispatch(createEntity(data));
  }

  const getNewData = (object, property) => {
    return object.newData[property];
  }

  const onRowUpdate = (e) => {
    const data : ICategory = {} ;
    data.id = e.oldData.id;
    data.title = typeof getNewData(e, 'title') === 'undefined' ? e.oldData.title : getNewData(e, 'title');
    data.description = typeof getNewData(e, 'description') === 'undefined' ? e.oldData.description : getNewData(e, 'description');
    data.library = typeof getNewData(e, 'library') === 'undefined' ? e.oldData.library : getNewData(e, 'library');
    data.activated = typeof getNewData(e, 'activated') === 'undefined' ? e.oldData.activated : getNewData(e, 'activated');

    dispatch(updateEntity(data))
  }

  const onRowRemove = (e) => {
    dispatch(deleteEntity(e.data.id));
  }

  const sortEntities = () => {
    getAllCategoryEntities();
    getAllLibraryEntities();
    const endURL = `?page=${paginationState.activePage}&sort=${paginationState.sort},${paginationState.order}`;
    if (location.search !== endURL) {
      navigate(`${location.pathname}${endURL}`);
    }
  }

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

  const handleSyncList = () => {
    sortEntities();
  };

  return (
    <div>
      <h2 id="category-heading" data-cy="CategoryHeading">
        <Translate contentKey="cancerLibraryApp.category.home.title">Categories</Translate>
      </h2>
      <br />
      <DxDataGridTemplate
        props={
          {
            title : "cancerLibraryApp.category.home.createOrEditLabel",
            datasource : categoryList,
            lookupDatasource :libraryList,
            pageSize : 5,
            defaultPageSize : 10,
            columns : columns,
            forms : forms,
            onRefreshEvent : handleSyncList,
            onRowInsertEvent : onRowInsert,
            onRowUpdateEvent : onRowUpdate,
            onRowDeleteEvent : onRowRemove,
          }
        }
      />
    </div>
  );
};

export default Category;
