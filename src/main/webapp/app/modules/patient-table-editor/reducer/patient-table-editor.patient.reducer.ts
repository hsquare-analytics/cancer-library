import axios from 'axios';

import {createEntitySlice, EntityState, serializeAxiosError} from "app/shared/reducers/reducer.utils";
import {createAsyncThunk, isFulfilled, isPending} from '@reduxjs/toolkit';
import {cleanEntity} from "app/shared/util/entity-utils";
import {defaultValue, IPatient} from "app/shared/model/patient.model";

const initialState: EntityState<IPatient> = {
  loading: false,
  errorMessage: null,
  entities: [],
  entity: defaultValue,
  updating: false,
  updateSuccess: false,
};

export const getEntities = createAsyncThunk('patient/fetch_accessible_patient_list', async () => {
  const requestUrl = `api/patients/accessible-patient-list`;
  return axios.get<IPatient[]>(requestUrl);
});

export const getEntity = createAsyncThunk('patient/fetch_entity', async (id: string | number) => {
    const requestUrl = `api/patients/${id}`;
    return axios.get<IPatient>(requestUrl);
  },
  {serializeError: serializeAxiosError}
);

export const updateEntity = createAsyncThunk('patient/update_entity', async (entity: IPatient, thunkAPI) => {

    const result = await axios.put<IPatient>(`api/patients/${entity.ptNo}`, cleanEntity(entity));
    thunkAPI.dispatch(getEntities());
    return result;
  },
  {serializeError: serializeAxiosError}
);


export const PatientTableEditorPatientSlice = createEntitySlice({
    name: 'patient',
    initialState,
    extraReducers(builder) {
      builder
      .addCase(getEntity.fulfilled, (state, action) => {
        state.loading = false;
        state.entity = action.payload.data;
      })
      .addMatcher(isFulfilled(getEntities), (state, action) => {
        const {data} = action.payload;

        return {
          ...state,
          loading: false,
          entities: data,
        };
      })
      .addMatcher(isFulfilled(updateEntity), (state, action) => {
        state.updating = false;
        state.loading = false;
        state.updateSuccess = true;
        state.entity = action.payload.data;
      })
      .addMatcher(isPending(getEntities, getEntity), state => {
        state.errorMessage = null;
        state.updateSuccess = false;
        state.loading = true;
      })
      .addMatcher(isPending(updateEntity), state => {
        state.errorMessage = null;
        state.updateSuccess = false;
        state.updating = true;
      });
    },

  }
);

export const {reset} = PatientTableEditorPatientSlice.actions;

export default PatientTableEditorPatientSlice.reducer;
