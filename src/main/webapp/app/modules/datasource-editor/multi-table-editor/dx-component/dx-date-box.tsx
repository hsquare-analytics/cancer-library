import React, {useState} from "react";
import DateBox from 'devextreme-react/date-box';
import {IRootState, useAppSelector} from "app/config/store";
import {connect} from 'react-redux';
import DxRowCommentBox from "app/modules/datasource-editor/multi-table-editor/dx-component/dx-row-comment-box";
import {
  getDxCellClass,
  isValid
} from "app/modules/datasource-editor/multi-table-editor/dx-component/dx-component.utils";
import {hasAnyAuthority} from "app/shared/auth/private-route";
import {AUTHORITIES} from "app/config/constants";
import {IPatient} from "app/shared/model/patient.model";
import {canNotEditDatasource} from "app/modules/datasource-editor/stack-button/datasource.editchecker.utils";


interface IDxEditCellRenderProps extends StateProps, DispatchProps {
  data: any;
}

const DxDateBox = (props: IDxEditCellRenderProps) => {
  const patient = useAppSelector<IPatient>(state => state.datasourcePatient.entity);

  const {data, originRow, validationFailedItems, isSudoUser} = props;

  const [className, setClassName] = useState(getDxCellClass(data, originRow, isValid(validationFailedItems, data.column.name)));

  const onValueChanged = (e) => {
    props.data.setValue(e.value);
    setClassName(getDxCellClass(data, originRow, isValid(validationFailedItems, data.column.name)));
  }

  return <div>
    <DateBox
      readOnly={!isSudoUser && canNotEditDatasource(patient)}
      className={className}
      isValid={isValid(validationFailedItems, data.column.name)}
      defaultValue={props.data.value}
      onValueChanged={onValueChanged}
      type={props.data.column.dataType}
      disabled={!props.data.column.allowEditing}
      displayFormat={props.data.column.format}
      dateSerializationFormat={'yyyy-MM-ddTHH:mm:ssZ'}
    />
    <DxRowCommentBox data={Object.assign({}, data)}/>
  </div>
}

const mapStateToProps = ({datasourceStatus, authentication}: IRootState) => ({
  originRow: datasourceStatus.originRow,
  validationFailedItems: datasourceStatus.validationFailedItems,
  isSudoUser: hasAnyAuthority(authentication.account.authorities, [AUTHORITIES.ADMIN, AUTHORITIES.SUPERVISOR])
});

const mapDispatchToProps = {}

type StateProps = ReturnType<typeof mapStateToProps>;
type DispatchProps = typeof mapDispatchToProps;

export default connect(mapStateToProps, mapDispatchToProps)(DxDateBox);

