import React from 'react';
import {useParams} from 'react-router-dom';

import {Translate, getSortState, translate} from 'react-jhipster'
import {overridePaginationStateWithQueryParams} from "app/shared/util/entity-utils";


import { cloneDeep } from 'lodash' ;
import {DxDataGridTemplate} from "app/entities/devextream-datagrid/datagrid-template";

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
    </div>
  );
};

export default DataEditor;
