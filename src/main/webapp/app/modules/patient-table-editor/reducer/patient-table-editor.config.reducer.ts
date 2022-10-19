import {createSlice} from '@reduxjs/toolkit';

const initialState = {
  category: "",
  loading: false,
  errorMessage: null,
  updating: false,
  updateSuccess: false,
};

const name = 'patient-table-editor-config';
export const PatientTableEditorConfigReducer = createSlice({
  name,
  initialState,
  reducers: {
    reset() {
      return initialState;
    }
  },
  extraReducers(builder) {

  }
});

export const {reset} = PatientTableEditorConfigReducer.actions;

export default PatientTableEditorConfigReducer.reducer;
