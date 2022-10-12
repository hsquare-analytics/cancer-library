import axios from "axios";
import {createAsyncThunk, createSlice, isFulfilled, isPending, isRejected} from '@reduxjs/toolkit';

import {serializeAxiosError} from 'app/shared/reducers/reducer.utils';


const name = 'userPatientDndGrids';

const initialState = {
  patients: [],
  loading: false,
  errorMessage: null,
  updating: false,
  updateSuccess: false,
};

export const getPatients = createAsyncThunk('userPatientDndGrids/fetch_patient_list', async (login: string) => {
  const requestUrl = `api/patients/divisible-patient-list?login=${login}`;
  return axios.get<any[]>(requestUrl);
});

export const createUserPatientAuthorizations = createAsyncThunk('userPatientDndGrids/create_user_patient_authorizations', async (data: { login: any, patients: any[] }, thunkAPI) => {
    const result = await axios.post<any[]>(`api/user-patient-authorizations`, data);
    thunkAPI.dispatch(getPatients(data.login));
    return result
  },
  {serializeError: serializeAxiosError}
);

export const UserPatientDndGridsReducer = createSlice({
  name,
  initialState,
  reducers: {
    reset() {
      return initialState;
    },
    setPatients(state, action) {
      return {
        ...state,
        patients: action.payload,
      };
    },
  },
  extraReducers(builder) {
    builder
    .addMatcher(isFulfilled(getPatients), (state, action) => {
      state.loading = false;
      state.patients = action.payload.data;
    })
    .addMatcher(isFulfilled(createUserPatientAuthorizations), (state, action) => {
      state.updating = false;
      state.loading = false;
      state.updateSuccess = true;
      state.patients = action.payload.data;
    })
    .addMatcher(isPending(getPatients), (state) => {
      state.loading = true;
      state.errorMessage = null;
    })
    .addMatcher(isPending(createUserPatientAuthorizations), (state) => {
      state.updating = true;
      state.errorMessage = null;
    })
    .addMatcher(isRejected(getPatients, createUserPatientAuthorizations), (state, action) => {
      state.loading = false;
      state.updateSuccess = false;
      state.errorMessage = action.error.message;
    })
    ;
  },
});

export const {reset, setPatients} = UserPatientDndGridsReducer.actions;

export default UserPatientDndGridsReducer.reducer;
