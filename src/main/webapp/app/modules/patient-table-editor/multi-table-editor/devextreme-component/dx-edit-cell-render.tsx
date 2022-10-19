import React from "react";
import TextBox from 'devextreme-react/text-box';

interface IDxEditCellRenderProps {
  value: any;
}

const DxEditCellRender = (props: IDxEditCellRenderProps) => {
  const onValueChanged = (cell, e) => {
    cell.setValue(e.value);
  }

  return <TextBox className={"border border-info"} defaultValue={props.value}/>;
}

export default DxEditCellRender;
