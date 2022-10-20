import SelectBoxComponent from "app/modules/patient-table-editor/multi-table-editor/devextreme-component/dx-select-box";
import DxTagBox from "app/modules/patient-table-editor/multi-table-editor/devextreme-component/dx-tag-box";
import {IItem} from "app/shared/model/item.model";
import {Column, Lookup} from 'devextreme-react/data-grid';
import React from 'react';
import DxTextBox from "app/modules/patient-table-editor/multi-table-editor/devextreme-component/dx-text-box";
import DxNumberBox from "app/modules/patient-table-editor/multi-table-editor/devextreme-component/dx-number-box";
import DxDateBox from "app/modules/patient-table-editor/multi-table-editor/devextreme-component/dx-date-box";


const getDxEditCellComponent = (item: IItem) => {
  switch (item.attribute?.dataType.toLowerCase()) {
    case 'tagbox':
      return DxTagBox;
    case 'selectbox':
      return SelectBoxComponent;
    case 'string':
      return DxTextBox;
    case 'number':
      return DxNumberBox;
    case 'date':
    case 'datetime':
      return DxDateBox;
    default:
      return undefined;
  }
}

const getDxLookupComponent = (item: IItem) => {
  switch (item.attribute?.dataType.toLowerCase()) {
    case 'tagbox':
    case 'selectbox':
      return <Lookup
        dataSource={item.lookup.filter(data => data).map(data => new Object({"itemId": item.id, "title": data}))}
        displayExpr={"title"} valueExpr={"title"}/>;
    default:
      return undefined;
  }
}


export const getDxColumnConfig = (item: IItem) => {
  return <Column
    key={item.id}
    dataField={item.title.toLowerCase()}
    dataType={item.attribute?.dataType}
    caption={item.property?.caption}
    visibleIndex={item.property?.visibleIndex}
    visible={item.activated}
    allowEditing={item.property?.allowEditing}
    alignment={'center'}
    editCellComponent={getDxEditCellComponent(item)}
  >
    {getDxLookupComponent(item)}
  </Column>
}
