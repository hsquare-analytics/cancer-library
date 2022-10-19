import React, {useState} from 'react';
import SelectBox from 'devextreme-react/select-box';
import {IRootState} from "app/config/store";
import {connect} from 'react-redux';
import LookupEditor
  from "app/modules/patient-table-editor/multi-table-editor/devextreme-component/lookup-editor/lookup-editor";

interface ISelectBoxComponentProps extends StateProps, DispatchProps {
  data: any;
}

const DxSelectBox = (props: ISelectBoxComponentProps) => {
  const [isSelectBoxOpened, setIsSelectBoxOpened] = useState<boolean>(false);
  const [showLookup, setShowLookup] = useState(false);

  const {data} = props;


  const onValueChanged = (e) => {
    props.data.setValue(e.value);
  }

  const onSelectionChanged = () => {
    props.data.component.updateDimensions();
  }

  const onOptionChanged = (e) => {
    if (e.name === 'opened') {
      setIsSelectBoxOpened(e.value);
    }
  }

  return (
    <div>
      <LookupEditor visible={showLookup} setVisible={setShowLookup} dataSource={data.column.lookup.dataSource}/>
      <SelectBox
        dataSource={data.column.lookup.dataSource}
        valueExpr={data.column.lookup.valueExpr}
        displayExpr={data.column.lookup.displayExpr}
        showSelectionControls={true}
        applyValueMode="useButtons"
        searchEnabled={true}
        defaultValue={data.value}
        onValueChanged={onValueChanged}
        onSelectionChanged={onSelectionChanged}
        onOptionChanged={onOptionChanged}
        buttons={isSelectBoxOpened ? [
          {
            name: 'add',
            location: 'before',
            options: {
              icon: 'preferences',
              onClick: () => setShowLookup(true)
            },
          }] : null}
      >

      </SelectBox>
    </div>);
}

const mapStateToProps = ({authentication}: IRootState) => ({});

const mapDispatchToProps = {}

type StateProps = ReturnType<typeof mapStateToProps>;
type DispatchProps = typeof mapDispatchToProps;

export default connect(mapStateToProps, mapDispatchToProps)(DxSelectBox);
