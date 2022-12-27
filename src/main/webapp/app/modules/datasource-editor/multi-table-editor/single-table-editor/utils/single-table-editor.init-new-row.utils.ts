import {setCategory as setSelectedCategory} from "app/modules/datasource-editor/reducer/datasource.status.reducer";
import {ActionType} from "app/modules/datasource-editor/multi-table-editor/single-table-editor/single-table-editor";
import {ICategory} from "app/shared/model/category.model";
import Swal from "sweetalert2";
import {translate} from "react-jhipster";

interface InitNewRowProps {
  e: any,
  dispatch: any,
  dataGridRef: any,
  category: ICategory,
  setActionType: (actionType: ActionType) => void
}

export const SingleTableEditorOnInitNewRow = (props: InitNewRowProps) => {
  const {e, dispatch, dataGridRef, category} = props;

  dispatch(setSelectedCategory(category));
  props.setActionType(ActionType.CREATE);
  const visibleRows = dataGridRef.current.instance.getVisibleRows().filter(row => row.isSelected).map(row => row.data);


  e.promise = new Promise<void>((resolve, reject) => {
    if (visibleRows.length === 0) {
      Swal.fire({
        text: translate('cancerLibraryApp.singleTableEditor.onInitNewRow.plzSelectMinimumRow'),
        icon: 'warning',
        confirmButtonText: 'OK'
      });
      resolve();
    } else if (visibleRows.length === 1) {
      const targetRows = visibleRows[0];
      e.data = {...targetRows};
      resolve();
    } else {
      Swal.fire({
        text: translate('cancerLibraryApp.singleTableEditor.onInitNewRow.plzSelectOnlyOneRow'),
        icon: 'warning',
        confirmButtonText: 'OK'
      });
      reject();
    }
  });
}

export default SingleTableEditorOnInitNewRow;
