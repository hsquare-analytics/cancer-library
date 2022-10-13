import React, {useEffect, useState} from 'react';
import DndGrid from "app/modules/user-patient-dnd-grid/dnd-grid/dnd-grid";
import DataGrid, {Column} from 'devextreme-react/data-grid';
import "./user-patient-dnd-grid.scss";
import {useAppDispatch, useAppSelector} from "app/config/store";
import {getUsers} from "app/modules/administration/user-management/user-management.reducer";
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import Stack from '@mui/material/Stack';
import Button from '@mui/material/Button';
import {IUser} from "app/shared/model/user.model";
import {
  createUserPatientAuthorizations,
  getPatients
} from "app/modules/user-patient-dnd-grid/user-patient-dnd-grid.reducer";
import Swal from "sweetalert2";


export const UserPatientDndGrid = () => {
  const dispatch = useAppDispatch();

  const [selectedUser, setSelectedUser] = useState<IUser>(null);

  const [dndSelectedRowKeys, setDndSelectedRowKeys] = useState({
    'false': [],
    'true': [],
  });

  const users = useAppSelector(state => state.userManagement.users);
  const loading = useAppSelector(state => state.userManagement.loading);
  const patients = useAppSelector(state => state.userPatientDndGrid.patients);
  const updateSuccess = useAppSelector(state => state.userPatientDndGrid.updateSuccess);

  useEffect(() => {
    if (users.length === 0) {
      dispatch(getUsers({}));
    }
  }, []);

  useEffect(() => {
    if (selectedUser) {
      dispatch(getPatients(selectedUser.login));
    }
  }, [JSON.stringify(selectedUser)]);

  useEffect(() => {
    if (updateSuccess) {
      Swal.fire(
        'Good job!',
        'You clicked the button!',
        'success'
      )
    }
  }, [updateSuccess]);


  const onSelectionChanged = ({currentSelectedRowKeys}) => {
    setSelectedUser(currentSelectedRowKeys[0]);
  }

  const onClickSave = () => {
    dispatch(createUserPatientAuthorizations({login: selectedUser.login, patients}));
  };

  const onClickCancel = () => {
    dispatch(getPatients(selectedUser.login));
  };

  return (
    <div className="user-patient-two-grid-wrapper">
      <div className="">
        <DataGrid
          height={'25vh'}
          dataSource={users}
          showBorders={true}
          filterRow={{visible: true}}
          headerFilter={{visible: true}}
          allowColumnResizing={true}
          selection={{mode: 'single', showCheckBoxesMode: 'onClick'}}
          paging={{pageSize: 10}}
          onSelectionChanged={onSelectionChanged}
          loadPanel={{enabled: !loading}}
        >
          <Column dataField="id" caption="id" alignment={"center"}/>
          <Column dataField="login" caption="Login" alignment={"center"}/>
        </DataGrid>
        <Stack spacing={2} direction="row" className="justify-content-end my-3">
          <Button variant="contained" onClick={onClickSave}>저장</Button>
          <Button variant="outlined" onClick={onClickCancel}>취소</Button>
        </Stack>
      </div>
      <div className="tables">
        <div className="column">
          <DndGrid
            authorized={false}
            selectedRowKeys={dndSelectedRowKeys} setSelectedRowKeys={setDndSelectedRowKeys}
          />
        </div>
        <div className="column d-flex align-items-center">
          <FontAwesomeIcon icon="arrow-right" size={"2x"}/>
        </div>
        <div className="column">
          <DndGrid
            authorized={true}
            selectedRowKeys={dndSelectedRowKeys} setSelectedRowKeys={setDndSelectedRowKeys}
          />
        </div>
      </div>
    </div>
  )
};

export default UserPatientDndGrid;
