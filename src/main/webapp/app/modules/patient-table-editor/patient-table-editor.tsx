import React, {useEffect, useRef, useState} from "react";
import {useAppDispatch, useAppSelector} from "app/config/store";
import {
  getEntities as getAccessiblePatients,
  getEntity as getPatient,
  updateEntity as updatePatient,
} from "app/modules/patient-table-editor/reducer/patient-table-editor.patient.reducer";
import DataGrid, {Column, Lookup} from 'devextreme-react/data-grid';
import {AUTHORITIES, REVIEW_LIST} from "app/config/constants";
import {translate} from 'react-jhipster';
import PatientTableEditorColumn from "./patient-table-editor.column";
import {Popup} from 'devextreme-react/popup';
import MultiTableEditor from "app/modules/patient-table-editor/multi-table-editor/multi-table-editor";
import ScrollView from 'devextreme-react/scroll-view';
import {cleanEntity} from "app/shared/util/entity-utils";
import {toast} from 'react-toastify';
import PatientProfileCard from "app/modules/patient-table-editor/patient-profile/patient-profile-card";
import {hasAnyAuthority} from "app/shared/auth/private-route";
import PatientTableEditorStackButton
  from "app/modules/patient-table-editor/stack-button/patient-table-editor-stack-button";
import {getIndexColumnTemplate} from "app/shared/util/dx-utils";
import "./patient-table-editor.scss";

export const PatientTableEditor = () => {
  const dispatch = useAppDispatch();

  const dataGrid = useRef(null);

  const [popupVisible, setPopupVisible] = useState(false);

  const canReview = useAppSelector(state => hasAnyAuthority(state.authentication.account.authorities, [AUTHORITIES.ADMIN, AUTHORITIES.SUPERVISOR]));
  const patient = useAppSelector(state => state.patientTableEditorPatient.entity);
  const patientList = useAppSelector(state => state.patientTableEditorPatient.entities);
  const updateSuccess = useAppSelector(state => state.patientTableEditorPatient.updateSuccess);

  useEffect(() => {
    dispatch(getAccessiblePatients());
  }, []);

  useEffect(() => {
    if (updateSuccess) {
      toast.success(translate("cancerLibraryApp.patientTableEditor.updateSuccess", {
        no: patient.ptNo,
        name: patient.ptNm
      }));
    }

  }, [updateSuccess]);

  const onRowDblClick = (e) => {
    dispatch(getPatient(e.data.ptNo));
    setPopupVisible(!popupVisible);
  }

  const onRowUpdating = (e) => {
    e.cancel = new Promise<void>((resolve) => {
      const row = cleanEntity(Object.assign({}, e.oldData, e.newData));
      dispatch(updatePatient(row));
      resolve();
    });
  }

  return <div>
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
      ref={dataGrid}
      dataSource={JSON.parse(JSON.stringify(patientList))}
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
      <Column caption={'#'} cellTemplate={getIndexColumnTemplate} alignment={'center'} width={80}/>
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
};

export default PatientTableEditor;
