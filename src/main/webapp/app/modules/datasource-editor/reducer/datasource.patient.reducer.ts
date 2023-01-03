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


export const getEntities = createAsyncThunk('datasource_patient/fetch_accessible_patient_list', async () => {
  const requestUrl = `api/patients/accessible-patient-list`;
  return axios.get<IPatient[]>(requestUrl);
});

export const getEntity = createAsyncThunk('datasource_patient/fetch_entity', async (id: string | number) => {
    const requestUrl = `api/patients/${id}`;
    return axios.get<IPatient>(requestUrl);
  },
  {serializeError: serializeAxiosError}
);

export const updateEntity = createAsyncThunk('datasource_patient/update_entity', async (entity: IPatient, thunkAPI) => {
    const result = await axios.patch<IPatient>(`api/patients/${entity.ptNo}`, cleanEntity(entity));
    thunkAPI.dispatch(getEntities());
    return result;
  },
  {serializeError: serializeAxiosError}
);

export const updateFirstVisitDate = createAsyncThunk('datasource_patient/update_first_visit_date', async (entity: IPatient, thunkAPI) => {
  const result = await axios.patch<IPatient>(`api/patients/${entity.ptNo}/first-visit-date`, cleanEntity(entity));
  thunkAPI.dispatch(getEntity(entity.ptNo));
  return result;
});


export const updateBulkStatus = createAsyncThunk('datasource_patient/update_bulk_status', async (data: { status: string, ptNos: string[] }, thunkAPI) => {
  const result = await axios.post<boolean>(`api/patients/update-bulk-status/${data.status}`, data.ptNos);
  thunkAPI.dispatch(getEntities());
  return result;
});


export const DatasourcePatientSlice = createEntitySlice({
    name: 'datasource-patient',
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
        .addMatcher(isFulfilled(updateFirstVisitDate, updateBulkStatus), (state, action) => {
          state.updating = false;
          state.loading = false;
          state.updateSuccess = true;
        })
        .addMatcher(isPending(getEntities, getEntity), state => {
          state.errorMessage = null;
          state.updateSuccess = false;
          state.loading = true;
        })
        .addMatcher(isPending(updateEntity, updateFirstVisitDate, updateBulkStatus), state => {
          state.errorMessage = null;
          state.updateSuccess = false;
          state.updating = true;
        });
    },

  }
);

export const {reset} = DatasourcePatientSlice.actions;

export default DatasourcePatientSlice.reducer;
