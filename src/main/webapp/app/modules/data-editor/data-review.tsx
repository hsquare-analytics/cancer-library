import React, {useEffect} from 'react';
import {useParams} from 'react-router-dom';
import DataGrid, {Column, Lookup} from 'devextreme-react/data-grid';
import {useAppDispatch, useAppSelector} from "app/config/store";
import {
  getCategoryById,
  getItemListByCategoryId,
  getReviewDatasourceByCategoryId,
  reset
} from "app/modules/data-editor/data-editor.reducer";
import {cleanEntity} from "app/shared/util/entity-utils";
import axios from "axios";
import {toast} from 'react-toastify';
import {APP_DX_DATE_FORMAT, AUTHORITIES, REVIEW_LIST} from "app/config/constants";
import {hasAnyAuthority} from "app/shared/auth/private-route";

export const DataReview = () => {
  const dispatch = useAppDispatch();

  const datasource = useAppSelector(state => state.dataEditorReducer.datasource);
  const itemList = useAppSelector(state => state.dataEditorReducer.items);
  const category = useAppSelector(state => state.dataEditorReducer.category);
  const loading = useAppSelector(state => state.dataEditorReducer.loading);
  const isAdmin = useAppSelector(state => hasAnyAuthority(state.authentication.account.authorities, [AUTHORITIES.ADMIN]));

  const {categoryId} = useParams<'categoryId'>();

  useEffect(() => {
    const id = Number(categoryId);
    dispatch(getReviewDatasourceByCategoryId(id));
    dispatch(getItemListByCategoryId(id));
    dispatch(getCategoryById(id));
    return () => {
      reset();
    }
  }, [categoryId]);

  const onRowUpdating = e => {
    e.cancel = new Promise<void>((resolve, reject) => {
      const row = cleanEntity(Object.assign({}, e.oldData, e.newData));
      axios
      .post(`api/datasource-editor/categories/${categoryId}`, row)
      .then(({data}) => {
        if (data >= 1) {
          toast.success('Data Submitted Successfully');
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
    e.toolbarOptions.items.unshift({
        location: 'after',
        widget: 'dxButton',
        options: {
          icon: 'upload',
        }
      },
      {
        location: 'after',
        widget: 'dxButton',
        options: {
          icon: 'refresh',
          onClick: () => dispatch(getReviewDatasourceByCategoryId(Number(categoryId)))
        }
      });
  }

  return (
    <div>
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
        <Column caption="생성인" dataField={"created_by"} alignment={"center"} minWidth={150} allowEditing={false}/>
        <Column caption="생성일" dataField={"created_date"} dataType="date" format={APP_DX_DATE_FORMAT} alignment={"center"} minWidth={150} allowEditing={false}/>
        <Column caption="최종 수정인" dataField={"last_modified_by"} alignment={"center"} minWidth={150} allowEditing={false}/>
        <Column caption="취종 수정일" dataField={"last_modified_date"} dataType="date" format={APP_DX_DATE_FORMAT} alignment={"center"} minWidth={150} allowEditing={false}/>
        <Column caption={"상태"} dataField={"status"} alignment={'center'} minWidth={150} allowEditing={true}>
          <Lookup dataSource={Object.values(REVIEW_LIST)}/>
        </Column>
      </DataGrid>
    </div>
  );
};

export default DataReview;
