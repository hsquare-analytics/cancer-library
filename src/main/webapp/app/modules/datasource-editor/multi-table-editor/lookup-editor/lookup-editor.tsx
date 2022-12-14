import React, {useEffect} from "react";
import {IToolbarItemProps, Popup} from 'devextreme-react/popup';
import {DndProvider} from 'react-dnd'
import {HTML5Backend} from 'react-dnd-html5-backend'
import {DndContainer} from "app/modules/datasource-editor/multi-table-editor/lookup-editor/dnd-container";
import {ICard} from "app/modules/datasource-editor/multi-table-editor/lookup-editor/dnd-card";
import {
  fireAddCardSwal,
  fireSaveCardSwal
} from "app/modules/datasource-editor/multi-table-editor/lookup-editor/lookup-editor.swal";
import {partialUpdateEntity} from "app/entities/codebook/codebook.reducer";
import {useAppDispatch} from "app/config/store";
import ScrollView from 'devextreme-react/scroll-view';


interface ILookupEditorProps {
  codebookId: number,
  dataSource: { codebookId: number, title: string, description: string }[];
  visible: boolean;
  setVisible: (visible: boolean) => void;
}

const LookupEditor = (props: ILookupEditorProps) => {
  const dispatch = useAppDispatch();

  const {visible, codebookId, dataSource} = props;

  const [cards, setCards] = React.useState<ICard[]>([]);

  useEffect(() => {
    const result = JSON.parse(JSON.stringify(dataSource)).map(data => {
      return {
        ...data,
        id: data.title,
        text: `${data.title} (${data.description})`
      }
    });

    setCards(result);
  }, [JSON.stringify(dataSource)]);

  const onAddCardButtonClick = () => {
    fireAddCardSwal().then(result => {
      const data = result.value;
      if (result.isConfirmed) {
        setCards([...cards, {
          id: data,
          title: data.title,
          description: data.description,
          text: `${data.title} (${data.description})`
        }]);
      }
    });
  };

  const onSaveButtonClick = () => {
    fireSaveCardSwal().then((result) => {
      if (result.isConfirmed) {
        props.setVisible(false);
        dispatch(partialUpdateEntity({
          id: codebookId,
          lookupList: cards.map(card => {
            return {
              title: card.title,
              description: card.description
            }
          })
        }));
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
      <ScrollView width='100%' height='100%' showScrollbar={"onScroll"}>
        <DndProvider backend={HTML5Backend}>
          <DndContainer cards={cards} setCards={setCards}/>
        </DndProvider>
      </ScrollView>
    </Popup>
  );


};

export default LookupEditor;
