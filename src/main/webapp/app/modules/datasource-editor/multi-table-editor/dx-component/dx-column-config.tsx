import SelectBoxComponent from "app/modules/datasource-editor/multi-table-editor/dx-component/dx-select-box";
import DxTagBox from "app/modules/datasource-editor/multi-table-editor/dx-component/dx-tag-box";
import {IItem} from "app/shared/model/item.model";
import {Column, Lookup} from 'devextreme-react/data-grid';
import React from 'react';
import DxTextBox from "app/modules/datasource-editor/multi-table-editor/dx-component/dx-text-box";
import DxNumberBox from "app/modules/datasource-editor/multi-table-editor/dx-component/dx-number-box";
import DxDateBox from "app/modules/datasource-editor/multi-table-editor/dx-component/dx-date-box";

const getDxEditCellComponent = (item: IItem) => {
  if (!item.attribute.dataType) {
    return DxTextBox;
  }

  switch (item.attribute?.dataType.toLowerCase()) {
    case 'tagbox':
      return DxTagBox;
    case 'selectbox':
      if (!canBeLookup(item)) {
        return undefined;
      }

      return SelectBoxComponent;
    case 'string':
      return DxTextBox;
    case 'number':
      return DxNumberBox;
    case 'date':
    case 'datetime':
      return DxDateBox;
    default:
      return DxTextBox;
  }
}

const getDxLookupComponent = (item: IItem) => {
  if (!item.attribute.dataType) {
    return undefined;
  }

  switch (item.attribute?.dataType.toLowerCase()) {
    case 'tagbox':
    case 'selectbox':
      if (!canBeLookup(item)) {
        return undefined;
      }

      return <Lookup
        dataSource={item.codebook.lookupList.filter(data => data).map(data => new Object({
          "codebookId": item.codebook.id,
          "title": data.title,
          "description": data.description,
          "label": data.title + " (value: " + data.description + ")",
        }))}
        displayExpr={"label"} valueExpr={"description"}/>;
    default:
      return undefined;
  }
}

const canBeLookup = (item: IItem) => {
  return item.codebook && item.codebook.lookupList && item.codebook.lookupList.length > 0;
}

export const getDxColumnConfig = (item: IItem) => {
  return <Column
    key={item.id}
    dataField={item.title.toLowerCase()}
    visibleIndex={item.orderNo}
    caption={item.attribute?.caption}
    format={item.attribute?.format}
    dataType={item.attribute?.dataType}
    allowEditing={item.property?.allowEditing}
    visible={item.property?.visible}
    alignment={'center'}
    editCellComponent={getDxEditCellComponent(item)}
    formItem={{
      visible: item.property?.visible,
      visibleIndex: item.orderNo,
    }}
  >
    {getDxLookupComponent(item)}
  </Column>
}
