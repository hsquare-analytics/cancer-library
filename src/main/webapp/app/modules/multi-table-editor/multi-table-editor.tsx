import React, {useEffect} from "react";
import {useAppSelector} from "app/config/store";
import {getCategories} from "app/modules/navigation/navigation.reducer";
import AccordionEditor from "app/modules/multi-table-editor/accordion-editor";

export const MultiTableEditor = () => {

  const categories = useAppSelector(state => state.navigation.categories);

  useEffect(() => {
    if (categories.length === 0) {
      getCategories();
    }
  }, []);

  return (
    <div>
      {categories.map((category, index) => <AccordionEditor key={category} category={category} expanded={index === 0}/>)}
    </div>
  );
}

export default MultiTableEditor;
