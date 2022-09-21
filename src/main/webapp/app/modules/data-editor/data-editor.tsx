import React, {useEffect} from 'react';
import {useParams} from 'react-router-dom';
import DataGrid, {Column} from 'devextreme-react/data-grid';
import {useAppDispatch, useAppSelector} from "app/config/store";
import {getDatasourceByCategoryId, getItemListByCategoryId, reset} from "app/modules/data-editor/data-editor.reducer";

export const DataEditor = () => {
  const dispatch = useAppDispatch();

  const datasource = useAppSelector(state => state.dataEditorReducer.datasource);
  const itemList = useAppSelector(state => state.dataEditorReducer.items);
  const loading = useAppSelector(state => state.dataEditorReducer.loading);

  const {categoryId} = useParams<'categoryId'>();

  useEffect(() => {
    dispatch(getDatasourceByCategoryId(Number(categoryId)));
    dispatch(getItemListByCategoryId(Number(categoryId)));
    return () => {
      reset();
    }
  }, [categoryId]);

  return (
    <div>
      <h2 id="configuration-page-heading" data-cy="configurationPageHeading">
        Data Editor
      </h2>
      <DataGrid
        dataSource={datasource}
        // defaultColumns={columns}
        showBorders={true}
        filterRow={{visible: true}}
        headerFilter={{visible: true}}
        searchPanel={{visible: true}}
        allowColumnResizing={true}
        // paging={{ enabled: true, pageSize: ITEMS_PER_PAGE }}
        pager={{displayMode: 'compact', showNavigationButtons: true}}
        columnChooser={{enabled: true, mode: 'select', allowSearch: true, width: 500, height: 500}}
        editing={{
          mode: 'popup',
          // allowAdding: true,
          allowUpdating: true,
        }}
        // onRowRemoving={onRowRemoving}
        // onRowUpdating={onRowUpdating}
        // export={{enabled: true, fileName: today() + '_' + linker.file?.originFilename}}
        height={'90vh'}
        scrolling={{mode: 'virtual'}}
        selection={{mode: 'multiple'}}
        loadPanel={{enabled: loading}}
      >
        {
          itemList.map(item => <Column
              key={item}
              dataField={item.title}
              visibleIndex={item.itemProperty.visibleIndex}
              // format={filteredCictionaryList.find(data => data.title == key)?.dxColumn?.format}
              // visible={filteredCictionaryList.find(data => data.title == key)?.dxColumn?.visible}
              // caption={columnLabel[key]}
              alignment={'center'}
              minWidth={150}
            />
          )
        }
      </DataGrid>
    </div>
  );
};

export default DataEditor;
