import React, {useState} from "react";
import TextArea from 'devextreme-react/text-area';
import {IRootState} from "app/config/store";
import {connect} from 'react-redux';
import DxRowCommentBox from "app/modules/datasource-editor/multi-table-editor/dx-component/dx-row-comment-box";
import {
  getDxCellClass,
  isChangedCell,
  isValid
} from "app/modules/datasource-editor/multi-table-editor/dx-component/dx-component.utils";
import {Popup} from 'devextreme-react/popup';
import ScrollView from 'devextreme-react/scroll-view';
import ReactDiffViewer from 'react-diff-viewer';
import Button from '@mui/material/Button';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';


interface IDxEditCellRenderProps extends StateProps, DispatchProps {
  data: any;
}

const DxTextBox = (props: IDxEditCellRenderProps) => {
  const {data, originRow, validationFailedItems} = props;

  const [className, setClassName] = useState(getDxCellClass(data, originRow, isValid(validationFailedItems, data.column.name)));

  const [popupVisible, setPopupVisible] = useState(false);

  const onValueChanged = (e) => {
    props.data.setValue(e.value);
    setClassName(getDxCellClass(data, originRow, isValid(validationFailedItems, data.column.name)));
  }

  return <div>
    <TextArea className={className}
              isValid={isValid(validationFailedItems, data.column.name)}
              defaultValue={props.data.value}
              onValueChanged={onValueChanged}
              disabled={!props.data.column.allowEditing}
              height={150}
    />
    <DxRowCommentBox data={Object.assign({}, data)}/>
    {isChangedCell(data, originRow) ? <Button variant="text" onClick={() => setPopupVisible(true)}>
      <FontAwesomeIcon icon="code-compare"/>
    </Button> : null}
    <Popup
      closeOnOutsideClick={true}
      showTitle={false}
      visible={popupVisible}
      dragEnabled={false}
      width={'80vw'}
      height={'60vh'}
      onHiding={() => setPopupVisible(false)}
    >
      <ScrollView width='100%' height='100%' showScrollbar={"onScroll"}>
        <ReactDiffViewer oldValue={originRow[data.column.dataField]} newValue={data.value} splitView={true}/>
      </ScrollView>
    </Popup>
  </div>
}

const mapStateToProps = ({datasourceStatus}: IRootState) => ({
  originRow: datasourceStatus.originRow,
  validationFailedItems: datasourceStatus.validationFailedItems
});

const mapDispatchToProps = {}

type StateProps = ReturnType<typeof mapStateToProps>;
type DispatchProps = typeof mapDispatchToProps;

export default connect(mapStateToProps, mapDispatchToProps)(DxTextBox);

