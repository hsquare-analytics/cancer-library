import React, {useEffect, useState} from 'react';
import SelectBox from 'devextreme-react/select-box';
import {IRootState} from "app/config/store";
import {connect} from 'react-redux';
import LookupEditor from "app/modules/datasource-editor/multi-table-editor/lookup-editor/lookup-editor";
import DxRowCommentBox, {
  getDxCellClass
} from "app/modules/datasource-editor/multi-table-editor/dx-component/dx-row-comment-box";
import {Validator} from 'devextreme-react/validator';
import {translate} from 'react-jhipster';

interface ISelectBoxComponentProps extends StateProps, DispatchProps {
  data: any;
}

const DxSelectBox = (props: ISelectBoxComponentProps) => {
  const [isSelectBoxOpened, setIsSelectBoxOpened] = useState<boolean>(false);
  const [showLookup, setShowLookup] = useState(false);

  const {data, originRow, category, itemContainer} = props;

  const [item, setItem] = useState(null);

  useEffect(() => {
    if (category && itemContainer[category.id]) {
      const foundedItem = itemContainer[category.id].find(temp => temp.title.toLowerCase() === data.column.name.toLowerCase());
      setItem(foundedItem);
    }
  }, [JSON.stringify(category), JSON.stringify(itemContainer)]);

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

  if (!item) {
    return null;
  }

  const getValidationRules = () => {
    if (!item || !item.property) {
      return [];
    }
    const rules = [];
    if (item.property.required) {
      rules.push({type: 'required', message: translate('cancerLibraryApp.datasource.singleTableEditor.validator.required', {field: item.property.caption || item.title})});
    }
    return rules;
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
        {<Validator validationRules={getValidationRules()}/>}
      </SelectBox>
      <DxRowCommentBox originRow={originRow} data={data}/>
    </div>);
}

const mapStateToProps = ({datasourceStatus, datasourceContainer}: IRootState) => ({
  originRow: datasourceStatus.originRow,
  category: datasourceStatus.selected.category,
  itemContainer: datasourceContainer.item.container
});


const mapDispatchToProps = {}

type StateProps = ReturnType<typeof mapStateToProps>;
type DispatchProps = typeof mapDispatchToProps;

export default connect(mapStateToProps, mapDispatchToProps)(DxSelectBox);
