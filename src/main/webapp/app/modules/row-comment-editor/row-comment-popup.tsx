import React, {useEffect, useState} from "react";
import {Popup} from 'devextreme-react/popup';
import TextArea from 'devextreme-react/text-area';
import {useAppDispatch, useAppSelector} from "app/config/store";
import {createEntity, getEntity, updateEntity} from "app/modules/row-comment-editor/row-comment.reducer";
import {IPatient} from "app/shared/model/patient.model";

export const RowCommentPopup = React.forwardRef((props, ref) => {

  const dispatch = useAppDispatch();

  const [popupVisible, setPopupVisible] = useState(false);

  React.useImperativeHandle(ref, () => ({
    setPopupVisible(value) {
      setPopupVisible(value);
    },
  }))

  const patient = useAppSelector<IPatient>(state => state.datasourcePatient.entity);
  const comment = useAppSelector(state => state.rowCommentReducer.entity);
  const selectedCategory = useAppSelector(state => state.datasourceStatus.selected.category);
  const selectedRow = useAppSelector(state => state.datasourceStatus.selected.row);

  const [value, setValue] = useState('');

  useEffect(() => {
    if (popupVisible && selectedCategory && selectedRow) {
      setValue('');
      dispatch(getEntity({categoryId: selectedCategory.id, rowId: selectedRow.idx}));
    }
  }, [selectedCategory, selectedRow]);

  useEffect(() => {
    if (comment) {
      setValue(comment.comment);
    }
  }, [comment]);

  const onClickSave = () => {
    if (comment && comment.id) {
      dispatch(updateEntity({
        ...comment,
        comment: value,
      }));
    } else {
      dispatch(createEntity({ptNo: patient.ptNo, rowId: selectedRow.idx, comment: value, category: selectedCategory}));
    }
  }

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
            setValue(comment ? comment.comment : '');
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
      value={value}
      onValueChanged={e => setValue(e.value)}
    />
  </Popup>
});