import React, {useEffect} from "react";
import {IToolbarItemProps, Popup} from 'devextreme-react/popup';
import {DndProvider} from 'react-dnd'
import {HTML5Backend} from 'react-dnd-html5-backend'
import {
  DndContainer
} from "app/modules/patient-table-editor/multi-table-editor/devextreme-component/lookup-editor/dnd-container";
import {ICard} from "app/modules/patient-table-editor/multi-table-editor/devextreme-component/lookup-editor/dnd-card";
import {
  fireAddCardSwal,
  fireSaveCardSwal
} from "app/modules/patient-table-editor/multi-table-editor/devextreme-component/lookup-editor/lookup-editor.swal";
import {partialUpdateEntity} from "app/entities/item/item.reducer";
import {useAppDispatch} from "app/config/store";

interface ILookupEditorProps {
  dataSource: { itemId: number, title: string }[];
  visible: boolean;
  setVisible: (visible: boolean) => void;
}

const LookupEditor = (props: ILookupEditorProps) => {
  const dispatch = useAppDispatch();

  const {visible, dataSource} = props;

  const [itemId, setItemId] = React.useState<number>(0);
  const [cards, setCards] = React.useState<ICard[]>([]);

  useEffect(() => {
    setItemId(dataSource[0].itemId);
    const result = JSON.parse(JSON.stringify(dataSource)).map(data => {
      return {id: data.title, text: data.title}
    });

    setCards(result);
  }, [JSON.stringify(dataSource)]);

  const onAddCardButtonClick = () => {
    fireAddCardSwal().then((result) => {
      if (result.isConfirmed) {
        setCards([...cards, {id: result.value, text: result.value}]);
      }
    });
  };

  const onSaveButtonClick = () => {
    fireSaveCardSwal().then((result) => {
      if (result.isConfirmed) {
        props.setVisible(false);
        dispatch(partialUpdateEntity({id: itemId, lookup: cards.map(card => card.text)}));
      }
    });
  }

  const ToolbarItems: Array<IToolbarItemProps> = [
    {
      location: 'before', widget: 'dxButton', toolbar: "bottom",
      options: {
        icon: 'plus', onClick: () => onAddCardButtonClick(),
      }
    },
    {
      location: 'after', widget: 'dxButton', toolbar: "bottom",
      options: {
        text: 'SAVE', onClick: () => onSaveButtonClick(),
      }
    },
    {
      location: 'after', widget: 'dxButton', toolbar: "bottom",
      options: {
        text: 'CANCEL', onClick: () => props.setVisible(false),
      }
    },
  ];

  return (
    <Popup
      showTitle={false}
      visible={visible}
      dragEnabled={false}
      width={500}
      height={500}
      onHiding={() => props.setVisible(false)}
      toolbarItems={ToolbarItems}
    >
      <DndProvider backend={HTML5Backend}>
        <DndContainer cards={cards} setCards={setCards}/>
      </DndProvider>
    </Popup>
  );


};

export default LookupEditor;
