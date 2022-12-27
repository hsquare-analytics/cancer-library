import React, {useState} from 'react';
import SelectBox from 'devextreme-react/select-box';
import {IRootState, useAppSelector} from "app/config/store";
import {connect} from 'react-redux';
import LookupEditor from "app/modules/datasource-editor/multi-table-editor/lookup-editor/lookup-editor";
import DxRowCommentBox from "app/modules/datasource-editor/multi-table-editor/dx-component/dx-row-comment-box";
import {
  getDxCellClass,
  isValid
} from "app/modules/datasource-editor/multi-table-editor/dx-component/dx-component.utils";
import {hasAnyAuthority} from "app/shared/auth/private-route";
import {AUTHORITIES} from "app/config/constants";
import {canNotEditDatasource} from "app/modules/datasource-editor/stack-button/datasource.editchecker.utils";
import {IPatient} from "app/shared/model/patient.model";

interface ISelectBoxComponentProps extends StateProps, DispatchProps {
  data: any;
}

const DxSelectBox = (props: ISelectBoxComponentProps) => {
  const patient = useAppSelector<IPatient>(state => state.datasourcePatient.entity);

  const [isSelectBoxOpened, setIsSelectBoxOpened] = useState<boolean>(false);
  const [showLookup, setShowLookup] = useState(false);

  const [className, setClassName] = useState(getDxCellClass(props.data, props.originRow, isValid(props.validationFailedItems, props.data.column.name)));

  const {data, originRow, validationFailedItems, isSudoUser} = props;

  const onValueChanged = (e) => {
    props.data.setValue(e.value);
    setClassName(getDxCellClass(data, originRow, isValid(validationFailedItems, data.column.name)));
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
      {isSudoUser ? <LookupEditor visible={showLookup} setVisible={setShowLookup}
                                  codebookId={data.column.lookup.dataSource[0].codebookId}
                                  dataSource={data.column.lookup.dataSource}/> : null}
      <SelectBox
        readOnly={!isSudoUser && canNotEditDatasource(patient)}
        className={className}
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
        showClearButton={true}
        isValid={isValid(validationFailedItems, data.column.name)}
        itemTemplate={(option) => {
          const label = `${option.title} (value: ${option.description})`;
          return `<div class='item-with-tooltip' title='${label}'> ${label}</div>`;
        }}
        dropDownOptions={{
          resizeEnabled: true,
        }}
        buttons={isSudoUser && isSelectBoxOpened ? [
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
      <DxRowCommentBox data={Object.assign({}, data)} lookupDataSource={data.column.lookup.dataSource}/>
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
