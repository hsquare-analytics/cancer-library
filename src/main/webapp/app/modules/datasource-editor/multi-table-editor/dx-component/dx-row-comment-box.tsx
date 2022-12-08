import React, {useState} from "react";
import {IRootState} from "app/config/store";
import {connect} from 'react-redux';
import {
  getFormattedValue,
  isChangedCell
} from "app/modules/datasource-editor/multi-table-editor/dx-component/dx-component.utils";
import {translate} from "react-jhipster";
import {Popup} from 'devextreme-react/popup';
import ScrollView from 'devextreme-react/scroll-view';
import ReactDiffViewer from 'react-diff-viewer-continued';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import IconButton from '@mui/material/IconButton';

interface IDxRowCommentBoxProps extends StateProps, DispatchProps {
  data: any;
  lookupDataSource?: { title: string, description: string, label: string }[];
}

const DxRowCommentBox = (props: IDxRowCommentBoxProps) => {
  const {data, lookupDataSource, originRow, validationFailedItems} = props;

  const [popupVisible, setPopupVisible] = useState(false);

  const errorItem = validationFailedItems.find(temp => temp.title.toLowerCase() === data.column.name.toLowerCase());

  if (errorItem) {
    return <div>
      <div className="text-underline text-danger p-1">* {errorItem.message}</div>
    </div>;
  }

  const targetValue = originRow[data.column.dataField];
  let lookupItem;

  const initLookupItem = () => {
    if (!lookupDataSource || lookupDataSource.length === 0) {
      return undefined;
    }
    lookupItem = lookupDataSource.find(temp => temp.description === targetValue);
  }

  initLookupItem();

  const isIndiscernibleLookupItem = () => {
    if (!targetValue) {
      return false;
    }
    return lookupDataSource && lookupDataSource.length > 0 && !lookupItem;
  }

  const getCommentLabel = () => {
    return isIndiscernibleLookupItem()
      ? translate("cancerLibraryApp.datasourceEditor.lookupEditor.dxRowCommentBox.indiscernibleLabel")
      : translate("cancerLibraryApp.datasourceEditor.lookupEditor.dxRowCommentBox.initialLabel")
  }

  const getCommentValue = () => {
    let displayed;

    if (lookupItem) {
      displayed = `${lookupItem.title} (${lookupItem.description})`
    } else {
      displayed = targetValue;
    }

    return getFormattedValue({
      value: displayed,
      type: data.column.dataType,
      format: data.column.format
    });
  }

  if (isChangedCell(data, originRow) || isIndiscernibleLookupItem()) {
    return <div>
      <div className="text-underline p-1">
        {getCommentLabel()}
        {getCommentValue()}
        <IconButton className={"ms-1"} onClick={() => setPopupVisible(true)} size="small" color="info">
          <FontAwesomeIcon icon="code-compare"/>
        </IconButton>
      </div>
      <Popup
        closeOnOutsideClick={true}
        showTitle={true}
        visible={popupVisible}
        dragEnabled={false}
        width={'60vw'}
        height={'40vh'}
        onHiding={() => setPopupVisible(false)}
        showCloseButton={true}
      >
        <ScrollView width='100%' height='100%' showScrollbar={"onScroll"}>
          <ReactDiffViewer oldValue={originRow[data.column.dataField]?.toString()} newValue={data.value?.toString()} splitView={true}/>
        </ScrollView>
      </Popup>

    </div>;
  }
}

const mapStateToProps = ({datasourceStatus}: IRootState) => ({
  originRow: datasourceStatus.originRow,
  validationFailedItems: datasourceStatus.validationFailedItems,
});


const mapDispatchToProps = {}

type StateProps = ReturnType<typeof mapStateToProps>;
type DispatchProps = typeof mapDispatchToProps;

export default connect(mapStateToProps, mapDispatchToProps)(DxRowCommentBox);

