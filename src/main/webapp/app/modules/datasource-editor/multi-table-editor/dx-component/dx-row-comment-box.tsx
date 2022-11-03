import React from "react";
import {IRootState} from "app/config/store";
import {connect} from 'react-redux';
import {isDxCellChanged} from "app/modules/datasource-editor/multi-table-editor/dx-component/dx-component.utils";


interface IDxRowCommentBoxProps extends StateProps, DispatchProps {
  data: any;
}

const DxRowCommentBox = (props: IDxRowCommentBoxProps) => {
  const {data, originRow, validationFailedItems} = props;

  const errorItem = validationFailedItems.find(temp => temp.title.toLowerCase() === data.column.name.toLowerCase());

  if (errorItem) {
    return <div>
      <div className="text-underline text-danger p-1">* {errorItem.message}</div>
    </div>;
  }

  if (isDxCellChanged(data, originRow)) {
    return <div>
      <div className="text-underline p-1">최초: {originRow[data.column.dataField]}</div>
    </div>;
  }
}

const mapStateToProps = ({datasourceStatus}: IRootState) => ({
  originRow: datasourceStatus.originRow,
  validationFailedItems: datasourceStatus.validationFailedItems,
});


const mapDispatchToProps = {}

type StateProps = ReturnType<typeof mapStateToProps>;
type DispatchProps = typeof mapDispatchToProps;

export default connect(mapStateToProps, mapDispatchToProps)(DxRowCommentBox);

