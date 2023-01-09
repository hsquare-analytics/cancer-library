import React, {useEffect} from 'react';
import {useAppDispatch, useAppSelector} from "app/config/store";
import {getEntities} from "app/modules/administration/audit/audit.reducer";
import {Link} from 'react-router-dom';
import {Button} from 'reactstrap';
import {Translate, translate} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import DataGrid, {Column} from 'devextreme-react/data-grid';
import AuditColumns from "app/modules/administration/audit/audit.column";

export const Audit = () => {
  const dispatch = useAppDispatch();


  const getAuditEntities = () => {
    dispatch(getEntities());
  };


  useEffect(() => {
    dispatch(getEntities());
  }, []);

  const audits = useAppSelector(state => state.audit.entities);
  const loading = useAppSelector(state => state.audit.loading);
  return (
    <div className="wrap-page">
      <h2 id="userManagement-heading" data-cy="CategoryHeading" className="title-page">
        <Translate contentKey="audit.home.title">Categories</Translate>
        <div className="d-flex justify-content-end">
          <Button className="me-2" color="info" onClick={() => getAuditEntities()} disabled={loading}>
            <FontAwesomeIcon icon="sync" spin={loading}/>{' '}
          </Button>
          <Link to="./new" className="btn btn-primary jh-create-entity" id="jh-create-entity"
                data-cy="entityCreateButton">
            <FontAwesomeIcon icon="plus"/>
          </Link>
        </div>
      </h2>
      <div className="table-responsive">
        {audits && audits.length > 0 ? (
          <DataGrid
            dataSource={audits}
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
            {AuditColumns.map((column, index) => <Column
              key={index}
              dataField={column.dataField}
              caption={translate('audit.' + column.dataField)}
              dataType={column.dataType}
              visible={column.visible}
              width={column.width}
              format={column.format}
              sortIndex={column.sortIndex}
              sortOrder={column.sortOrder}
              alignment={'center'}
            />)}
          </DataGrid>) : null}
      </div>
    </div>
  );
};

export default Audit;
