import React, {useEffect, useState} from "react";
import {Popup} from 'devextreme-react/popup';
import TextArea from 'devextreme-react/text-area';
import {useAppDispatch, useAppSelector} from "app/config/store";
import {getEntity, updateEntity} from "app/modules/row-comment-editor/row-comment.reducer";

export const RowCommentPopup = React.forwardRef((props, ref) => {

  const dispatch = useAppDispatch();

  const [popupVisible, setPopupVisible] = useState(false);

  const [value, setValue] = useState('');

  React.useImperativeHandle(ref, () => ({
    setPopupVisible(value) {
      setPopupVisible(value);
    },
  }))

  const comment = useAppSelector(state => state.rowCommentReducer.entity);
  const selectedCategory = useAppSelector(state => state.datasourceStatus.selected.category);
  const selectedRow = useAppSelector(state => state.datasourceStatus.selected.row);

  useEffect(() => {
    if (popupVisible && selectedCategory && selectedRow) {
      dispatch(getEntity({categoryId: selectedCategory.id, rowId: selectedRow.idx}));
    }
  }, [selectedCategory, selectedRow]);

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
            dispatch(updateEntity({
              ...comment,
              comment: value,
            }))
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
      defaultValue={comment ? comment.comment : ''}
      value={value}
      onValueChanged={e => setValue(e.value)}
    />
  </Popup>
});
