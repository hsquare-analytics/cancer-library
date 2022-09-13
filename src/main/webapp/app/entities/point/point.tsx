import React, {useState, useEffect, useRef } from 'react';
import { Link, useLocation, useNavigate } from 'react-router-dom';
import { Translate, getSortState } from 'react-jhipster';

import { ASC, DESC, ITEMS_PER_PAGE, SORT } from 'app/shared/util/pagination.constants';
import { overridePaginationStateWithQueryParams } from 'app/shared/util/entity-utils';
import { useAppDispatch, useAppSelector } from 'app/config/store';

import { IPoint } from "app/shared/model/point.model";

// Dev Extreme
import { DataGrid,
  Form,
  Editing,
  Paging,
  Popup,
  Toolbar,
  Item as ItemToolbar,
  Column,
  SearchPanel,
  FilterRow,
  LoadPanel,
} from 'devextreme-react/data-grid';
import { Item as ItemFrom }  from 'devextreme-react/form';
import { Button as ButtonDevExtreme } from 'devextreme-react/button';

// Dev Extreme CSS
import 'devextreme/dist/css/dx.material.lime.light.compact.css'

import {getEntities, createEntity, updateEntity, deleteEntity} from './point.reducer';

import { cloneDeep } from 'lodash'

// Page SCSS
import './point.scss'

export const Point = () => {
  const dispatch = useAppDispatch();
  const popupRef = useRef(null);

  const location = useLocation();
  const navigate = useNavigate();

  const [paginationState, setPaginationState] = useState(
    overridePaginationStateWithQueryParams(getSortState(location, ITEMS_PER_PAGE, 'id'), location.search)
  );

  const pointList = useAppSelector(state => state.point.entities);
  const errorMessage = useAppSelector(state => state.point.errorMessage);

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

  const onInitNewRow = (e) => {
    e.component.option('editing.popup.title', 'new data')
  }

  const onEditingStart = (e) => {
    e.component.option('editing.popup.title', e.data.id)
  }

  const onRowInsert = (e) => {
    const data : IPoint = e.data;
    dispatch(createEntity(data));
  }

  const getNewData = (object, property) => {
    return object.newData[property];
    //return object.newData.hasOwnProperty(property) ? object.newData[property] : object.oldData[property];
  }

  const onRowUpdate = (e) => {
    const data : IPoint = {};
    data.id = e.oldData.id;
    data.title = getNewData(e, 'title')
    data.description = getNewData(e, 'description')

    dispatch(updateEntity(data))
  }

  const onRowRemove = (e) => {
    dispatch(deleteEntity(e.data.id))
  }

  const sortEntities = () => {
    getAllEntities();
    const endURL = `?page=${paginationState.activePage}&sort=${paginationState.sort},${paginationState.order}`;
    if (location.search !== endURL) {
      navigate(`${location.pathname}${endURL}`);
    }
  };

  useEffect(() => {
    //console.log(errorMessage)
  }, [errorMessage]);

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

  const handleSyncList = () => {
    sortEntities();
  };

  return (
    <div>
      <DataGrid
        dataSource={pointListCopy}
        keyExpr='id'
        showBorders={true}
        showColumnLines={true}
        onEditingStart={onEditingStart}
        onInitNewRow={onInitNewRow}
        onRowInserting={onRowInsert}
        onRowUpdating={onRowUpdate}
        onRowRemoved={onRowRemove}
      >
        <Toolbar>
          <ItemToolbar location="before">
            <div className='informer'>
              <h2 className='count'>{pointList.length}</h2>
              <span>Total Count</span>
            </div>
          </ItemToolbar>
          <ItemToolbar location="after">
            <ButtonDevExtreme
              icon='refresh'
              onClick={handleSyncList}
            />
          </ItemToolbar>
          <ItemToolbar name='addRowButton' />
          <ItemToolbar name='applyFilterButton' />
        </Toolbar>
        <Paging enabled={true} pageSize={15} defaultPageSize={15}/>
        <SearchPanel visible={true} />
        <FilterRow visible={true} />
        <LoadPanel enabled={true} />
        <Editing
          mode="popup"
          allowUpdating={true}
          allowAdding={true}
          allowDeleting={true}
        >
          <Popup
            showTitle={true}
            width={700}
            height={525}
            hideOnOutsideClick={true}
          />
          <Form>
            <ItemFrom
              itemType="group"
              colCount={2}
              colSpan={2}
            >
              <ItemFrom dataField={"title"} />
              <ItemFrom dataField={"description"}/>
            </ItemFrom>
          </Form>
        </Editing>
        <Column dataField={'id'} alignment={'left'} />
        <Column dataField={'title'} alignment='center' caption='title' />
        <Column dataField={'description'} alignment='center' caption='description' />
      </DataGrid>
    </div>
  );
};

export default Point;
