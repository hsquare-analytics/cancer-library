import React from "react";
import TextBox from 'devextreme-react/text-box';

interface IDxEditCellRenderProps {
  value: any;
  setValue: (value: any) => void;
}

const DxEditCellRender = (props: IDxEditCellRenderProps) => {
  const onValueChanged = (e) => {
    props.setValue(e.value);
  }

  return <div>
    <TextBox className={"border border-info"} defaultValue={props.value} onValueChanged={onValueChanged}/>
    <div className={"text-decoration-line-through p-1"}>test</div>
  </div>
}

export default DxEditCellRender;
