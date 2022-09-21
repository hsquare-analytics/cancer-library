import React, {useEffect} from 'react';
import {useParams} from 'react-router-dom';
import DataGrid, {Column} from 'devextreme-react/data-grid';
import {useAppDispatch, useAppSelector} from "app/config/store";
import {
  getCategoryById,
  getDatasourceByCategoryId,
  getItemListByCategoryId,
  reset
} from "app/modules/data-editor/data-editor.reducer";
import {cleanEntity} from "app/shared/util/entity-utils";
import axios from "axios";
import {toast} from 'react-toastify';

export const DataEditor = () => {
  const dispatch = useAppDispatch();

  const datasource = useAppSelector(state => state.dataEditorReducer.datasource);
  const itemList = useAppSelector(state => state.dataEditorReducer.items);
  const category = useAppSelector(state => state.dataEditorReducer.category);
  const loading = useAppSelector(state => state.dataEditorReducer.loading);

  const {categoryId} = useParams<'categoryId'>();

  useEffect(() => {
    const id = Number(categoryId);
    dispatch(getDatasourceByCategoryId(id));
    dispatch(getItemListByCategoryId(id));
    dispatch(getCategoryById(id));
    return () => {
      reset();
    }
  }, [categoryId]);

  const onRowUpdating = e => {
    e.cancel = new Promise<void>((resolve, reject) => {
      let row = cleanEntity(Object.assign({}, e.oldData, e.newData));
      axios
      .put(`api/datasource/${categoryId}`, row)
      .then(({data}) => {
        if (data >= 1) {
          toast.info('update success');
          resolve();
        } else {
          toast.error('fail');
          reject('update fail');
        }
      })
      .catch(e => reject(e));
    });
  };

  return (
    <div>
      <h2 id="configuration-page-heading" data-cy="configurationPageHeading">
        {category.title}
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
        onRowUpdating={onRowUpdating}
        height={'90vh'}
        scrolling={{mode: 'virtual'}}
        selection={{mode: 'multiple'}}
        loadPanel={{enabled: loading}}
      >
        {
          itemList.map(item => <Column
              key={item}
              dataField={item.title}
              caption={item.itemProperty?.caption}
              visibleIndex={item.itemProperty?.visibleIndex}
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
