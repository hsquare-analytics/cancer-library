import React from 'react';

import DataGrid, {Column, Paging, SearchPanel,} from 'devextreme-react/data-grid';
import {useAppSelector} from "app/config/store";
import {translate} from "react-jhipster";


const ReviewStatisticsDatagrid = () => {
  const entities = useAppSelector(state => state.reviewerStatistics.entities);
  return (
    <DataGrid
      dataSource={entities}
      allowColumnReordering={true}
      rowAlternationEnabled={true}
      showBorders={true}
      searchPanel={{visible: false}}
      allowColumnResizing={true}
    >
      <SearchPanel visible={true} highlightCaseSensitive={true}/>
      <Column dataField="login" dataType="text" alignment="center"/>
      <Column dataField="name" dataType="text" alignment="center"/>
      <Column dataField="assigned" dataType="string" alignment="center"/>
      <Column
        caption={translate('cancerLibraryApp.userPatientDndGrid.column.totalSubmitted')}
        calculateCellValue={rowData => rowData.submitted + rowData.approved + rowData.declined}
        alignment="center"/>
      <Column caption={"count"}>
        <Column dataField="submitted" dataType="string" alignment="center"/>
        <Column dataField="declined" dataType="string" alignment="center"/>
        <Column dataField="approved" dataType="string" alignment="center"/>
      </Column>
      <Column caption={"%"}>
        <Column dataField="submitted" dataType="string" alignment="center"/>
        <Column dataField="declined" dataType="string" alignment="center"/>
        <Column dataField="approved" dataType="string" alignment="center"/>
      </Column>
      <Column caption={"% per total patient"}>
        <Column dataField="noaction" dataType="string" alignment="center"/>
        <Column dataField="declined" dataType="string" alignment="center"/>
      </Column>
      <Paging defaultPageSize={10}/>
    </DataGrid>);
};

export default ReviewStatisticsDatagrid;
