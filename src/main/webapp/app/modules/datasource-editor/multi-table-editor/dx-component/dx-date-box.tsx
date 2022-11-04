import React from "react";
import DateBox from 'devextreme-react/date-box';
import {IRootState} from "app/config/store";
import {connect} from 'react-redux';
import DxRowCommentBox from "app/modules/datasource-editor/multi-table-editor/dx-component/dx-row-comment-box";
import {
  getDxCellClass,
  isValid
} from "app/modules/datasource-editor/multi-table-editor/dx-component/dx-component.utils";


interface IDxEditCellRenderProps extends StateProps, DispatchProps {
  data: any;
}

const DxDateBox = (props: IDxEditCellRenderProps) => {
  const {data, originRow, validationFailedItems} = props;

  const onValueChanged = (e) => {
    props.data.setValue(e.value);
  }

  return <div>
    <DateBox className={getDxCellClass(data, originRow, isValid(validationFailedItems, data.column.name))}
             isValid={isValid(validationFailedItems, data.column.name)}
             defaultValue={props.data.value}
             onValueChanged={onValueChanged}
             type={props.data.column.dataType}
             disabled={!props.data.column.allowEditing}
             displayFormat={props.data.column.format}
    />
    <DxRowCommentBox data={Object.assign({}, data)}/>
  </div>
}

const mapStateToProps = ({datasourceStatus}: IRootState) => ({
  originRow: datasourceStatus.originRow,
  validationFailedItems: datasourceStatus.validationFailedItems
});

const mapDispatchToProps = {}

type StateProps = ReturnType<typeof mapStateToProps>;
type DispatchProps = typeof mapDispatchToProps;

export default connect(mapStateToProps, mapDispatchToProps)(DxDateBox);

