import React from 'react';
import DataGrid, {Column, RowDragging, Scrolling,} from 'devextreme-react/data-grid';

interface IGridState {
  selectedRowKeys: any[];
}

interface IGridProps {
  selectedRowKeys: {
    'false': any[],
    'true': any[]
  };
  setSelectedRowKeys: (selectedRowKeys: any) => void;
  dataSource: any[];
  authorized: boolean;
  setDataSource: (dataSource: any) => void;
}

class DndGrid extends React.Component<IGridProps, IGridState> {
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
    const selectedRowKeys = this.props.selectedRowKeys;

    const result = this.props.dataSource.map((item) => {
      if (item.ptNo === e.itemData.ptNo) {
        item.authorized = e.toData;
      }
      if (selectedRowKeys[`${!e.toData}`].includes(item.ptNo)) {
        item.authorized = e.toData;
      }
      return item;
    });
    this.props.setDataSource(result);

    const newSelectedRowKeys = {
      'false': [],
      'true': [],
    }
    this.props.setSelectedRowKeys(newSelectedRowKeys);
  }

  onSelectionChanged({selectedRowKeys}) {
    this.props.setSelectedRowKeys({
      ...this.props.selectedRowKeys,
      [`${this.props.authorized}`]: selectedRowKeys,
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
          height={'65vh'}
          showBorders={true}
          filterRow={{visible: true}}
          headerFilter={{visible: true}}
          allowColumnResizing={true}
          filterValue={this.filterExpr}
          scrolling={{mode: 'virtual'}}
          selection={{mode: 'multiple', selectAllMode: 'allPages'}}
          keyExpr="ptNo"
          // selectedRowKeys={this.props.selectedRowKeys[`${this.props.authorized}`]}
          onSelectionChanged={this.onSelectionChanged}
        >
          <RowDragging data={this.props.authorized} group="tasksGroup" onAdd={this.onAdd}/>
          <Scrolling mode="virtual"/>
          <Column dataField="ptNo" dataType="string" caption="환자번호" alignment={'center'}/>
          <Column dataField="ptNm" dataType="string" caption="환자명" alignment={'center'}/>
          <Column dataField="authorized" dataType="boolean" visible={false}/>
        </DataGrid>
      </div>
    );
  }
}

export default DndGrid;
