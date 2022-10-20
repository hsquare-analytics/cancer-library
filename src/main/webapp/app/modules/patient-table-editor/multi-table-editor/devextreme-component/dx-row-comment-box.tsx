import React from "react";

export const isDxCellChanged = (data, row) => {
  return data.value !== row[data.column.dataField];
}

export const getDxCellClass = (data, row) => {
  if (isDxCellChanged(data, row)) {
    return "border border-info"
  }
}

interface IDxRowCommentBoxProps {
  data: any;
  row: any;
}

const DxRowCommentBox = (props: IDxRowCommentBoxProps) => {
  const {data, row} = props;

  const onValueChanged = (e) => {
    data.setValue(e.value);
  }

  if (!isDxCellChanged(data, row)) {
    return null;
  }

  return <div>
    <div className="text-decoration-line-through p-1">{JSON.stringify(row[data.column.dataField])}</div>
  </div>
}

export default DxRowCommentBox;
