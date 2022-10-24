import React from "react";
import moment from 'moment/moment';

export const isDxCellChanged = (data, row) => {
  const type = data.column.dataType;

  const a = data.value;
  const b = row[data.column.dataField];

  switch (type) {
    case 'date':
      return moment(a).format('YYYY-MM-DD') !== moment(b).format('YYYY-MM-DD');
    case 'datetime':
      return moment(a).format('YYYY-MM-DD HH:mm:ss') !== moment(b).format('YYYY-MM-DD HH:mm:ss');
    case 'number':
      return parseFloat(a) !== parseFloat(b);
    default:
      return a !== b;
  }
}

export const isNotDxCellChanged = (data, row) => {
  return !isDxCellChanged(data, row);
};


export const getDxCellClass = (data, originRow) => {
  if (isNotEmpty(originRow) && isDxCellChanged(data, originRow)) {
    return "border border-info"
  }
}

const isEmpty = (element): boolean => {
  if (element instanceof Array) {
    return element.length === 0;
  } else {
    return Object.keys(element).length === 0;
  }
}

const isNotEmpty = (element): boolean => {
  return !isEmpty(element);
}

interface IDxRowCommentBoxProps {
  data: any;
  row: any;
}

const DxRowCommentBox = (props: IDxRowCommentBoxProps) => {
  const {data, row} = props;

  if (isEmpty(row) || isNotDxCellChanged(data, row)) {
    return null;
  }

  return <div>
    <div className="text-underline p-1">최초: {row[data.column.dataField]}</div>
  </div>;
}

export default DxRowCommentBox;
