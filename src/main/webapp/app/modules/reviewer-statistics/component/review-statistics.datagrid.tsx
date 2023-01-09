import React from 'react';

import DataGrid, {Column, Paging, SearchPanel,} from 'devextreme-react/data-grid';
import {useAppSelector} from "app/config/store";
import {translate} from "react-jhipster";
import {getIndexColumnTemplate} from "app/shared/util/dx-utils";
import moment from "moment";

interface IReviewStatisticsDatagridProps {
  dateRange: any;
}

const ReviewStatisticsDatagrid = (props: IReviewStatisticsDatagridProps) => {
  const {dateRange} = props;
  const entities = useAppSelector(state => state.reviewerStatistics.entities);

  const getRatioOfTerm = (rowData: any, field: string) => {
    const parent = rowData.submitted + rowData.approved + rowData.declined;

    if (parent === 0) {
      return '-';
    }

    return `${rowData[field]}
    <br/>
    (${((rowData[field] / parent) * 100).toFixed(2) + '%'})`
  }

  const getRatioOfTotal = (rowData: any, field: string) => {
    if (rowData.assigned === 0) {
      return '-';
    }
    return `${rowData[field]}
    <br/>
    (${((rowData[field] / rowData.assigned) * 100).toFixed(2) + '%'})`
  }

  const getFormattedDateRange = () => {
    return `${moment(dateRange.startDate).format('YYYY/MM/DD')} - ${moment(dateRange.endDate).format('YYYY/MM/DD')}`
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
      <Column dataField="login"
              sortIndex={0}
              sortOrder="desc"
              calculateCellValue={rowData => rowData.submitted + rowData.approved + rowData.declined}
              caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.total')}
              alignment="center"/>
      <Column alignment="center" caption={getFormattedDateRange()}>
        <Column dataField="submitted" dataType="string" alignment="center"
                caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.status.submitted')}
                encodeHtml={false}
                calculateCellValue={rowData => getRatioOfTerm(rowData, 'submitted')}
        />
        <Column dataField="approved" dataType="string" alignment="center"
                caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.status.approved')}
                encodeHtml={false}
                calculateCellValue={rowData => getRatioOfTerm(rowData, 'approved')}
        />
        <Column dataField="declined" dataType="string" alignment="center"
                caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.status.declined')}
                encodeHtml={false}
                calculateCellValue={rowData => getRatioOfTerm(rowData, 'declined')}
        />
      </Column>
      <Column dataField="assigned" dataType="string" alignment="center"
              caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.assigned')}/>
      <Column alignment="center"
              caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.totalCount')}>
        <Column dataField="submitted" dataType="string" alignment="center"
                caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.status.submitted')}
                encodeHtml={false}
                calculateCellValue={rowData => getRatioOfTotal(rowData, 'totalSubmitted')}
        />
        <Column dataField="approved" dataType="string" alignment="center"
                caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.status.approved')}
                encodeHtml={false}
                calculateCellValue={rowData => getRatioOfTotal(rowData, 'totalApproved')}
        />
        <Column dataField="declined" dataType="string" alignment="center"
                caption={translate('cancerLibraryApp.reviewerStatistics.dataGrid.status.declined')}
                encodeHtml={false}
                calculateCellValue={rowData => getRatioOfTotal(rowData, 'totalDeclined')}
        />
      </Column>
      <Paging defaultPageSize={10}/>
    </DataGrid>);
}
export default ReviewStatisticsDatagrid;
