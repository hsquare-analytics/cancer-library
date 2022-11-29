import React, {useEffect, useRef, useState} from 'react';
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
  setPatients
} from 'app/modules/user-patient-dnd-grid/user-patient-dnd-grid.reducer';
import Swal from 'sweetalert2';
import {translate} from 'react-jhipster';
import {getIndexColumnTemplate} from 'app/shared/util/dx-utils';
import {Typography} from '@mui/material';
import CircularProgress from '@mui/material/CircularProgress';
import Box from '@mui/material/Box';


export const UserPatientDndGrid = () => {
  const dispatch = useAppDispatch();

  const [selectedUser, setSelectedUser] = useState<IUser>(null);

  const [dndSelectedRowKeys, setDndSelectedRowKeys] = useState({
    false: [],
    true: [],
  });

  const dndGridRef1 = useRef(null);
  const dndGridRef2 = useRef(null);

  const users = useAppSelector(state => state.userPatientDndGrid.users);
  const loading = useAppSelector(state => state.userManagement.loading) || useAppSelector(state => state.userPatientDndGrid.loading);
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
        // icon: 'success',
        customClass: 'cancer-dialog',
      });
      dispatch(getUsers());
      dispatch(resetFlag());
    }
  }, [updateSuccess]);

  const onSelectionChanged = ({currentSelectedRowKeys}) => {
    if (currentSelectedRowKeys.length > 0) {
      setSelectedUser(currentSelectedRowKeys[0]);
    }
  };

  const onClickSave = () => {
    if (!selectedUser) {
      Swal.fire({
        text: translate('cancerLibraryApp.userPatientDndGrid.selectUserAlert.description'),
        customClass: 'cancer-dialog',
      });
      return;
    }
    Swal.fire({
      text: translate('cancerLibraryApp.userPatientDndGrid.confirmUpdate', {name: selectedUser.login}),
      customClass: 'cancer-dialog',
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

  const onClickDndArrow = (targetSection) => {
    const result = JSON.parse(JSON.stringify(patients)).map((item) => {
      if (dndSelectedRowKeys[`${!targetSection}`].includes(item.ptNo)) {
        item.authorized = targetSection;
      }
      return item;
    });
    dispatch(setPatients(result));

    setDndSelectedRowKeys({
      'false': [],
      'true': [],
    });

    dndGridRef1.current.dataGrid.instance.clearSelection();
    dndGridRef2.current.dataGrid.instance.clearSelection();
  };

  return (
    <div className="user-patient-two-grid-wrapper">
      <div className="wrap-page">
        <h1 className="title-page">리뷰어 정보</h1>
        <DataGrid
          height={'30vh'}
          style={{minHeight: '600px'}}
          dataSource={users}
          showBorders={true}
          filterRow={{visible: true}}
          headerFilter={{visible: true}}
          allowColumnResizing={true}
          selection={{mode: 'single', showCheckBoxesMode: 'onClick'}}
          paging={{pageSize: 10}}
          onSelectionChanged={onSelectionChanged}
          loadPanel={{enabled: !loading}}
          scrolling={{mode: 'standard', showScrollbar: 'always'}}
        >
          <Column caption={'#'} cellTemplate={getIndexColumnTemplate} alignment={'center'} width={80}/>
          <Column
            dataField="id"
            caption={translate('cancerLibraryApp.userPatientDndGrid.column.id')}
            alignment={'center'}
            visible={false}
            sortIndex={0}
            sortOrder={'asc'}
          />
          <Column dataField="login" caption={translate('cancerLibraryApp.userPatientDndGrid.column.login')}
                  alignment={'center'}/>
          <Column dataField="name" caption={translate('cancerLibraryApp.userPatientDndGrid.column.name')}
                  alignment={'center'}/>
          <Column dataField="authority" caption={translate('cancerLibraryApp.userPatientDndGrid.column.authority')}
                  alignment={'center'}/>
          <Column dataField="assigned" caption={translate('cancerLibraryApp.userPatientDndGrid.column.assigned')}
                  alignment={'center'}/>
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
            <Column dataField="approved" caption={translate('cancerLibraryApp.userPatientDndGrid.column.approved')}
                    alignment={'center'}/>
            <Column dataField="declined" caption={translate('cancerLibraryApp.userPatientDndGrid.column.declined')}
                    alignment={'center'}/>
          </Column>
        </DataGrid>
        <Stack spacing={1} direction="row" className="justify-content-end my-3">
          <Button variant="contained" onClick={onClickSave}>
            {translate('cancerLibraryApp.userPatientDndGrid.button.save')}
          </Button>
          <Button variant="outlined" onClick={onClickCancel} className="btn-outline">
            {translate('cancerLibraryApp.userPatientDndGrid.button.cancel')}
          </Button>
        </Stack>
      </div>

      <div className="wrap-page">
        <h1 className="title-page d-flex">
          <Typography variant={'h5'}> {selectedUser ? `${selectedUser.name} (${selectedUser?.login}) - ` : null}
            {translate('cancerLibraryApp.userPatientDndGrid.dndGuide.title')}
            <HelpOutlineOutlinedIcon/>
          </Typography>
          <span className="patient-text">
            {translate('cancerLibraryApp.userPatientDndGrid.dndGuide.description')}
          </span>
        </h1>

        {!loading ? <div className="tables">
            <div className="column">
              <DndGrid
                ref={dndGridRef1}
                authorized={false} selectedRowKeys={dndSelectedRowKeys}
                setSelectedRowKeys={setDndSelectedRowKeys}/>
            </div>
            <div className="column d-flex align-items-center">
              <Stack spacing={2} direction="column">
                <Button variant="text" onClick={() => onClickDndArrow(true)}>
                  <FontAwesomeIcon icon="arrow-right" size={'2x'}/>
                </Button>
                <Button variant="text" onClick={() => onClickDndArrow(false)}>
                  <FontAwesomeIcon icon="arrow-left" size={'2x'}/>
                </Button>
              </Stack>
            </div>
            <div className="column">
              <DndGrid
                ref={dndGridRef2}
                authorized={true} selectedRowKeys={dndSelectedRowKeys}
                setSelectedRowKeys={setDndSelectedRowKeys}/>
            </div>
          </div>
          : <Box sx={{display: 'flex'}}>
            <CircularProgress/>
          </Box>}
      </div>
    </div>
  );
};

export default UserPatientDndGrid;
