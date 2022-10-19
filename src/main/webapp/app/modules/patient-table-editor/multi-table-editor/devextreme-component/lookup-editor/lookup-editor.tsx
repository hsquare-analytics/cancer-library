import React, {useEffect} from "react";
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

  const [cards, setCards] = React.useState<{ id: any, text: any }[]>([]);

  useEffect(() => {
    const result = JSON.parse(JSON.stringify(dataSource)).map(data => {
      return {id: data, text: data}
    });

    setCards(result);
  }, [JSON.stringify(dataSource)]);

  return (
    <Popup
      showTitle={false}
      visible={visible}
      dragEnabled={false}
      hideOnOutsideClick={true}
      width={500}
      height={500}
      onHiding={() => props.setVisible(false)}
      toolbarItems={[
        {
          location: 'after', widget: 'dxButton', toolbar: "bottom",
          options: {
            text: 'SAVE', onClick: () => props.setVisible(false)
          }
        },
        {
          location: 'after', widget: 'dxButton', toolbar: "bottom",
          options: {
            text: 'CANCEL', onClick: () => props.setVisible(false)
          }
        }
      ]}
    >
      {JSON.stringify(cards)}
      <DndProvider backend={HTML5Backend}>
        <DndContainer cards={cards} setCards={setCards}/>
      </DndProvider>
    </Popup>
  );


};

export default LookupEditor;
