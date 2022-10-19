import React from "react";
import {Popup} from 'devextreme-react/popup';
import {ICategory} from "app/shared/model/category.model";


interface ILookupEditorProps {
  dataField: string;
  category: ICategory;
  visible: boolean;
  setVisible: (visible: boolean) => void;
}

const LookupEditor = (props: ILookupEditorProps) => {
  const {visible, category, dataField} = props;

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
      <div>
        {dataField}
        <p>
          {JSON.stringify(category)}
        </p>
      </div>
    </Popup>
  );


};

export default LookupEditor;
