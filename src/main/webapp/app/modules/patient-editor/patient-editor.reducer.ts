import axios from 'axios';
import {createAsyncThunk, createSlice, isFulfilled, isPending, isRejected} from '@reduxjs/toolkit';
import {IPatient} from "app/shared/model/patient.model";

type userPatientSelectorType = {
  patients: IPatient[];
  loading: boolean,
  errorMessage: string | null;
};

const initialState: userPatientSelectorType = {
  patients: [],
  loading: false,
  errorMessage: null,
}

export const getPatients = createAsyncThunk('patient-editor/fetch_patient_list', async () => {
  const requestUrl = `api/datasource-patient/accessible-patient-list'`;
  return axios.get<IPatient[]>(requestUrl);
})

const name = 'patient-editor'
export const PatientEditor = createSlice({
  name,
  initialState,
  reducers: {
    reset() {
      return initialState
    }
  },
  extraReducers(builder) {
    builder
    .addMatcher(isFulfilled(getPatients), (state, action) => {
      const {data} = action.payload;
      return {
        ...state,
        loading: false,
        patients: data,
      }
    })
    .addMatcher(isPending(getPatients), (state) => {
      state.loading = true;
      state.errorMessage = null;
    })
    .addMatcher(isRejected(getPatients), (state, action) => {
      state.loading = false;
      state.errorMessage = action.error.message;
    });
  }
});

export const {reset} = PatientEditor.actions;

export default PatientEditor.reducer;
