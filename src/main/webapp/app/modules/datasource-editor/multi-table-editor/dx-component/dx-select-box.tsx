import React, {useState} from 'react';
import SelectBox from 'devextreme-react/select-box';
import {IRootState} from "app/config/store";
import {connect} from 'react-redux';
import LookupEditor from "app/modules/datasource-editor/multi-table-editor/lookup-editor/lookup-editor";
import DxRowCommentBox from "app/modules/datasource-editor/multi-table-editor/dx-component/dx-row-comment-box";
import {
  getDxCellClass,
  isValid
} from "app/modules/datasource-editor/multi-table-editor/dx-component/dx-component.utils";
import {hasAnyAuthority} from "app/shared/auth/private-route";
import {AUTHORITIES} from "app/config/constants";

interface ISelectBoxComponentProps extends StateProps, DispatchProps {
  data: any;
}

const DxSelectBox = (props: ISelectBoxComponentProps) => {
  const [isSelectBoxOpened, setIsSelectBoxOpened] = useState<boolean>(false);
  const [showLookup, setShowLookup] = useState(false);

  const {data, originRow, validationFailedItems, isSudoUser} = props;

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
      {isSudoUser ? <LookupEditor visible={showLookup} setVisible={setShowLookup} dataSource={data.column.lookup.dataSource}/> : null}
      <SelectBox
        className={getDxCellClass(data, originRow, isValid(validationFailedItems, data.column.name))}
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
        isValid={isValid(validationFailedItems, data.column.name)}
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
      <DxRowCommentBox data={Object.assign({}, data)}/>
    </div>);
}

const mapStateToProps = ({datasourceStatus, authentication}: IRootState) => ({
  originRow: datasourceStatus.originRow,
  validationFailedItems: datasourceStatus.validationFailedItems,
  isSudoUser: hasAnyAuthority(authentication.account.authorities, [AUTHORITIES.ADMIN, AUTHORITIES.SUPERVISOR])
});


const mapDispatchToProps = {}

type StateProps = ReturnType<typeof mapStateToProps>;
type DispatchProps = typeof mapDispatchToProps;

export default connect(mapStateToProps, mapDispatchToProps)(DxSelectBox);
