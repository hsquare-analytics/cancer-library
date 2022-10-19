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
  const [showLookup, setShowLookup] = useState(false);

  const {data, category} = props;


  const onValueChanged = (e) => {
    props.data.setValue(e.value);
  }

  const onSelectionChanged = () => {
    props.data.component.updateDimensions();
  }

  return (
    <div>
      <LookupEditor visible={showLookup} setVisible={setShowLookup} category={category}
                    dataField={props.data.column.dataField}
                    dataSource={props.data.column.lookup.dataSource.map(data => data.title)}/>
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
              icon: 'overflow',
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

export default connect(mapStateToProps, mapDispatchToProps)(DxSelectBox);
