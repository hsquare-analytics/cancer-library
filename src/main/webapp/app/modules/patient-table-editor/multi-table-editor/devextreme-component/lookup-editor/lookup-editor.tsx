import React from "react";
import {Popup} from 'devextreme-react/popup';
import {ICategory} from "app/shared/model/category.model";
import {DndProvider} from 'react-dnd'
import {HTML5Backend} from 'react-dnd-html5-backend'
import {
  DndContainer
} from "app/modules/patient-table-editor/multi-table-editor/devextreme-component/lookup-editor/dnd-container";


interface ILookupEditorProps {
  dataField: string;
  category: ICategory;
  dataSource: string[];
  visible: boolean;
  setVisible: (visible: boolean) => void;
}

const LookupEditor = (props: ILookupEditorProps) => {
  const {visible, category, dataField, dataSource} = props;

  return (
    <Popup
      visible={visible}
      dragEnabled={false}
      hideOnOutsideClick={true}
      showCloseButton={false}
      showTitle={false}
      width={500}
      height={500}
      onHiding={() => props.setVisible(false)}
    >
      <DndProvider backend={HTML5Backend}>
        <DndContainer dataSource={dataSource.map(data=>{
          return {id: data, text: data}
        })} />
      </DndProvider>
    </Popup>
  );


};

export default LookupEditor;
