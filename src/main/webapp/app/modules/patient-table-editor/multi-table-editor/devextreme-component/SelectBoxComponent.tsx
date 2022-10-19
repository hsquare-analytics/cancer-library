import React from 'react';
import SelectBox from 'devextreme-react/select-box';
import {IRootState} from "app/config/store";
import {connect} from 'react-redux';

export interface ISelectBoxComponent extends StateProps, DispatchProps {
  data: any;
}

export class SelectBoxComponent extends React.Component<ISelectBoxComponent> {
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
    return (
      <div>
        <SelectBox
          dataSource={this.props.data.column.lookup.dataSource}
          valueExpr={this.props.data.column.lookup.valueExpr}
          displayExpr={this.props.data.column.lookup.displayExpr}
          showSelectionControls={true}
          applyValueMode="useButtons"
          searchEnabled={true}
          defaultValue={this.props.data.value}
          onValueChanged={this.onValueChanged}
          onSelectionChanged={this.onSelectionChanged}
          buttons={[
            {
              name: 'add',
              location: 'after',
              options: {
                text: 'add',
                icon: 'add',
                onClick() {
                },
              },
            }]}
        >

        </SelectBox>
      </div>);
  }
}

const mapStateToProps = ({authentication}: IRootState) => ({});

const mapDispatchToProps = {}

type StateProps = ReturnType<typeof mapStateToProps>;
type DispatchProps = typeof mapDispatchToProps;

export default connect(mapStateToProps, mapDispatchToProps)(SelectBoxComponent);
