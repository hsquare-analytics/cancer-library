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
      <Column dataField="login" dataType="text" alignment="center"
              caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.login')}/>
      <Column dataField="name" dataType="text" alignment="center"
              caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.name')}/>
      <Column dataField="assigned" dataType="string" alignment="center"
              caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.assigned')}/>
      <Column calculateCellValue={rowData => rowData.submitted + rowData.approved + rowData.declined}
              caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.total')}
              alignment="center"/>
      <Column alignment="center" caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.count.title')}>
        <Column dataField="submitted" dataType="string" alignment="center"
                caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.count.submitted')}/>
        <Column dataField="declined" dataType="string" alignment="center"
                caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.count.declined')}/>
        <Column dataField="approved" dataType="string" alignment="center"
                caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.count.approved')}/>
      </Column>
      <Column alignment="center"
              caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.percent.title')}>
        <Column dataField="submitted" dataType="string" alignment="center"
                caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.percent.submitted')}/>
        <Column dataField="declined" dataType="string" alignment="center"
                caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.percent.declined')}/>
        <Column dataField="approved" dataType="string" alignment="center"
                caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.percent.approved')}/>
      </Column>
      <Column alignment="center"
              caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.totalRatio.title')}>
        <Column dataField="submitted" dataType="string" alignment="center"
                caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.totalRatio.submitted')}/>
        <Column dataField="approved" dataType="string" alignment="center"
                caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.totalRatio.approved')}/>
      </Column>
      <Paging defaultPageSize={10}/>
    </DataGrid>);
};

export default ReviewStatisticsDatagrid;
