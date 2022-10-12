import React, {useEffect, useState} from 'react';
import DndGrid from "app/modules/user-patient-dnd-grids/dnd-grid/dnd-grid";
import axios from "axios";
import DataGrid, {Column} from 'devextreme-react/data-grid';
import "./user-patient-dnd-grids.scss";
import {useAppDispatch, useAppSelector} from "app/config/store";
import {getUsers} from "app/modules/administration/user-management/user-management.reducer";
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';

export const UserPatientDndGrids = () => {
  const dispatch = useAppDispatch();

  const [dndSelectedRowKeys, setDndSelectedRowKeys] = useState({
    'false': [],
    'true': [],
  });

  const users = useAppSelector(state => state.userManagement.users);

  const [divisiblePatientList, setDivisiblePatientList] = useState([]);

  useEffect(() => {
    axios.get("api/patients/divisible-patient-list?login=admin").then(({data}) => {
      setDivisiblePatientList(data);
    });

    if (users.length === 0) {
      dispatch(getUsers({}));
    }
  }, []);

  const onSelectionChanged = ({currentSelectedRowKeys}) => {
  }

  return (
    <div className="user-patient-two-grids-wrapper">
      <DataGrid
        height={'25vh'}
        dataSource={users}
        showBorders={true}
        filterRow={{visible: true}}
        headerFilter={{visible: true}}
        allowColumnResizing={true}
        selection={{mode: 'single', showCheckBoxesMode: 'onClick'}}
        paging={{pageSize: 5}}
        width={'25%'}
        onSelectionChanged={onSelectionChanged}
      >
        <Column dataField="id" caption="id" alignment={"center"}/>
        <Column dataField="login" caption="Login" alignment={"center"}/>
      </DataGrid>
      <div className="tables">
        <div className="column">
          <DndGrid
            authorized={false}
            selectedRowKeys={dndSelectedRowKeys} setSelectedRowKeys={setDndSelectedRowKeys}
            dataSource={divisiblePatientList} setDataSource={setDivisiblePatientList}/>
        </div>
        <div className="column d-flex align-items-center">
          <FontAwesomeIcon icon="arrow-right" size={"2x"}/>
        </div>
        <div className="column">
          <DndGrid
            authorized={true}
            selectedRowKeys={dndSelectedRowKeys} setSelectedRowKeys={setDndSelectedRowKeys}
            dataSource={divisiblePatientList} setDataSource={setDivisiblePatientList}/>
        </div>
      </div>
    </div>
  );
};

export default UserPatientDndGrids;
