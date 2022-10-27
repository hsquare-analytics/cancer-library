import React, {useEffect, useState} from 'react';
import SelectBox from 'devextreme-react/select-box';
import {IRootState} from "app/config/store";
import {connect} from 'react-redux';
import LookupEditor from "app/modules/datasource-editor/multi-table-editor/lookup-editor/lookup-editor";
import DxRowCommentBox, {
  getDxCellClass
} from "app/modules/datasource-editor/multi-table-editor/dx-component/dx-row-comment-box";

interface ISelectBoxComponentProps extends StateProps, DispatchProps {
  data: any;
}

const DxSelectBox = (props: ISelectBoxComponentProps) => {
  const [isSelectBoxOpened, setIsSelectBoxOpened] = useState<boolean>(false);
  const [showLookup, setShowLookup] = useState(false);
  const [isValid, setIsValid] = useState(true);
  const [validationMessage, setValidationMessage] = useState('');

  const {data, originRow, validationFailedItems} = props;

  useEffect(() => {
    if (validationFailedItems.length > 0) {
      const item = validationFailedItems.find(temp => temp.title.toLowerCase() === data.column.name.toLowerCase());
      if (item) {
        setIsValid(false);
        setValidationMessage(item.message);
      }
    }
  }, [validationFailedItems]);

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
        className={getDxCellClass(data, originRow)}
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
        isValid={isValid}
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
      <DxRowCommentBox originRow={originRow} data={data} isValid={isValid} validationMessage={validationMessage}/>
    </div>);
}

const mapStateToProps = ({datasourceStatus}: IRootState) => ({
  originRow: datasourceStatus.originRow,
  validationFailedItems: datasourceStatus.validationFailedItems,
});


const mapDispatchToProps = {}

type StateProps = ReturnType<typeof mapStateToProps>;
type DispatchProps = typeof mapDispatchToProps;

export default connect(mapStateToProps, mapDispatchToProps)(DxSelectBox);
