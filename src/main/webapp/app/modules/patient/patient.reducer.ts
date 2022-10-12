import axios from "axios";
import {defaultValue, IPatient} from "app/shared/model/patient.model";
import {createAsyncThunk, createSlice} from "@reduxjs/toolkit";


const initialState = {
  loading: false,
  errorMessage: null,
  entities: [],
  entity: defaultValue,
}

const apiUrl = `api/patients `;

export const getEntities = createAsyncThunk('patient/fetch_entity_list', async () => {
  const requestUrl = `${apiUrl}`;
  return axios.get<IPatient[]>(requestUrl);
});

export const PatientSlice = createSlice({
  name: 'patient',
  initialState,
  reducers: {
    reset() {
      return initialState;
    }
  },
  extraReducers(builder) {
  }
})


export default PatientSlice.reducer;
