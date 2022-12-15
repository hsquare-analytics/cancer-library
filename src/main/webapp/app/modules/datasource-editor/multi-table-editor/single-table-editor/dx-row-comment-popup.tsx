import React, {useState} from "react";
import {Popup} from 'devextreme-react/popup';
import TextArea from 'devextreme-react/text-area';

export const DxRowCommentPopup = React.forwardRef((props, ref) => {
  const [popupVisible, setPopupVisible] = useState(false);

  const [profileExpanded, setProfileExpanded] = useState(true);

  React.useImperativeHandle(ref, () => ({
    setPopupVisible(value) {
      setPopupVisible(value);
    },
  }))

  return <Popup
    visible={popupVisible}
    onHiding={() => setPopupVisible(false)}
    dragEnabled={false}
    hideOnOutsideClick={true}
    showCloseButton={false}
    showTitle={false}
    width={'60vw'}
    height={'50vh'}
    toolbarItems={[
      {
        location: 'after',
        widget: 'dxButton',
        toolbar: 'bottom',
        options: {
          text: 'SAVE',
          onClick() {
            // dispatch(updateEntity({...patient, detail: {comment: commentValue}}));
            setPopupVisible(false);
          },
        },
      },
      {
        location: 'after',
        widget: 'dxButton',
        toolbar: 'bottom',
        options: {
          text: 'CANCEL',
          onClick() {
            // setCommentValue(patient.detail.comment);
            setPopupVisible(false);
          },
        },
      },
    ]}
  >
    <TextArea
      id={''}
      height={'43vh'}
      width={'100%'}
      // defaultValue={patient.detail.comment}
      // value={commentValue}
      // onValueChanged={e => setCommentValue(e.value)}
    />
  </Popup>
});
