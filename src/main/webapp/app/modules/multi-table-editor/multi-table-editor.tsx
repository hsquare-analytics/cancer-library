import React, {useEffect} from "react";
import {useAppSelector} from "app/config/store";
import {getCategories} from "app/modules/navigation/navigation.reducer";
import AccordionEditor from "app/modules/multi-table-editor/accordion-editor";

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
      {categories.map((category, index) => <AccordionEditor key={category}
                                                            category={category}
                                                            patientNo={patientNo}
                                                            expanded={index === 0}/>)}
    </div>
  );
}

export default MultiTableEditor;
