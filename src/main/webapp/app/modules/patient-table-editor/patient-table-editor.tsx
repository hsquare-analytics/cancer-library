import React, {useEffect, useState} from "react";
import {useAppDispatch, useAppSelector} from "app/config/store";
import {getPatients} from "app/modules/patient-table-editor/patient-table-editor.reducer";
import DataGrid, {Column, Lookup} from 'devextreme-react/data-grid';
import {REVIEW_LIST} from "app/config/constants";
import {translate} from 'react-jhipster';
import PatientTableEditorColumn from "./patient-table-editor.column";
import {Popup} from 'devextreme-react/popup';
import MultiTableEditor from "app/modules/patient-table-editor/multi-table-editor/multi-table-editor";
import ScrollView from 'devextreme-react/scroll-view';


export const PatientTableEditor = () => {
  const [popupVisible, setPopupVisible] = useState(false);
  const [patientNo, setPatientNo] = useState(null);

  const dispatch = useAppDispatch();
  const patientList = useAppSelector(state => state.patientTableEditor.patients);

  useEffect(() => {
    dispatch(getPatients());
  }, []);

  const onRowDblClick = (e) => {
    setPatientNo(e.data.ptNo);
    setPopupVisible(!popupVisible);
  }

  const onRowUpdating = (e) => {
    console.log(e)
  }

  return (
    <div>
      <Popup
        showTitle={false}
        visible={popupVisible}
        closeOnOutsideClick={true}
        onHiding={() => {
          setPopupVisible(false)
          setPatientNo(null);
        }}
        resizeEnabled={true}
        height={'95vh'}
        width={'95vw'}
      >
        <ScrollView width='100%' height='100%' showScrollbar={"onScroll"}>
          <MultiTableEditor patientNo={patientNo}/>
        </ScrollView>
      </Popup>
      <DataGrid
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
          allowUpdating: true,
        }}
        onRowUpdating={onRowUpdating}
        onRowDblClick={onRowDblClick}
        height={'95vh'}
        scrolling={{mode: 'virtual'}}
        selection={{mode: 'multiple'}}
      >

        {
          PatientTableEditorColumn.map(item => <Column
              key={item.dataField}
              dataField={item.dataField}
              caption={item.caption}
              visibleIndex={item.visibleIndex}
              allowEditing={false}
              alignment={'center'}
              minWidth={150}
            />
          )
        }
        <Column caption={translate("datasource.column.status")} dataField={"status"} alignment={'center'}
                minWidth={150}
                allowEditing={true}>
          <Lookup dataSource={[
            {
              id: 1,
              valueExpr: REVIEW_LIST.SUBMITTED,
              displayExpr: translate('datasource.review.submitted')
            },
            {id: 2, valueExpr: REVIEW_LIST.DECLINED, displayExpr: translate('datasource.review.declined')},
            {id: 3, valueExpr: REVIEW_LIST.APPROVED, displayExpr: translate('datasource.review.approved')},
          ]} displayExpr={'displayExpr'} valueExpr={'valueExpr'}/>
        </Column>
      </DataGrid>
    </div>
  );
};

export default PatientTableEditor;
