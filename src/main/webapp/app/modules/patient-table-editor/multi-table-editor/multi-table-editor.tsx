import React, {useEffect} from "react";
import {useAppSelector} from "app/config/store";
import {getCategories} from "app/modules/navigation/navigation.reducer";
import SingleTableEditor from "app/modules/patient-table-editor/multi-table-editor/single-table-editor";

export interface IMultiTableEditorProps {
  patientNo: string;
}

export const MultiTableEditor = (props: IMultiTableEditorProps) => {
  const {patientNo} = props;

  const categories = useAppSelector(state => state.navigation.categories);

  useEffect(() => {
    if (categories.length === 0) {
      getCategories();
    }
  }, []);

  return (
    <div>
      {categories.map((category) => <SingleTableEditor key={category}
                                                             category={category}
                                                              patientNo={patientNo}
                                                              />)}
    </div>
  );
}

export default MultiTableEditor;
