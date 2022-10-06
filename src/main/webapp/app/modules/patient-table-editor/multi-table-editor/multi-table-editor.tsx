import React, {useEffect} from "react";
import {useAppSelector} from "app/config/store";
import {getCategories} from "app/modules/navigation/navigation.reducer";
import SingleTableEditor from "app/modules/patient-table-editor/multi-table-editor/single-table-editor";
import {IPatient} from "app/shared/model/patient.model";

export interface IMultiTableEditorProps {
  patient: IPatient;
}

export const MultiTableEditor = (props: IMultiTableEditorProps) => {
  const {patient} = props;

  const categories = useAppSelector(state => state.navigation.categories);

  useEffect(() => {
    if (categories.length === 0) {
      getCategories();
    }
  }, []);

  return (
    <div>
      {categories.map(category => <SingleTableEditor key={category.title} category={category} patient={patient}/>)}
    </div>
  );
}

export default MultiTableEditor;
