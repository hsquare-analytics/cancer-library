import React, {useEffect, useState} from "react";
import {useAppDispatch, useAppSelector} from "app/config/store";
import {getAccessiblePatients, getPatient} from "app/modules/patient-table-editor/patient-table-editor.reducer";
import DataGrid, {Column, Lookup} from 'devextreme-react/data-grid';
import {AUTHORITIES, REVIEW_LIST} from "app/config/constants";
import {translate} from 'react-jhipster';
import PatientTableEditorColumn from "./patient-table-editor.column";
import {Popup} from 'devextreme-react/popup';
import MultiTableEditor from "app/modules/patient-table-editor/multi-table-editor/multi-table-editor";
import ScrollView from 'devextreme-react/scroll-view';
import {cleanEntity} from "app/shared/util/entity-utils";
import {toast} from 'react-toastify';
import axios from "axios";
import PatientProfileCard from "app/modules/patient-table-editor/patient-profile/patient-profile-card";
import {hasAnyAuthority} from "app/shared/auth/private-route";
import CircularProgress from '@mui/material/CircularProgress';
import PatientTableEditorStackButton from "app/modules/patient-table-editor/patient-table-editor-stack-button";
import Box from '@mui/material/Box';
import {getIndexColumnTemplate} from "app/shared/util/dx-utils";
import "./patient-table-editor.scss";

export const PatientTableEditor = () => {
  const dispatch = useAppDispatch();

  const [popupVisible, setPopupVisible] = useState(false);

  const canReview = useAppSelector(state => hasAnyAuthority(state.authentication.account.authorities, [AUTHORITIES.ADMIN, AUTHORITIES.SUPERVISOR]));
  const patientList = useAppSelector(state => state.patientTableEditor.patients);
  const loading = useAppSelector(state => state.patientTableEditor.loading.patients);

  useEffect(() => {
    dispatch(getAccessiblePatients());
  }, []);

  const onRowDblClick = (e) => {
    dispatch(getPatient(e.data.ptNo));
    setPopupVisible(!popupVisible);
  }

  const onRowUpdating = (e) => {
    e.cancel = new Promise<void>((resolve, reject) => {
      const row = cleanEntity(Object.assign({}, e.oldData, e.newData));
      axios
      .patch(`api/patients/${row.ptNo}`, row)
      .then(({data}) => {
        if (data >= 1) {
          toast.success(translate("cancerLibraryApp.patientTableEditor.updateSuccess", {no: row.ptNo, name: row.ptNm}));
          dispatch(getPatient(row.ptNo));
          resolve();
        } else {
          toast.error(translate("cancerLibraryApp.patientTableEditor.updateFailed", {no: row.ptNo, name: row.ptNm}));
          reject('Updated Fail');
        }
      })
      .catch(err => reject(err));
    });
  }

  return !loading ? (
    <div>
      <Popup
        showTitle={false}
        visible={popupVisible}
        onHiding={() => setPopupVisible(false)}
        resizeEnabled={true}
        height={'95vh'}
        width={'95vw'}
      >
        <ScrollView width='100%' height='100%' showScrollbar={"onScroll"}>
          <PatientProfileCard/>
          <PatientTableEditorStackButton setPopupVisible={setPopupVisible}/>
          <MultiTableEditor/>
        </ScrollView>
      </Popup>
      <DataGrid
        dataSource={patientList}
        showBorders={true}
        filterRow={{visible: true}}
        headerFilter={{visible: true}}
        searchPanel={{visible: true}}
        allowColumnResizing={true}
        pager={{displayMode: 'compact', showNavigationButtons: true}}
        editing={{
          mode: 'row',
          allowAdding: false,
          allowUpdating: canReview,
        }}
        onRowUpdating={(e) => onRowUpdating(e)}
        onRowDblClick={onRowDblClick}
        height={'95vh'}
        selection={{mode: 'multiple'}}
        hoverStateEnabled={true}
        paging={{pageSize: 30}}
      >
        <Column caption={'#'} cellTemplate={getIndexColumnTemplate} alignment={'center'}/>
        {
          PatientTableEditorColumn.map(item => <Column
              key={item.dataField}
              dataField={item.dataField}
              caption={translate("cancerLibraryApp.patient." + item.dataField)}
              dataType={item.dataType}
              visibleIndex={item.visibleIndex}
              allowEditing={false}
              alignment={'center'}
              minWidth={150}
            />
          )
        }
        <Column caption={translate("cancerLibraryApp.patientTableEditor.column.status")} dataField={"status"}
                alignment={'center'}
                minWidth={150} allowEditing={true}>
          <Lookup dataSource={[
            {
              id: 1,
              valueExpr: REVIEW_LIST.SUBMITTED,
              displayExpr: translate('cancerLibraryApp.patientTableEditor.review.submitted')
            },
            {
              id: 2,
              valueExpr: REVIEW_LIST.DECLINED,
              displayExpr: translate('cancerLibraryApp.patientTableEditor.review.declined')
            },
            {
              id: 3,
              valueExpr: REVIEW_LIST.APPROVED,
              displayExpr: translate('cancerLibraryApp.patientTableEditor.review.approved')
            },
          ]} displayExpr={'displayExpr'} valueExpr={'valueExpr'}/>
        </Column>
      </DataGrid>
    </div>
  ) : <Box sx={{display: 'flex', justifyContent: 'center', alignItems: 'center', height: '80vh', width: '0vh'}}>
    <CircularProgress/>
  </Box>;
};

export default PatientTableEditor;
