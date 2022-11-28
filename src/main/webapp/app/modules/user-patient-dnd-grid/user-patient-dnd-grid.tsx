import React, {useEffect, useState} from 'react';
import DndGrid from 'app/modules/user-patient-dnd-grid/dnd-grid/dnd-grid';
import DataGrid, {Column} from 'devextreme-react/data-grid';
import './user-patient-dnd-grid.scss';
import {useAppDispatch, useAppSelector} from 'app/config/store';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import HelpOutlineOutlinedIcon from '@mui/icons-material/HelpOutlineOutlined';

import Stack from '@mui/material/Stack';
import Button from '@mui/material/Button';
import {IUser} from 'app/shared/model/user.model';
import {
  createUserPatientAuthorizations,
  getPatients,
  getUsers,
  resetFlag,
} from 'app/modules/user-patient-dnd-grid/user-patient-dnd-grid.reducer';
import Swal from 'sweetalert2';
import {translate} from 'react-jhipster';
import {getIndexColumnTemplate} from 'app/shared/util/dx-utils';

export const UserPatientDndGrid = () => {
  const dispatch = useAppDispatch();

  const [selectedUser, setSelectedUser] = useState<IUser>(null);

  const [dndSelectedRowKeys, setDndSelectedRowKeys] = useState({
    false: [],
    true: [],
  });

  const users = useAppSelector(state => state.userPatientDndGrid.users);
  const loading = useAppSelector(state => state.userManagement.loading);
  const patients = useAppSelector(state => state.userPatientDndGrid.patients);
  const updateSuccess = useAppSelector(state => state.userPatientDndGrid.updateSuccess);

  useEffect(() => {
    if (users.length === 0) {
      dispatch(getUsers());
    }
  }, []);

  useEffect(() => {
    if (selectedUser) {
      dispatch(getPatients(selectedUser.login));
    }
  }, [JSON.stringify(selectedUser)]);

  useEffect(() => {
    if (updateSuccess) {
      Swal.fire({
        text: translate('cancerLibraryApp.userPatientDndGrid.updateAlert.description', {name: selectedUser.login}),
        icon: 'success',
      });
      dispatch(getUsers())
      dispatch(resetFlag());
    }
  }, [updateSuccess]);

  const onSelectionChanged = ({currentSelectedRowKeys}) => {
    setSelectedUser(currentSelectedRowKeys[0]);
  };

  const onClickSave = () => {
    Swal.fire({
      text: translate('cancerLibraryApp.userPatientDndGrid.confirmUpdate', {name: selectedUser.login}),
      icon: 'warning',
      showCancelButton: true,
    }).then(result => {
      if (result.isConfirmed) {
        dispatch(createUserPatientAuthorizations({login: selectedUser.login, patients}));
      }
    });
  };

  const onClickCancel = () => {
    dispatch(getPatients(selectedUser.login));
  };

  return (
    <div className="user-patient-two-grid-wrapper">
      <div className="wrap-page">
        <h1 className="title-page">리뷰어 정보</h1>
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
          <Column caption={'#'} cellTemplate={getIndexColumnTemplate} alignment={'center'} width={80} />
          <Column
            dataField="id"
            caption={translate('cancerLibraryApp.userPatientDndGrid.column.id')}
            alignment={'center'}
            visible={false}
          />
          <Column dataField="login" caption={translate('cancerLibraryApp.userPatientDndGrid.column.login')} alignment={'center'} />
          <Column dataField="name" caption={translate('cancerLibraryApp.userPatientDndGrid.column.name')} alignment={'center'} />
          <Column dataField="assigned" caption={translate('cancerLibraryApp.userPatientDndGrid.column.assigned')} alignment={'center'} />
          <Column
            caption={translate('cancerLibraryApp.userPatientDndGrid.column.missed')}
            alignment={'center'}
            calculateCellValue={rowData => {
              return rowData.assigned - rowData.submitted - rowData.approved - rowData.declined;
            }}
          />
          <Column caption={translate('cancerLibraryApp.userPatientDndGrid.column.summary')} alignment={'center'}>
            <Column
              dataField="submitted"
              caption={translate('cancerLibraryApp.userPatientDndGrid.column.submitted')}
              alignment={'center'}
            />
            <Column dataField="approved" caption={translate('cancerLibraryApp.userPatientDndGrid.column.approved')} alignment={'center'} />
            <Column dataField="declined" caption={translate('cancerLibraryApp.userPatientDndGrid.column.declined')} alignment={'center'} />
          </Column>
        </DataGrid>
        <Stack spacing={1} direction="row" className="justify-content-end my-3">
          <Button variant="contained" onClick={onClickSave}>
            저장
          </Button>
          <Button variant="outlined" onClick={onClickCancel} className="btn-outline">
            취소
          </Button>
        </Stack>
      </div>

      <div className="wrap-page">
        <h1 className="title-page">
          데이터 할당 <HelpOutlineOutlinedIcon />
          <span className="patient-text">원하는 데이터셋을 우측 대시보드 영역으로 드래그앤 드롭합니다.</span>
        </h1>

        <div className="tables">
          <div className="column">
            <DndGrid authorized={false} selectedRowKeys={dndSelectedRowKeys} setSelectedRowKeys={setDndSelectedRowKeys} />
          </div>
          <div className="column d-flex align-items-center">
            <FontAwesomeIcon icon="arrow-right" size={'2x'} />
          </div>
          <div className="column">
            <DndGrid authorized={true} selectedRowKeys={dndSelectedRowKeys} setSelectedRowKeys={setDndSelectedRowKeys} />
          </div>
        </div>
      </div>
    </div>
  );
};

export default UserPatientDndGrid;
