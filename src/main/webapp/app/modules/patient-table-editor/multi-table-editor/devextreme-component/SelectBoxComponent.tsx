import React from 'react';
import SelectBox from 'devextreme-react/select-box';


export interface ISelectBoxComponent {
  data: any;
}

export default class SelectBoxComponent extends React.Component<ISelectBoxComponent> {
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
    return <SelectBox
      dataSource={this.props.data.column.lookup.dataSource}
      valueExpr={this.props.data.column.lookup.valueExpr}
      displayExpr={this.props.data.column.lookup.displayExpr}
      showSelectionControls={true}
      applyValueMode="useButtons"
      searchEnabled={true}
      defaultValue={this.props.data.value}
      onValueChanged={this.onValueChanged}
      onSelectionChanged={this.onSelectionChanged}
    />;
  }
}
