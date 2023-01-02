import moment from 'moment';
import _ from 'lodash';

export const isValid = (items: any[], columnName: string) => {
  return !items.find(item => item.title.toLowerCase() === columnName.toLowerCase());
}

export const isEmpty = (element): boolean => {
  if (element instanceof Array) {
    return element.length === 0;
  } else {
    return Object.keys(element).length === 0;
  }
}

export const isChangedCell = (data, originRow) => {
  if (isEmpty(data) || isEmpty(originRow)) {
    return false;
  }

  const type = data.column.dataType;

  const a = data.value;
  const b = originRow[data.column.dataField];

  const isEmptyString = (str) => {
    if (str === 'null' || str === 'undefined') {
      return true;
    }
    return !str?.toString().length;
  }

  if (isEmptyString(a) && isEmptyString(b)) {
    return false;
  }

  if (type === 'selectbox') {
    return a !== b;
  }

  switch (type) {
    case 'date':
      return moment(a).format('YYYY-MM-DD') !== moment(b).format('YYYY-MM-DD');
    case 'datetime':
      return moment(a).format('YYYY-MM-DD HH:mm:ss') !== moment(b).format('YYYY-MM-DD HH:mm:ss');
    case 'time':
      return moment(a).format('HH:mm:ss') !== moment(b).format('HH:mm:ss');
    case 'number':
      return parseFloat(a) !== parseFloat(b);
    default:
      return a !== b;
  }
}

export const getFormattedValue = (props: { value: any, type: any, format: any }) => {
  const {value, type, format} = props;
  switch (type) {
    case 'date':
      if (Date.parse(value)) {
        return moment(value).format('yyyy/MM/DD');
      }
      return value;
    case 'datetime':
      if (Date.parse(value)) {
        return moment(value).format('yyyy/MM/DD HH:mm:ss');
      }
      return value;
    case 'time':
      if (Date.parse(value)) {
        return moment(value).format('HH:mm:ss');
      }
      return value;
    default:
      return value;
  }

}


export const getDxCellClass = (data, originRow, isValidColumn: boolean) => {
  if (!isValidColumn) {
    return "border border-danger"
  }

  if (isChangedCell(data, originRow)) {
    return "border border-info"
  }
}
