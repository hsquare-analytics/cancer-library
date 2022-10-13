export const getIndexColumnTemplate = (cellElement, cellInfo) => {
  const component = cellInfo.component;
  cellElement.innerText = cellInfo.row.rowIndex + component.pageIndex() * component.pageSize() + 1;
};
