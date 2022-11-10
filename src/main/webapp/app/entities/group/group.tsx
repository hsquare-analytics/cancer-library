import React, {useEffect} from 'react';
import {Link, useNavigate} from 'react-router-dom';
import {Button} from 'reactstrap';
import {Translate} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {getEntities} from './group.reducer';
import DataGrid, {Column} from 'devextreme-react/data-grid';
import {getDxButtonColumns} from "app/entities/entities.utils";
import GroupColumns from "app/entities/group/group.column";


export const Group = () => {
  const dispatch = useAppDispatch();

  const navigate = useNavigate();

  const groupList = useAppSelector(state => state.group.entities);
  const loading = useAppSelector(state => state.group.loading);

  useEffect(() => {
    dispatch(getEntities({}));
  }, []);

  const handleSyncList = () => {
    dispatch(getEntities({}));
  };

  return (
    <div>
      <h2 id="group-heading" data-cy="SubjectHeading">
        <Translate contentKey="cancerLibraryApp.group.home.title">Categories</Translate>
        <div className="d-flex justify-content-end">
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
        {groupList && groupList.length > 0 ? (
          <DataGrid
            dataSource={groupList}
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
            {GroupColumns.map((column, index) => <Column
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
              <Translate contentKey="cancerLibraryApp.group.home.notFound">No Categoies found</Translate>
            </div>
          )
        )}
      </div>
    </div>
  );
};

export default Group;
