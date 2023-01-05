import React from 'react';

import DataGrid, {
  Column,
  Grouping,
  GroupPanel,
  Pager,
  Paging,
  SearchPanel,
} from 'devextreme-react/data-grid';

const ReviewStatisticsDatagrid = () => {
  return (
    <DataGrid
      dataSource={[]}
      allowColumnReordering={true}
      rowAlternationEnabled={true}
      showBorders={true}
    >
      <SearchPanel visible={true} highlightCaseSensitive={true}/>
      <Column dataField="id" dataType="text"/>
      <Column dataField="name" dataType="text"/>
      <Column dataField="total_patient" dataType="string"/>
      <Column caption={"count"}>
        <Column dataField="noaction" dataType="string"/>
        <Column dataField="declined" dataType="string"/>
        <Column dataField="approved" dataType="string"/>
      </Column>
      <Column caption={"%"}>
        <Column dataField="noaction" dataType="string"/>
        <Column dataField="declined" dataType="string"/>
        <Column dataField="approved" dataType="string"/>
      </Column>
      <Column caption={"% per total patient"}>
        <Column dataField="noaction" dataType="string"/>
        <Column dataField="declined" dataType="string"/>
      </Column>
      <Paging defaultPageSize={10}/>
    </DataGrid>);
};

export default ReviewStatisticsDatagrid;
