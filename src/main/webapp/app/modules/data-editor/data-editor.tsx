import React from 'react';
import {useParams} from 'react-router-dom';

import {Translate, getSortState, translate} from 'react-jhipster'
import {overridePaginationStateWithQueryParams} from "app/shared/util/entity-utils";

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

import { cloneDeep } from 'lodash' ;

export const DataEditor = () => {
  const { categoryId } = useParams<'categoryId'>();

  const dataList = []

  const onRowInsert = (e) => {
    // dispatch(createEntity(data))
  }

  const getNewData = (object, property) => {
    return object.newData[property];
  }

  const onRowUpdate = (e) => {
    // dispatch(updateEntity(data))
  }

  const onRowRemove = (e) => {
    // dispatch(deleteEntity(e.data.id));
  }

  const handleSyncList = () => {
     // refresh event
  }

  const onToolbarPreparing = (e) => {
    let toolbarItems = e.toolbarOptions.items;

    toolbarItems.forEach((item) => {
      switch (item.name) {
        case "refreshRowButton" :
          item.showText="always";
          item.location="after";
          item.widget="dxButton";
          item.options = {
            icon: "refresh",
            text: "data-editor", // TODO : translate...
            onClick : handleSyncList
          }
          break;
        case "addRowButton":
          item.showText="always"
          item.location = "after"
          item.widget = "dxButton"
          item.options = {
            icon : "add",
            text : "Add",
            elementAttr: {
              class : "me-2"
            },
            onClick: () => { e.component.addRow() }
          }
          break;
      }
    })
  }

  const onEditingStart = (e) => {
    e.component.option("editing.popup.title" , typeof e.data.title !== 'undefined' ? e.data.title : translate("cancerLibraryApp.category.home.createLabel"));

    e.data.activated = typeof e.data.activated !== 'undefined' ? e.data.activated : false;
  }

  return (
    <div>
      <h2 id="configuration-page-heading" data-cy="configurationPageHeading">
       Data Editor
      </h2>
      <p>
        category id: {categoryId}
      </p>
      <br />
      <DataGrid
        dataSource={dataList}
        showBorders={true}
        showColumnLines={true}
        onRowInserting={onRowInsert}
        onRowUpdating={onRowUpdate}
        onRowRemoving={onRowRemove}
        onToolbarPreparing={onToolbarPreparing}
        onEditingStart={onEditingStart}
        onInitNewRow={onEditingStart}
      >
        <Toolbar>
          <ItemToolBar location="before">
            <div className="informer">
              {/* check data count */}
              <h2 className="count">0</h2>
              <span>
                <Translate contentKey=""> Total Count </Translate>
              </span>
            </div>
          </ItemToolBar>
          <ItemToolBar name="refreshRowButton"/>
          <ItemToolBar name="addRowButton" />
        </Toolbar>
        <Paging enabled={true} pageSize={10} defaultPageSize={10} />
        <SearchPanel visible={true}/>
        <FilterRow visible={true}/>
        <Editing
          mode="popup"
          allowUpdating={true}
          allowDeleting={true}
          allowAdding={true}
          >
          <Popup showTitle={true} width={700} height={525} hideOnOutsideClick={true}/>
        </Editing>
      </DataGrid>
    </div>
  );
};

export default DataEditor;
