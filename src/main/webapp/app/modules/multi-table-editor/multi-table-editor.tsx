import React, {useEffect} from "react";
import {useAppSelector} from "app/config/store";
import {getCategories} from "app/modules/navigation/navigation.reducer";
import SingleTableEditor from "app/modules/multi-table-editor/single-table-editor";

export const MultiTableEditor = () => {

    const categories = useAppSelector(state => state.navigation.categories);

    useEffect(() => {
        if (categories.length == 0) {
            getCategories();
        }
    }, []);

    return (
        <div>
            {categories.map(category=><SingleTableEditor category={category}/>)}
        </div>
    );
}

export default MultiTableEditor;
