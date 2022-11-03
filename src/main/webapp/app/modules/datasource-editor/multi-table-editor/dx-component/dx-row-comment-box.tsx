import React from "react";
import moment from 'moment/moment';
import {IRootState} from "app/config/store";
import {connect} from 'react-redux';

export const isDxCellChanged = (data, row) => {
  const type = data.column.dataType;

  const a = data.value;
  const b = row[data.column.dataField];

  if (type === 'selectbox') {
    if (isNumeric(a) && isNumeric(b)) {
      return parseFloat(a) !== parseFloat(b);
    }
    return a !== b;
  }

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

const isNumeric = (str: string | number) => {
  if (typeof str === "number") return true;
  if (typeof str !== "string") return false // we only process strings!
  return !isNaN(parseFloat(str));
}

export const getDxCellClass = (data, originRow, isValid: boolean) => {
  if (!isValid) {
    return "border border-danger"
  }

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

  if (isNotEmpty(originRow) && isDxCellChanged(data, originRow)) {
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

