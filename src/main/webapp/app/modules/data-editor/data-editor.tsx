import React, {useEffect} from 'react';
import {useParams} from 'react-router-dom';
import DataGrid, {Column, Lookup} from 'devextreme-react/data-grid';
import {useAppDispatch, useAppSelector} from "app/config/store";
import {translate} from 'react-jhipster';

import {
  getCategoryById,
  getEditorDatasourceByCategoryId,
  getItemListByCategoryId,
  reset
} from "app/modules/data-editor/data-editor.reducer";
import {cleanEntity} from "app/shared/util/entity-utils";
import axios from "axios";
import {toast} from 'react-toastify';
import {REVIEW_LIST} from "app/config/constants";

export const DataEditor = () => {
  const dispatch = useAppDispatch();

  const datasource = useAppSelector(state => state.dataEditorReducer.datasource);
  const itemList = useAppSelector(state => state.dataEditorReducer.items);
  const category = useAppSelector(state => state.dataEditorReducer.category);
  const loading = useAppSelector(state => state.dataEditorReducer.loading);

  const {categoryId} = useParams<'categoryId'>();

  useEffect(() => {
    const id = Number(categoryId);
    dispatch(getEditorDatasourceByCategoryId(id));
    dispatch(getItemListByCategoryId(id));
    dispatch(getCategoryById(id));
    return () => {
      reset();
    }
  }, [categoryId]);

  const onRowUpdating = e => {
    e.cancel = new Promise<void>((resolve, reject) => {
      const row = cleanEntity(Object.assign({}, e.oldData, e.newData));
      row['status'] = REVIEW_LIST.SUBMITTED;
      axios
      .post(`api/datasource-editor/categories/${categoryId}`, row)
      .then(({data}) => {
        if (data >= 1) {
          toast.success('Data Submitted Successfully');
          e.oldData['status'] = REVIEW_LIST.SUBMITTED;
          resolve();
        } else {
          toast.error('Data Submission Failed');
          reject('update fail');
        }
      })
      .catch(err => reject(err));
    });
  };

  const onToolbarPreparing = e => {
    e.toolbarOptions.items.unshift(
      {
        location: 'after',
        widget: 'dxButton',
        options: {
          icon: 'refresh',
          onClick: () => dispatch(getEditorDatasourceByCategoryId(Number(categoryId)))
        }
      });

    // e.toolbarOptions.items.forEach(item => {
    //   if (item.name === 'searchPanel') {
    //     item.location = 'after';
    //     item.sortOrder = 0;
    //     item.sortIndex = 0;
    //   }
    // });
  }

  return (
    <div className="data-editor-wrapper">
      <h2 id="configuration-page-heading" data-cy="configurationPageHeading">
        {category.title}
      </h2>
      <DataGrid
        dataSource={JSON.parse(JSON.stringify(datasource))}
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
        onToolbarPreparing={onToolbarPreparing}
      >
        {
          itemList.map(item => <Column
              key={item}
              dataField={item.title.toLowerCase()}
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
        <Column caption={translate("datasource.column.status")} dataField={"status"} alignment={'center'} minWidth={150}
                allowEditing={false}>
          <Lookup dataSource={[
            {id: 1, valueExpr: REVIEW_LIST.SUBMITTED, displayExpr: translate('datasource.review.submitted')},
            {id: 2, valueExpr: REVIEW_LIST.DECLINED, displayExpr: translate('datasource.review.declined')},
            {id: 3, valueExpr: REVIEW_LIST.APPROVED, displayExpr: translate('datasource.review.approved')},
          ]} displayExpr={'displayExpr'} valueExpr={'valueExpr'}/>
        </Column>
      </DataGrid>
    </div>
  );
};

export default DataEditor;
