import axios from "axios";
import {defaultValue, IPatient} from "app/shared/model/patient.model";
import {createAsyncThunk, createSlice, isPending, isRejected} from "@reduxjs/toolkit";


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
    builder
    .addMatcher(isPending(getEntities), state => {
      state.loading = true;
      state.errorMessage = null;
    })
    .addMatcher(isRejected(getEntities), (state, action) => {
      state.loading = false;
      state.errorMessage = action.error.message;
    })
    ;
  }
})


export default PatientSlice.reducer;
