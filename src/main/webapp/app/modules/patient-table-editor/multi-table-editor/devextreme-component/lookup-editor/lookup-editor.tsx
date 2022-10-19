import React, {useEffect} from "react";
import {IToolbarItemProps, Popup} from 'devextreme-react/popup';
import {ICategory} from "app/shared/model/category.model";
import {DndProvider} from 'react-dnd'
import {HTML5Backend} from 'react-dnd-html5-backend'
import {
  DndContainer
} from "app/modules/patient-table-editor/multi-table-editor/devextreme-component/lookup-editor/dnd-container";
import {ICard} from "app/modules/patient-table-editor/multi-table-editor/devextreme-component/lookup-editor/dnd-card";
import Swal from "sweetalert2";

interface ILookupEditorProps {
  dataField: string;
  category: ICategory;
  dataSource: string[];
  visible: boolean;
  setVisible: (visible: boolean) => void;
}

const LookupEditor = (props: ILookupEditorProps) => {
  const {visible, category, dataField, dataSource} = props;

  const [cards, setCards] = React.useState<ICard[]>([]);

  useEffect(() => {
    const result = JSON.parse(JSON.stringify(dataSource)).map(data => {
      return {id: data, text: data}
    });

    setCards(result);
  }, [JSON.stringify(dataSource)]);

  const onAddCardButtonClick = () => {
    Swal.fire({
      title: 'Add new item',
      input: 'text',
      inputAttributes: {
        autocapitalize: 'off'
      },
      showCancelButton: true,
      confirmButtonText: 'Add',
      showLoaderOnConfirm: true,
    }).then((result) => {
      if (result.isConfirmed) {
        setCards([...cards, {id: result.value, text: result.value}]);
      }
    });
  };

  const ToolbarItems: Array<IToolbarItemProps> = [
    {
      location: 'before', widget: 'dxButton', toolbar: "bottom",
      options: {
        icon: 'plus', onClick: () => onAddCardButtonClick()
      }
    },
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
