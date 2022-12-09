import React, {useEffect, useRef} from 'react';
import {Link, useNavigate} from 'react-router-dom';
import {Button} from 'reactstrap';
import {Translate, translate} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {getEntities} from './item.reducer';
import DataGrid, {Column} from 'devextreme-react/data-grid';
import {getDxButtonColumns} from 'app/entities/entities.utils';
import ItemColumns from 'app/entities/item/item.column';

export const Item = () => {
  const dispatch = useAppDispatch();

  const navigate = useNavigate();
  const dataGrid = useRef(null);

  const itemList = useAppSelector(state => state.item.entities);
  const loading = useAppSelector(state => state.item.loading);

  useEffect(() => {
    dispatch(getEntities({}));
  }, []);

  const handleSyncList = () => {
    dispatch(getEntities({}));
  };

  return (
    <div className="wrap-page">
      <h2 id="item-heading" data-cy="ItemHeading" className="title-page">
        <Translate contentKey="cancerLibraryApp.item.home.title">Items</Translate>
        <div className="d-flex justify-content-end">
          <Button className="me-2" color="secondary" onClick={() => dataGrid.current.instance.showColumnChooser()}>
            <FontAwesomeIcon icon="book"/>{' '}
          </Button>
          <Button className="me-2" color="info" onClick={handleSyncList} disabled={loading}>
            <FontAwesomeIcon icon="sync" spin={loading}/>{' '}
          </Button>
          <Link to="./new" className="btn btn-primary jh-create-entity" id="jh-create-entity"
                data-cy="entityCreateButton">
            <FontAwesomeIcon icon="plus"/>
          </Link>
        </div>
      </h2>
      <div className="table-responsive">
        {itemList && itemList.length > 0 ? (
          <DataGrid
            ref={dataGrid}
            dataSource={itemList}
            showBorders={true}
            filterRow={{visible: true}}
            headerFilter={{visible: true}}
            showColumnLines={true}
            showRowLines={true}
            rowAlternationEnabled={true}
            showColumnHeaders={true}
            hoverStateEnabled={true}
            allowColumnReordering={true}
            allowColumnResizing={true}
            columnResizingMode={'widget'}
            editing={{
              mode: 'row',
              useIcons: true,
              allowUpdating: true,
              allowDeleting: true,
            }}
            paging={{pageSize: 20}}
columnChooser={{mode: 'select', height: 600, width: 500, sortOrder: 'asc', allowSearch: true}}
          >
            {ItemColumns.map((column, index) => (
              <Column
                key={index}
                dataField={column.dataField}
                caption={translate('cancerLibraryApp.item.' + column.dataField)}
                dataType={column.dataType}
                visible={column.visible}
                width={column.width}
                format={column.format}
                sortIndex={column.sortIndex}
                sortOrder={column.sortOrder}
                alignment={'center'}
              />
            ))}
            <Column type="buttons" width={110} buttons={getDxButtonColumns(navigate)}/>
          </DataGrid>
        ) : (
          !loading && (
            <div className="alert alert-warning">
              <Translate contentKey="cancerLibraryApp.item.home.notFound">No Items found</Translate>
            </div>
          )
        )}
      </div>
    </div>
  );
};

export default Item;
