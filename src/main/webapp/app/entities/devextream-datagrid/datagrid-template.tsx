import React, {useEffect, useState} from 'react';

import {Translate, translate} from 'react-jhipster'

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
import './datagrid-template.scss'

import {cloneDeep} from 'lodash';

export interface IDxDataGridTemplate {
  title : string;
  dataSource: Array<any>;
  lookupDataSource :Array<any>;
  columns? : Array<any>;
  forms : Array<any>;
  pageSize?: number;
  defaultPageSize?: number;
  onRefreshEvent? : Function;
  onRowInsertEvent? : Function;
  onRowUpdateEvent? : Function;
  onRowDeleteEvent? : Function;
}

export const DxDataGridTemplate = ({props : IDxDataGridTemplate}) => {

  const copyItem = (origin) => {
    return cloneDeep(origin)
  }

  const {
    title,
    datasource,
    lookupDatasource,
    pageSize,
    defaultPageSize,
    columns,
    forms,
    onRefreshEvent,
    onRowInsertEvent,
    onRowUpdateEvent,
    onRowDeleteEvent,
  } = IDxDataGridTemplate

  const [copiedItem, setCopiedItem] = useState(copyItem(datasource));
  const [count, setCount] = useState(0);

  useEffect(() => {
    const temp = copyItem(datasource);
    setCopiedItem(temp);
    typeof temp === 'undefined' ? setCount(0) : setCount(temp.length);
  }, [datasource])

  useEffect(() => {
    /* re-render ?? */
  }, [lookupDatasource])


  const onRefreshButtonClick = (e) => {
    typeof onRefreshEvent !== 'undefined' ? onRefreshEvent(e) : alert("Not Supported Refresh Event");
  }

  const onRowInsert = (e) => {
    typeof onRowInsertEvent !== 'undefined' ? onRowInsertEvent(e) : alert("Not Supported RowInsertEvent");
  }

  const onRowUpdate = (e) => {
    typeof onRowUpdateEvent !== 'undefined' ? onRowUpdateEvent(e) : alert("Not Supported RowUpdateEvent");
  }

  const onRowDelete = (e) => {
    typeof onRowDeleteEvent !== 'undefined' ? onRowDeleteEvent(e) : alert("Not Supported RowDeleteEvent");
  }

  // prepare UI
  const onToolbarPreparing = (e) => {
    let toolbarItems = e.toolbarOptions.items;

    toolbarItems.forEach((item) => {
      switch (item.name) {
        case "refreshRowButton" :
          item.showText = "always";
          item.location = "after";
          item.widget = "dxButton";
          item.options = {
            icon: "refresh",
            text: translate('cancerLibraryApp.category.home.refreshListLabel'),
            onClick : onRefreshButtonClick
          }
          break;
        case "addRowButton" :
          item.showText = "always";
          item.location = "after";
          item.widget = "dxButton";
          item.options = {
            icon: "add",
            text: "Add",
            elementAttr: {
              class: "me-2"
            },
            onClick: () => {
              e.component.addRow()
            }
          }
      }
    });
  }

  const columnRenderEvent = (column, index) => {
    return <Column
      dataField={column['dataField']}
      dataType={column['dataType']}
      caption={column['translate'] ? translate(column['translate']) : column['caption']}
      visible={column['visible']}
      format={column['format']}
      width={column['width']}
      alignment={column['alignment']}
    />
  }

  const formRenderEvent = (form, index) => {
    let options : any = {}
    if( typeof form['editorOptions'] !== 'undefined') {
      options.displayExpr = form['editorOptions'].displayExpr;
      options.valueExpr = form['editorOptions'].valueExpr;
      options.datasource =  copiedItem;
    }

    return <ItemForm
      dataField={form['itemField']}
      caption={form['translate'] ? translate(form['translate']) : form['caption']}
      colSpan={form['colSpan']}
      colCount={form['colCount']}
      editorType={form['editorType']}
      editorOptions= {{
          "dataSource" : lookupDatasource,
          "displayExpr" : typeof form['editorOptions'] !== 'undefined' ? form['editorOptions'].displayExpr  : "" ,
          "valueExpr" : typeof form['editorOptions'] !== 'undefined' ? form['editorOptions'].valueExpr : "" ,
        }
      }
    />
  }

  const onSetupTitle = (e) => {
    e.component.option("editing.popup.title", translate(title))
  }

  return <DataGrid
    dataSource={copiedItem}
    keyExpr="id"
    showBorders={true}
    showColumnLines={true}
    onToolbarPreparing={onToolbarPreparing}
    onRowInserting={onRowInsert}
    onRowUpdating={onRowUpdate}
    onRowRemoving={onRowDelete}
    onEditingStart={onSetupTitle}
    onInitNewRow={onSetupTitle}
  >
    <Toolbar>
      <ItemToolBar location="before">
        <div className="informer">
          <h2 className="count">{count}</h2>
          <span>
                <Translate contentKey="global.table.header.total-count"> Total Count </Translate>
              </span>
        </div>
      </ItemToolBar>
      <ItemToolBar name="refreshRowButton"/>
      <ItemToolBar name="addRowButton" />
    </Toolbar>
    <Paging enabled={true} pageSize={pageSize} defaultPageSize={defaultPageSize} />
    <SearchPanel visible={true} />
    <FilterRow visible={true} />
    <LoadPanel enabled={true} />
    <Editing
      mode="popup"
      allowAdding={true}
      allowUpdating={true}
      allowDeleting={true}
    >
      <Popup showTitle={true} width={700} height={525} hideOnOutsideClick={true}/>
      <Form>
        {
          forms.map((form, index) => {
            if ( typeof form['itemType'] !== 'undefined' && form['itemType'] === 'group') {
              return <ItemForm itemType={form['itemType']} colCount={form['colCount']} colSpan={form['colSpan']} >
                {
                  form.child.map((item, index) => {
                    return formRenderEvent(item, index);
                  })
                }
              </ItemForm>
            } else {
                return formRenderEvent(form, index);
            }
          })
        }
      </Form>
    </Editing>
    {
      columns.map((column, index) => {
        if (typeof column.child === 'undefined' || column.length === 0) {
          return columnRenderEvent(column, index);
        } else {
          return <Column caption={column['translate'] ? translate(column['translate']) : column['caption']}
                         alignment={column['alignment']}
          >
            {
              column.child.map((item, index) => {
                return columnRenderEvent(item, index);
              })
            }
          </Column>
        }
      })
    }
  </DataGrid>
}
