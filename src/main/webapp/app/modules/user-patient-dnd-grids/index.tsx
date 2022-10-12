import React, {useEffect, useState} from 'react';
import DndGrid from "app/modules/user-patient-dnd-grids/dnd-grid/dnd-grid";
import axios from "axios";
import "./user-patient-dnd-grids.scss";

export const Index = () => {
  const [selectedRowKeys, setSelectedRowKeys] = useState({
    'false': [],
    'true': [],
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
          <DndGrid
            authorized={false}
            selectedRowKeys={selectedRowKeys} setSelectedRowKeys={setSelectedRowKeys}
            dataSource={dataSource} setDataSource={setDataSource} />
        </div>
        <div className="column">
          <DndGrid
            authorized={true}
            selectedRowKeys={selectedRowKeys} setSelectedRowKeys={setSelectedRowKeys}
            dataSource={dataSource} setDataSource={setDataSource} />
        </div>
      </div>
    </div>
  );
};

export default Index;
