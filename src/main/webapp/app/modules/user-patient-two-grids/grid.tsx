import React from 'react';
import DataGrid, {Column, RowDragging, Scrolling,} from 'devextreme-react/data-grid';

interface IGridState {
  selectedRowKeys: any[];
}

interface IGridProps {
  selectedRowKeys: {
    'left': any[],
    'right': any[]
  };
  setSelectedRowKeys: Function;
  dataSource: any[];
  authorized: boolean;
  setDataSource: Function;
}

class Grid extends React.Component<IGridProps, IGridState> {
  private filterExpr: (string | any)[];
  private dataGrid: any;

  constructor(props) {
    super(props);
    this.dataGrid = null;

    this.filterExpr = ['authorized', '=', this.props.authorized];
    this.onAdd = this.onAdd.bind(this);

    this.onSelectionChanged = this.onSelectionChanged.bind(this);
  }

  onAdd(e) {
    const key = e.itemData.ptNo;
    const selectedRowKeys = this.props.selectedRowKeys;
    if (e.toData === true) {
      const result = this.props.dataSource.map((item) => {
        if (item.ptNo === key) {
          item.authorized = true;
        }
        if (selectedRowKeys['left'].includes(item.ptNo)) {
          item.authorized = true;
        }
        return item;
      });
      this.props.setDataSource(result);
    } else {
      const result = this.props.dataSource.map((item) => {
        if (item.ptNo === key) {
          item.authorized = false;
        }
        if (selectedRowKeys['right'].includes(item.ptNo)) {
          item.authorized = false;
        }
        return item;
      });
      this.props.setSelectedRowKeys({
        'left': [],
        'right': []
      });
      this.props.setDataSource(result);
    }
  }

  renewDataSource(e) {
    const selectedRowKeys = this.props.selectedRowKeys;

    const result = this.props.dataSource.map((item) => {
      if (item.ptNo === e.itemData.ptNo) {
        item.authorized = e.toData;
      }
      if (selectedRowKeys[e.toData].includes(item.ptNo)) {
        item.authorized = e.toData;
      }
      return item;
    });
    this.props.setDataSource(result);
    return result;
  }

  onSelectionChanged({selectedRowKeys}) {
    this.props.setSelectedRowKeys({
      ...this.props.selectedRowKeys,
      [this.props.authorized ? 'right' : 'left']: selectedRowKeys,
    });

  }


  render() {
    return (
      <div>
        {JSON.stringify(this.props.selectedRowKeys)}
        <DataGrid
          ref={(ref) => {
            this.dataGrid = ref;
          }}
          dataSource={this.props.dataSource}
          height={'80vh'}
          showBorders={true}
          filterValue={this.filterExpr}
          selection={{mode: 'multiple', selectAllMode: 'allPages'}}
          keyExpr="ptNo"
          onSelectionChanged={this.onSelectionChanged}
        >
          <RowDragging
            data={this.props.authorized}
            group="tasksGroup"
            onAdd={this.onAdd}
          />
          <Scrolling mode="virtual"/>
          <Column
            dataField="ptNo"
            dataType="string"
            caption="환자번호"
            alignment={'center'}
          />
          <Column
            dataField="ptNm"
            dataType="string"
            caption="환자명"
            alignment={'center'}
          />
          <Column
            dataField="authorized"
            dataType="boolean"
            visible={false}
          />
        </DataGrid>
      </div>
    );
  }
}

export default Grid;
