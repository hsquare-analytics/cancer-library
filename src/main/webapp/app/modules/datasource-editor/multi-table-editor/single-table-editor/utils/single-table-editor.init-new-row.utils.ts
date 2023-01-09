import {setCategory as setSelectedCategory} from "app/modules/datasource-editor/reducer/datasource.status.reducer";
import {ActionType} from "app/modules/datasource-editor/multi-table-editor/single-table-editor/single-table-editor";
import {ICategory} from "app/shared/model/category.model";
import Swal from "sweetalert2";
import {translate} from "react-jhipster";
import _ from "lodash";

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

  const initMaxSequence = () => {
    dataGridRef.current.instance.getDataSource().store().load().done(function (originDatasource) {
      if (originDatasource.length > 0) {
        const maxSeq = _.maxBy(originDatasource, category.attribute.autoincrementField)[category.attribute.autoincrementField];
        e.data[category.attribute.autoincrementField] = maxSeq + 1;
      } else {
        e.data[category.attribute.autoincrementField] = 1;
      }
    })
  }

  e.promise = new Promise<void>((resolve, reject) => {
    const selectedRows = dataGridRef.current.instance.getVisibleRows().filter(row => row.isSelected).map(row => row.data);
    if (selectedRows.length === 0) {
      // Swal.fire({
      //   text: translate('cancerLibraryApp.singleTableEditor.onInitNewRow.plzSelectMinimumRow'),
      //   icon: 'warning',
      //   confirmButtonText: 'OK'
      // });
      //
      initMaxSequence();

      resolve();
    } else if (selectedRows.length === 1) {
      const targetRows = selectedRows[0];
      delete targetRows['idx'];

      Object.keys(targetRows).forEach(key => {
        if (targetRows[key] === null) {
          delete targetRows[key];
        }
      });

      e.data = {...targetRows};

      initMaxSequence();

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
