import React, {useState} from 'react';
import SelectBox from 'devextreme-react/select-box';
import {IRootState} from "app/config/store";
import {connect} from 'react-redux';
import LookupEditor from "app/modules/patient-table-editor/multi-table-editor/devextreme-component/lookup-editor";

interface ISelectBoxComponentProps extends StateProps, DispatchProps {
  data: any;
}

const SelectBoxComponent = (props: ISelectBoxComponentProps) => {
  const [showLookup, setShowLookup] = useState(false);

  const {data} = props;

  const onValueChanged = (e) => {
    props.data.setValue(e.value);
  }

  const onSelectionChanged = () => {
    props.data.component.updateDimensions();
  }

  return (
    <div>
      <LookupEditor visible={showLookup} setVisible={setShowLookup}/>
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
        buttons={[
          {
            name: 'add',
            location: 'after',
            options: {
              text: 'add',
              icon: 'add',
              onClick: () => setShowLookup(true)
            },
          }]}
      >

      </SelectBox>
    </div>);
}

const mapStateToProps = ({patientTableConfig}: IRootState) => ({
  category: patientTableConfig.category,
});

const mapDispatchToProps = {}

type StateProps = ReturnType<typeof mapStateToProps>;
type DispatchProps = typeof mapDispatchToProps;

export default connect(mapStateToProps, mapDispatchToProps)(SelectBoxComponent);
