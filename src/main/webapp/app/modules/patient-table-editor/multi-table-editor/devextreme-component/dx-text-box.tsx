import React from "react";
import TextBox from 'devextreme-react/text-box';
import {IRootState} from "app/config/store";
import {connect} from 'react-redux';


interface IDxEditCellRenderProps extends StateProps, DispatchProps {
  data: any;
}

const DxTextBox = (props: IDxEditCellRenderProps) => {
  const {row} = props;

  const onValueChanged = (e) => {
    props.data.setValue(e.value);
  }

  return <div>
    <TextBox className={"border border-info"} defaultValue={props.data.value} onValueChanged={onValueChanged}
             disabled={!props.data.column.allowEditing}
    />
    <div className={"text-decoration-line-through p-1"}>{JSON.stringify(row[props.data.column.dataField])}</div>
  </div>
}

const mapStateToProps = ({patientTableOrigin}: IRootState) => ({
  row: patientTableOrigin.row,
});

const mapDispatchToProps = {}

type StateProps = ReturnType<typeof mapStateToProps>;
type DispatchProps = typeof mapDispatchToProps;

export default connect(mapStateToProps, mapDispatchToProps)(DxTextBox);

