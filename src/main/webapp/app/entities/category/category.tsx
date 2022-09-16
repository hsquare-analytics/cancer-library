import React, {useEffect, useState} from 'react';
import {Link, useLocation, useNavigate} from 'react-router-dom';
import {Translate, getSortState , translate} from 'react-jhipster';

import { ITEMS_PER_PAGE, SORT } from 'app/shared/util/pagination.constants';
import { overridePaginationStateWithQueryParams } from 'app/shared/util/entity-utils';

import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';

import {ICategory} from "app/shared/model/category.model";

// Dev Extreme
import {
  DataGrid,
  Form,
  Editing,
  Paging,
  Popup,
  Toolbar,
  Item as ItemToolBar,
  Column,
  SearchPanel,
  FilterRow,
  LoadPanel,
} from 'devextreme-react/data-grid';
import {Item as ItemForm } from 'devextreme-react/form';

// DevExtreme CSS
import 'devextreme/dist/css/dx.material.lime.light.compact.css'

import { getEntities, createEntity, updateEntity, deleteEntity} from "./category.reducer";
import { getEntities as getLibraries } from "app/entities/library/library.reducer";

import { cloneDeep } from 'lodash' ;

// Category Css
import './category.scss'

export const Category = () => {
  const dispatch = useAppDispatch();

  const location = useLocation();
  const navigate = useNavigate();

  const [ paginationState, setPaginationState] = useState(
    overridePaginationStateWithQueryParams(getSortState(location, ITEMS_PER_PAGE, 'id'), location.search)
  );

  const categoryList = useAppSelector(state => state.category.entities);
  const libraryList = useAppSelector(state => state.library.entities);

  const copyItem = (origin) => {
    return cloneDeep(origin);
  }

  const [categoryListCopy, setCategoryListCopy] = useState(copyItem(categoryList))

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
    data.title = getNewData(e, 'title');
    data.description = getNewData(e, 'description');
    data.library = getNewData(e, 'library');
    data.activated = getNewData(e, 'activated');

    console.log(data)
  }

  const onRowRemove = (e) => {
    dispatch(deleteEntity(e.data.id));
  }

  const renderTitleHeader = (data) => {
    let key = "warning.empty-value";
    switch(data.column.caption) {
      case "library.title" :
        key = "cancerLibraryApp.library.title";
        break;
      case "library.id" :
        key = "cancerLibraryApp.library.id";
        break;
      case "library.description" :
        key = "cancerLibraryApp.library.description";
        break;
      case "library.activated" :
        key = "cancerLibraryApp.library.activated";
        break;
      case "id" :
        key = "cancerLibraryApp.category.id"
        break;
      case "title" :
        key = "cancerLibraryApp.category.title"
        break;
      case "description" :
        key = "cancerLibraryApp.category.description"
        break;
      case "activated" :
        key = "cancerLibraryApp.category.activated"
        break;
    }
    return <Translate contentKey={key}>Empty</Translate>
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

  useEffect(() => {
    const temp = copyItem(categoryList);
    setCategoryListCopy(temp);
  }, [categoryList])

  const handleSyncList = () => {
    sortEntities();
  };

  const onToolbarPreparing = (e) => {
    let toolbarItems = e.toolbarOptions.items;

    toolbarItems.forEach((item) => {
      switch (item.name) {
        case "refreshRowButton" :
          item.showText="always";
          item.location="after";
          item.widget="dxButton";
          item.options= {
            icon: "refresh",
            text: translate('cancerLibraryApp.category.home.refreshListLabel'),
            onClick : handleSyncList
          }
          break;
        case "addRowButton" :
          item.showText="always";
          item.location="after";
          item.widget="dxButton";
          item.options = {
            icon: "add",
            text: "Add",
            elementAttr : {
              class : "me-2"
            },
            onClick : () => { e.component.addRow() }
          }
      }
    });
  }

    const onEditingStart = (e) => {
      e.component.option("editing.popup.title" , typeof e.data.title !== 'undefined' ? e.data.title : translate("cancerLibraryApp.category.home.createLabel"));

      e.data.activated = typeof e.data.activated !== 'undefined' ? e.data.activated : false;
    }


  return (
    <div>
      <h2 id="category-heading" data-cy="CategoryHeading">
        <Translate contentKey="cancerLibraryApp.category.home.title">Categories</Translate>
      </h2>
      <br />
      <DataGrid
        dataSource = {categoryListCopy}
        keyExpr = 'id'
        showBorders={true}
        showColumnLines={true}
        onRowInserting={onRowInsert}
        onRowUpdating={onRowUpdate}
        onRowRemoved={onRowRemove}
        onToolbarPreparing={onToolbarPreparing}
        onEditingStart={onEditingStart}
        onInitNewRow={onEditingStart}
        >
        <Toolbar>
          <ItemToolBar location="before">
            <div className="informer">
              <h2 className="count">{categoryList.length}</h2>
              <span>
                <Translate contentKey="global.table.header.total-count"> Total Count </Translate>
              </span>
            </div>
          </ItemToolBar>
          <ItemToolBar name="refreshRowButton"/>
          <ItemToolBar name="addRowButton"/>
        </Toolbar>
        <Paging enabled={true} pageSize={10} defaultPageSize={10} />
        <SearchPanel visible={true} />
        <FilterRow visible={true} />
        <LoadPanel enabled={true} />
        <Editing
          mode="popup"
          allowUpdating={true}
          allowDeleting={true}
          allowAdding={true}
        >
          <Popup showTitle={true} width={700} height={525} hideOnOutsideClick={true} />
          <Form>
            <ItemForm itemType="group" colCount={2} colSpan={2}>
              <ItemForm dataField={"title"}/>
              <ItemForm dataField={"description"} />
              <ItemForm dataField={"activated"} caption="activated" editorType="dxCheckBox" />
              <ItemForm dataField={"library.id"}
                        editorType="dxSelectBox"
                        editorOptions={
                          {"dataSource": libraryList,
                            "displayExpr" : "title",
                            "valueExpr" : "id",
                          }
                        }
              />
            </ItemForm>
          </Form>
        </Editing>
        <Column dataField={'id'} alignment={'left'} caption='id' width={100} headerCellRender={renderTitleHeader}/>
        <Column dataField={'title'} alignment="center" caption='title' headerCellRender={renderTitleHeader}/>
        <Column dataField={'description'} alignment="center" caption="description" headerCellRender={renderTitleHeader}/>
        <Column dataField={'activated'} alignment="center" caption="activated" headerCellRender={renderTitleHeader} />
        <Column caption={'Library'}>
          <Column dataField={'library.id'} caption="library.id" headerCellRender={renderTitleHeader} />
          <Column dataField={'library.title'} caption="library.title" headerCellRender={renderTitleHeader}/>
          <Column dataField={'library.description'} caption="library.description" headerCellRender={renderTitleHeader}/>
          <Column dataField={'library.activated'} caption="library.activated" headerCellRender={renderTitleHeader}/>
        </Column>
      </DataGrid>
    </div>
  );
};

export default Category;
