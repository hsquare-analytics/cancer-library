import React, {useEffect, useState} from 'react';
import DndGrid from "app/modules/user-patient-dnd-grids/dnd-grid/dnd-grid";
import axios from "axios";
import DataGrid from 'devextreme-react/data-grid';
import "./user-patient-dnd-grids.scss";

export const UserPatientDndGrids = () => {
  const [selectedRowKeys, setSelectedRowKeys] = useState({
    'false': [],
    'true': [],
  });

  const [divisiblePatientList, setDivisiblePatientList] = useState([]);

  useEffect(() => {
    axios.get("api/patients/divisible-patient-list?login=admin").then(({data}) => {
      setDivisiblePatientList(data);
    });
  }, []);

  return (
    <div className="user-patient-two-grids-wrapper">
      <DataGrid
        height={'20vh'}
        showBorders={true}
        filterRow={{visible: true}}
        headerFilter={{visible: true}}
        allowColumnResizing={true}
        scrolling={{mode: 'virtual'}}
        selection={{mode: 'multiple', selectAllMode: 'allPages'}}
        keyExpr="ptNo"
      ></DataGrid>
      <div className="tables">
        <div className="column">
          <DndGrid
            authorized={false}
            selectedRowKeys={selectedRowKeys} setSelectedRowKeys={setSelectedRowKeys}
            dataSource={divisiblePatientList} setDataSource={setDivisiblePatientList} />
        </div>
        <div className="column">
          <DndGrid
            authorized={true}
            selectedRowKeys={selectedRowKeys} setSelectedRowKeys={setSelectedRowKeys}
            dataSource={divisiblePatientList} setDataSource={setDivisiblePatientList} />
        </div>
      </div>
    </div>
  );
};

export default UserPatientDndGrids;
