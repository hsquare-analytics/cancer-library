import React, {useEffect, useRef} from 'react';
import {Link, useNavigate} from 'react-router-dom';
import {Badge, Button} from 'reactstrap';
import {Translate, translate} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {getUsersAsAdmin, updateUser} from './user-management.reducer';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import DataGrid, {Column} from 'devextreme-react/data-grid';
import UserManagementColumns from "app/modules/administration/user-management/user-management.column";

export const UserManagement = () => {
  const dispatch = useAppDispatch();

  const navigate = useNavigate();
  const dataGrid = useRef(null);

  const getUsersFromProps = () => {
    dispatch(getUsersAsAdmin({}));
  };

  useEffect(() => {
    getUsersFromProps();
  }, []);

  const handleSyncList = () => {
    getUsersFromProps();
  };

  const toggleActive = user => () => {
    dispatch(
      updateUser({
        ...user,
        activated: !user.activated,
      })
    );
  };

  const users = useAppSelector(state => state.userManagement.users);
  const loading = useAppSelector(state => state.userManagement.loading);

  const ProfileColumn = <Column dataField={"profiles"} cellRender={({data}) => {
    const authorities = data.authorities;
    return <div>
      {authorities
        ? authorities.map((authority, j) => {
          return <Badge key={authority + j} color="info">{authority}</Badge>;
        })
        : null}
    </div>;
  }}/>

  return (
    <div className="wrap-page">
      <h2 id="userManagement-heading" data-cy="CategoryHeading" className="title-page">
        <Translate contentKey="userManagement.home.title">Categories</Translate>
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
        {users && users.length > 0 ? (
          <DataGrid
            ref={dataGrid}
            dataSource={users}
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
            {UserManagementColumns.map((column, index) => {
              if (column.dataField === 'profiles') {
                return ProfileColumn;
              }
              return <Column
                key={index}
                dataField={column.dataField}
                caption={translate('userManagement.' + column.dataField)}
                dataType={column.dataType}
                visible={column.visible}
                width={column.width}
                format={column.format}
                sortIndex={column.sortIndex}
                sortOrder={column.sortOrder}
                alignment={'center'}
              />
            })}
            <Column type="buttons" width={110} buttons={[
              {hint: "View", icon: "check", onClick: (e) => navigate(`./${e.row.data.login}`)},
              {hint: "Edit", icon: "edit", onClick: (e) => navigate(`./${e.row.data.login}/edit`)},
              {hint: "Delete", icon: "trash", onClick: (e) => navigate(`./${e.row.data.login}/delete`)}
            ]}/>

          </DataGrid>
        ) : (
          !loading && (
            <div className="alert alert-warning">
              <Translate contentKey="cancerLibraryApp.userManagement.home.notFound">No Categoies found</Translate>
            </div>
          )
        )}
      </div>
    </div>
  );
};

export default UserManagement;
