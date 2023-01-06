import React from 'react';

import DataGrid, {Column, Paging, SearchPanel,} from 'devextreme-react/data-grid';
import {useAppSelector} from "app/config/store";
import {translate} from "react-jhipster";
import {getIndexColumnTemplate} from "app/shared/util/dx-utils";


const ReviewStatisticsDatagrid = () => {
  const entities = useAppSelector(state => state.reviewerStatistics.entities);

  const getRatioOfField = (rowData: any, field: string) => {
    const parent = rowData.submitted + rowData.approved + rowData.declined;

    if (parent === 0) {
      return '-';
    }

    return ((rowData[field] / parent) * 100).toFixed(2) + '%'
  }

  const getRatioOfTotal = (rowData: any, field: string) => {
    if (rowData.assigned === 0) {
      return '-';
    }
    return (rowData[field] / rowData.assigned * 100).toFixed(2) + '%'
  }

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
      <Column caption={'#'} cellTemplate={getIndexColumnTemplate} alignment={'center'} width={50}/>
      <Column dataField="name" dataType="text" alignment="center"
              caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.name')}/>
      <Column dataField="login" dataType="text" alignment="center"
              caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.login')}/>
      <Column dataField="assigned" dataType="string" alignment="center"
              caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.assigned')}/>
      <Column dataField="login"
              sortIndex={0}
              sortOrder="desc"
              calculateCellValue={rowData => rowData.submitted + rowData.approved + rowData.declined}
              caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.total')}
              alignment="center"/>
      <Column alignment="center" caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.status.title')}>
        <Column dataField="submitted" dataType="string" alignment="center"
                caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.status.submitted')}/>
        <Column dataField="approved" dataType="string" alignment="center"
                caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.status.approved')}/>
        <Column dataField="declined" dataType="string" alignment="center"
                caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.status.declined')}/>
      </Column>
      <Column alignment="center"
              caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.percent.title')}>
        <Column dataField="submitted" dataType="string" alignment="center"
                calculateCellValue={rowData => getRatioOfField(rowData, 'submitted')}
                caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.percent.submitted')}/>
        <Column dataField="approved" dataType="string" alignment="center"
                calculateCellValue={rowData => getRatioOfField(rowData, 'approved')}
                caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.percent.approved')}/>
        <Column dataField="declined" dataType="string" alignment="center"
                calculateCellValue={rowData => getRatioOfField(rowData, 'declined')}
                caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.percent.declined')}/>
      </Column>
      <Column alignment="center"
              caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.totalRatio.title')}>
        <Column dataField="submitted" dataType="string" alignment="center"
                calculateCellValue={rowData => getRatioOfTotal(rowData, 'totalSubmitted')}
                caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.totalRatio.submitted')}
        />
        <Column dataField="approved" dataType="string" alignment="center"
                calculateCellValue={rowData => getRatioOfTotal(rowData, 'totalApproved')}
                caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.totalRatio.approved')}/>
      </Column>
      <Paging defaultPageSize={10}/>
    </DataGrid>);
}
export default ReviewStatisticsDatagrid;
