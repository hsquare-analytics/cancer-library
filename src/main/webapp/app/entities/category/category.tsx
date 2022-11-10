import React, {useEffect} from 'react';
import {Link, useNavigate} from 'react-router-dom';
import {Button} from 'reactstrap';
import {Translate} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {getEntities} from './category.reducer';
import DataGrid, {Column} from 'devextreme-react/data-grid';
import {getDxButtonColumns} from "app/entities/entities.utils";
import CategoryColumns from "app/entities/category/category.column";

export const Category = () => {
  const dispatch = useAppDispatch();

  const navigate = useNavigate();

  const categoryList = useAppSelector(state => state.category.entities);
  const loading = useAppSelector(state => state.category.loading);

  useEffect(() => {
    dispatch(getEntities({}));
  }, []);

  const handleSyncList = () => {
    dispatch(getEntities({}));
  };

  return (
    <div>
      <h2 id="category-heading" data-cy="CategoryHeading">
        <Translate contentKey="cancerLibraryApp.category.home.title">Categories</Translate>
        <div className="d-flex justify-content-end">
          <Button className="me-2" color="info" onClick={handleSyncList} disabled={loading}>
            <FontAwesomeIcon icon="sync" spin={loading} />{' '}
          </Button>
          <Link to="./new" className="btn btn-primary jh-create-entity" id="jh-create-entity" data-cy="entityCreateButton">
            <FontAwesomeIcon icon="plus" />
          </Link>
        </div>
      </h2>
      <div className="table-responsive">
        {categoryList && categoryList.length > 0 ? (
          <DataGrid
            dataSource={categoryList}
            showBorders={true}
            filterRow={{visible: false}}
            headerFilter={{visible: true}}
            showColumnLines={true}
            showRowLines={true}
            rowAlternationEnabled={true}
            showColumnHeaders={true}
            editing={{
              mode: "row",
              useIcons: true,
              allowUpdating: true,
              allowDeleting: true
            }}
          >
            {CategoryColumns.map((column, index) => <Column
              key={index}
              dataField={column.dataField}
              caption={column.caption}
              dataType={column.dataType}
              visible={column.visible}
              width={column.width}
              format={column.format}
              sortIndex={column.sortIndex}
              sortOrder={column.sortOrder}
              alignment={'center'}
            />)}
            <Column type="buttons" width={110} buttons={getDxButtonColumns(navigate)}/>
          </DataGrid>
        ) : (
          !loading && (
            <div className="alert alert-warning">
              <Translate contentKey="cancerLibraryApp.category.home.notFound">No Categoies found</Translate>
            </div>
          )
        )}
      </div>
    </div>
  );
};

export default Category;
