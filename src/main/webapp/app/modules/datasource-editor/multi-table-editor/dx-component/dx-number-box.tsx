import React from "react";
import NumberBox from 'devextreme-react/number-box';
import {IRootState} from "app/config/store";
import {connect} from 'react-redux';
import DxRowCommentBox, {
  getDxCellClass
} from "app/modules/datasource-editor/multi-table-editor/dx-component/dx-row-comment-box";
import {isValid} from "app/modules/datasource-editor/multi-table-editor/dx-component/dx-component.utils";


interface IDxEditCellRenderProps extends StateProps, DispatchProps {
  data: any;
}

const DxTextBox = (props: IDxEditCellRenderProps) => {
  const {data, originRow, validationFailedItems} = props;

  const onValueChanged = (e) => {
    props.data.setValue(e.value);
  }

  return <div>
    <NumberBox className={getDxCellClass(data, originRow, isValid(validationFailedItems, data.column.name))}
               isValid={isValid(validationFailedItems, data.column.name)}
               defaultValue={props.data.value}
               onValueChanged={onValueChanged}
               disabled={!props.data.column.allowEditing}
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

export default connect(mapStateToProps, mapDispatchToProps)(DxTextBox);

