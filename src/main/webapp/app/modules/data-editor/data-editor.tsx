import React from 'react';
import {useParams} from 'react-router-dom';
import DataGrid from 'devextreme-react/data-grid';
import {customers} from "app/modules/data-editor/test";

const columns = ['CompanyName', 'City', 'State', 'Phone', 'Fax'];

export const DataEditor = () => {
  const {categoryId} = useParams<'categoryId'>();

  return (
    <div>
      <h2 id="configuration-page-heading" data-cy="configurationPageHeading" >
        Data Editor
      </h2>
      <DataGrid
        dataSource={customers}
        keyExpr="ID"
        defaultColumns={columns}
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
      />
    </div>
  );
};

export default DataEditor;
