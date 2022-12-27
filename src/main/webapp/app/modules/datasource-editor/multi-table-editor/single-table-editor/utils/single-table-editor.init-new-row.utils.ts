import {setCategory as setSelectedCategory} from "app/modules/datasource-editor/reducer/datasource.status.reducer";
import {ActionType} from "app/modules/datasource-editor/multi-table-editor/single-table-editor/single-table-editor";
import {ICategory} from "app/shared/model/category.model";

interface InitNewRowProps {
  e: any,
  dispatch: any,
  dataGridRef: any,
  category: ICategory,
  setActionType: (actionType: ActionType) => void
}

export const SingleTableEditorOnInitNewRow = (props: InitNewRowProps) => {
  const {e, dispatch, dataGridRef, category} = props;
  e.promise = new Promise<void>((resolve, reject) => {
    const row = dataGridRef.current.instance.getVisibleRows().find(row => row.isSelected).data;
    e.data = {...row};

    dispatch(setSelectedCategory(category));
    props.setActionType(ActionType.CREATE);
    resolve();
  });
}

export default SingleTableEditorOnInitNewRow;
