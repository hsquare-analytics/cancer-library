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

interface IDateRange {
  startDate?: Date;
  endDate?: Date;
}

export const getEntities = createAsyncThunk('datasource_patient/fetch_accessible_patient_list', async (dateRange: IDateRange) => {
  const requestUrl = `api/patients/accessible-patient-list`;
  return axios.get<IPatient[]>(requestUrl, {
    params: {
      startDate: dateRange.startDate,
      endDate: dateRange.endDate,
    }
  });
});

export const getEntity = createAsyncThunk('datasource_patient/fetch_entity', async (id: string | number) => {
    const requestUrl = `api/patients/${id}`;
    return axios.get<IPatient>(requestUrl);
  },
  {serializeError: serializeAxiosError}
);

export const updateEntity = createAsyncThunk('datasource_patient/update_entity', async (entity: IPatient, thunkAPI) => {

    const result = await axios.patch<IPatient>(`api/patients/${entity.ptNo}`, cleanEntity(entity));
    thunkAPI.dispatch(getEntities({}));
    return result;
  },
  {serializeError: serializeAxiosError}
);


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

export const {reset} = DatasourcePatientSlice.actions;

export default DatasourcePatientSlice.reducer;
