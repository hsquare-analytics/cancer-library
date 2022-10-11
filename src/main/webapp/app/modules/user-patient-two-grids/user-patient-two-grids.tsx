import React, {useEffect, useState} from 'react';
import Grid from "app/modules/user-patient-two-grids/grid";
import axios from "axios";
import "./user-patient-two-grids.scss";

export const UserPatientTwoGrids = () => {
  const [selectedRowKeys, setSelectedRowKeys] = useState({
    'left': [],
    'right': [],
  });

  const [dataSource, setDataSource] = useState([]);

  useEffect(() => {
    axios.get("api/patients/divisible-patient-list?login=admin").then(({data}) => {
      setDataSource(data);
    });
  }, []);

  return (
    <div className="user-patient-two-grids-wrapper">
      <div className="tables">
        <div className="column">
          <Grid
            authorized={false}
            selectedRowKeys={selectedRowKeys} setSelectedRowKeys={setSelectedRowKeys}
            dataSource={dataSource} setDataSource={setDataSource} />
        </div>
        <div className="column">
          <Grid
            authorized={true}
            selectedRowKeys={selectedRowKeys} setSelectedRowKeys={setSelectedRowKeys}
            dataSource={dataSource} setDataSource={setDataSource} />
        </div>
      </div>
    </div>
  );
};

export default UserPatientTwoGrids;
