import axios from "axios";
import {createAsyncThunk, createSlice} from "@reduxjs/toolkit";

const name = 'userPatientDndGrids';

const initialState = {
  patients: [],
  loading: false,
  errorMessage: null,
};

export const getPatients = createAsyncThunk('userPatientDndGrids/fetch_patient_list', async (login: string) => {
  const requestUrl = `api/patients/divisible-patient-list?login=${login}`;
  return axios.get<any[]>(requestUrl);
});


export const UserPatientDndGridsReducer = createSlice({
  name,
  initialState,
  reducers: {
    reset() {
      return initialState;
    }
  },
  extraReducers(builder) {
    builder
    .addCase(getPatients.pending, state => {
      state.loading = true;
      state.errorMessage = null;
    })
    .addCase(getPatients.rejected, (state, action) => {
      state.loading = false;
      state.errorMessage = action.error.message;
    })
    .addCase(getPatients.fulfilled, (state, action) => {
      state.loading = false;
      state.patients = action.payload.data;
    });
  },
});

export const {reset} = UserPatientDndGridsReducer.actions;

export default UserPatientDndGridsReducer.reducer;
