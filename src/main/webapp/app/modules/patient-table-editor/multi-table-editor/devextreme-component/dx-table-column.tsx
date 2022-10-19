import React from 'react';
import {IItem} from "app/shared/model/item.model";
import TagBoxComponent from "app/modules/patient-table-editor/multi-table-editor/devextreme-component/TagBoxComponent";
import SelectBoxComponent
  from "app/modules/patient-table-editor/multi-table-editor/devextreme-component/select-box-component";
import {Column, Lookup} from 'devextreme-react/data-grid';

export interface IDxColumn {
  item: IItem;
}

const getDxEditCellComponent = (item: IItem) => {
  switch (item.attribute?.dataType.toLowerCase()) {
    case 'tagbox':
      return TagBoxComponent;
    case 'selectbox':
      return SelectBoxComponent;
    default:
      return undefined;
  }
}

const getDxLookupComponent = (item: IItem) => {
  if (item.attribute?.dataType.toLowerCase()) {
      return <Lookup dataSource={item.lookup.filter(data => data).map(data => new Object({"title": data}))}
                     displayExpr={"title"} valueExpr={"title"}/>;
  }
}

export const getDxTableColumn = (item: IItem) => {

  return <Column
    key={item.id}
    dataField={item.title.toLowerCase()}
    dataType={item.attribute?.dataType}
    caption={item.property?.caption}
    visibleIndex={item.property?.visibleIndex}
    alignment={'center'}
    editCellComponent={getDxEditCellComponent(item)}
  >
    {getDxLookupComponent(item)}
  </Column>
}
