import React, {useEffect} from "react";
import {useAppDispatch, useAppSelector} from "app/config/store";
import SingleTableEditor from "app/modules/patient-table-editor/multi-table-editor/single-table-editor";
import {IPatient} from "app/shared/model/patient.model";
import {getUsableCategories} from "app/modules/patient-table-editor/patient-table-editor.reducer";

export interface IMultiTableEditorProps {
  patient: IPatient;
}

export const MultiTableEditor = (props: IMultiTableEditorProps) => {
  const dispatch = useAppDispatch();

  const {patient} = props;

  const categories = useAppSelector(state => state.patientTableEditor.categories);

  useEffect(() => {
    if (categories.length === 0) {
      dispatch(getUsableCategories());
    }
  }, []);

  return (
    <div>
      {categories.map(category => <SingleTableEditor key={category.title} category={category} patient={patient}/>)}
    </div>
  );
}

export default MultiTableEditor;
