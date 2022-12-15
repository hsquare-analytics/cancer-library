import React, {useState} from "react";
import {Popup} from 'devextreme-react/popup';
import TextArea from 'devextreme-react/text-area';
import {IComment} from "app/shared/model/comment.model";

export const RowCommentPopup = React.forwardRef((props, ref) => {
  const [popupVisible, setPopupVisible] = useState(false);

  const [profileExpanded, setProfileExpanded] = useState(true);

  const [comment, setComment] = useState<IComment>(null);

  React.useImperativeHandle(ref, () => ({
    setPopupVisible(value, comment) {
      setPopupVisible(value);
      setComment(comment);
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
    {JSON.stringify(comment)}
    <TextArea
      id={''}
      height={'43vh'}
      width={'100%'}
      // defaultValue={patient.detail.comment}
      // value={data}
      // onValueChanged={e => setCommentValue(e.value)}
    />
  </Popup>
});
