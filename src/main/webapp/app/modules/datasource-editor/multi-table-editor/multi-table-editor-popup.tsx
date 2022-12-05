import React, {useState} from "react";
import PatientProfileCard from "app/modules/datasource-editor/patient-profile/patient-profile-card";
import MultiTableEditor from "app/modules/datasource-editor/multi-table-editor/multi-table-editor";
import ScrollView from 'devextreme-react/scroll-view';
import {Popup} from 'devextreme-react/popup';


export const MultiTableEditorPopup = React.forwardRef((props, ref) => {
  const [popupVisible, setPopupVisible] = useState(false);

  React.useImperativeHandle(ref, () => ({
    setPopupVisible(value) {
      setPopupVisible(value);
    },
  }))

  return <Popup
    wrapperAttr={{class: 'multi-table-editor-popup'}}
    visible={popupVisible}
    onHiding={() => setPopupVisible(false)}
    resizeEnabled={true}
    height={'98vh'}
    width={'98vw'}
    titleComponent={() => <PatientProfileCard setPopupVisible={setPopupVisible}/>}
  >
    <ScrollView width='100%' height='100%' showScrollbar={"onScroll"}>
      <MultiTableEditor/>
    </ScrollView>
  </Popup>
});
