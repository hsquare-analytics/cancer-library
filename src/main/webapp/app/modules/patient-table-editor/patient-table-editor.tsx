import React, {useEffect} from "react";
import {useAppDispatch, useAppSelector} from "app/config/store";
import {getPatients} from "app/modules/patient-table-editor/patient-table-editor.reducer";

export const PatientTableEditor = () => {
  const dispatch = useAppDispatch();
  const patientList = useAppSelector(state => state.patientTableEditor.patients);

  useEffect(() => {
    dispatch(getPatients());
  }, []);

  return (
    <div>
      <h1>Patient Editor</h1>
      {JSON.stringify(patientList)}
    </div>
  );
};

export default PatientTableEditor;
