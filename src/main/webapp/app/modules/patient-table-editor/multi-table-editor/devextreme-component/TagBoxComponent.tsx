import React from 'react';
import TagBox from 'devextreme-react/tag-box';

export interface ITagBoxComponent {
  data: any;
}

export default class TagBoxComponent extends React.Component<ITagBoxComponent> {
  constructor(props) {
    super(props);
    this.onValueChanged = this.onValueChanged.bind(this);
    this.onSelectionChanged = this.onSelectionChanged.bind(this);
  }

  onValueChanged(e) {
    this.props.data.setValue(e.value);
  }

  onSelectionChanged() {
    this.props.data.component.updateDimensions();
  }

  render() {
    return <TagBox
      dataSource={this.props.data.column.lookup.dataSource}
      valueExpr={this.props.data.column.lookup.valueExpr}
      displayExpr={this.props.data.column.lookup.displayExpr}
      showSelectionControls={true}
      maxDisplayedTags={3}
      showMultiTagOnly={false}
      applyValueMode="useButtons"
      searchEnabled={true}
      value={this.props.data.value}
      onValueChanged={this.onValueChanged}
      onSelectionChanged={this.onSelectionChanged}/>;
  }
}
