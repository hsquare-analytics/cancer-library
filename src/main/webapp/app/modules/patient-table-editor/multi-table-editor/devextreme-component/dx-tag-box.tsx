import React from 'react';
import TagBox from 'devextreme-react/tag-box';

export interface ITagBoxComponentProps {
  data: any;
}

const DxTagBox = (props: ITagBoxComponentProps) => {
  const {data} = props;

  const onValueChanged = (e) => {
    data.setValue(e.value);
  }

  const onSelectionChanged = () => {
    props.data.component.updateDimensions();
  }

  return <TagBox
    dataSource={data.column.lookup.dataSource}
    valueExpr={data.column.lookup.valueExpr}
    displayExpr={data.column.lookup.displayExpr}
    showSelectionControls={true}
    maxDisplayedTags={3}
    showMultiTagOnly={false}
    applyValueMode="useButtons"
    searchEnabled={true}
    value={data.value}
    onValueChanged={onValueChanged}
    onSelectionChanged={onSelectionChanged}/>;
}

export default DxTagBox;
