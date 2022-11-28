import React from 'react';
import DataGrid, {Column, RowDragging,} from 'devextreme-react/data-grid';
import {IRootState} from "app/config/store";
import {connect} from 'react-redux';
import {setPatients} from "app/modules/user-patient-dnd-grid/user-patient-dnd-grid.reducer";

interface IGridProps extends StateProps, DispatchProps {
  selectedRowKeys: {
    'false': any[],
    'true': any[]
  };
  setSelectedRowKeys: (selectedRowKeys: any) => void;
  authorized: boolean;
}

export class DndGrid extends React.Component<IGridProps> {
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

    const result = JSON.parse(JSON.stringify(this.props.patients)).map((item) => {
      if (item.ptNo === e.itemData.ptNo) {
        item.authorized = e.toData;
      }
      if (selectedRowKeys[`${!e.toData}`].includes(item.ptNo)) {
        item.authorized = e.toData;
      }
      return item;
    });
    this.props.setPatients(result);

    this.props.setSelectedRowKeys({
      'false': [],
      'true': [],
    });
    this.dataGrid.instance.clearSelection();
  }

  onSelectionChanged({selectedRowKeys}) {
    this.props.setSelectedRowKeys({
      [`${this.props.authorized}`]: selectedRowKeys,
      [`${!this.props.authorized}`]: [],
    });
  }

  render() {
    const {loading} = this.props;

    return (
      <div>
        <DataGrid
          ref={(ref) => {
            this.dataGrid = ref;
          }}
          dataSource={this.props.patients}
          height={'62vh'}
          showBorders={true}
          filterRow={{visible: true}}
          headerFilter={{visible: true}}
          allowColumnResizing={true}
          filterValue={this.filterExpr}
          selection={{mode: 'multiple', selectAllMode: 'page'}}
          defaultPaging={{pageSize: 10}}
          pager={{visible: true, showPageSizeSelector: true, allowedPageSizes: [5, 10, 15, 20, 25, 30, 50, 100]}}
          keyExpr="ptNo"
          // selectedRowKeys={this.props.selectedRowKeys[`${this.props.authorized}`]}
          onSelectionChanged={this.onSelectionChanged}
          loadPanel={{enabled: !loading}}
          summary={{
            totalItems: [{
              column: 'ptNo',
              displayFormat: `갯수: {0}`,
              summaryType: 'count',
            }],
          }}
        >
          <RowDragging data={this.props.authorized} group="tasksGroup" onAdd={this.onAdd}/>
          <Column dataField="ptNo" dataType="string" caption="환자번호" alignment={'center'}/>
          <Column dataField="ptNm" dataType="string" caption="환자명" alignment={'center'}/>
          <Column dataField="authorized" dataType="boolean" visible={false}/>
        </DataGrid>
      </div>
    );
  }
}

const mapStateToProps = ({userPatientDndGrid}: IRootState) => ({
  loading: userPatientDndGrid.loading,
  patients: userPatientDndGrid.patients,
});

const mapDispatchToProps = {
  setPatients
}

type StateProps = ReturnType<typeof mapStateToProps>;
type DispatchProps = typeof mapDispatchToProps;

export default connect(mapStateToProps, mapDispatchToProps)(DndGrid);
