import React, {useEffect} from 'react';
import {Link, useLocation, useNavigate} from 'react-router-dom';
import {Button} from 'reactstrap';
import {Translate} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {getEntities} from './subject.reducer';
import DataGrid, {Column} from 'devextreme-react/data-grid';
import SubjectColumns from "app/entities/subject/subject.column";
import {getDxButtonColumns} from "app/entities/entities.utils";

export const Subject = () => {
  const dispatch = useAppDispatch();

  const location = useLocation();
  const navigate = useNavigate();

  const subjectList = useAppSelector(state => state.subject.entities);
  const loading = useAppSelector(state => state.subject.loading);

  useEffect(() => {
    dispatch(getEntities({}));
  }, []);

  const handleSyncList = () => {
    dispatch(getEntities({}));
  };

  return (
    <div>
      <h2 id="subject-heading" data-cy="SubjectHeading">
        <Translate contentKey="cancerLibraryApp.subject.home.title">Categories</Translate>
        <div className="d-flex justify-content-end">
          <Button className="me-2" color="info" onClick={handleSyncList} disabled={loading}>
            <FontAwesomeIcon icon="sync" spin={loading}/>{' '}
          </Button>
          <Link to="./new" className="btn btn-primary jh-create-entity" id="jh-create-entity" data-cy="entityCreateButton">
            <FontAwesomeIcon icon="plus"/>
          </Link>
        </div>
      </h2>
      <div className="table-responsive">
        {subjectList && subjectList.length > 0 ? (
          <DataGrid
            dataSource={subjectList}
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
            {SubjectColumns.map((column, index) => <Column
              key={index}
              dataField={column.dataField}
              caption={column.caption}
              dataType={column.dataType}
              visible={column.visible}
              width={column.width}
              format={column.format}
              alignment={'center'}
            />)}
            <Column type="buttons" width={110} buttons={getDxButtonColumns(navigate)}/>
          </DataGrid>
        ) : (
          !loading && (
            <div className="alert alert-warning">
              <Translate contentKey="cancerLibraryApp.subject.home.notFound">No Categoies found</Translate>
            </div>
          )
        )}
      </div>
    </div>
  );
};

export default Subject;
