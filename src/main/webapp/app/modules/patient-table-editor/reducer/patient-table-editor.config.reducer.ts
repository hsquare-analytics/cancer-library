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
    },
    setCategory(state, action) {
      return {
        ...state,
        category: action.payload
      };
    }
  },
  extraReducers(builder) {

  }
});

export const {reset, setCategory} = PatientTableEditorConfigReducer.actions;

export default PatientTableEditorConfigReducer.reducer;
