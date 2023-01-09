import axios from 'axios';
import {createAsyncThunk, createSlice, isFulfilled, isPending, isRejected} from '@reduxjs/toolkit';
import {IAudit} from "app/shared/model/audit.model";

const initialState = {
  loading: false,
  errorMessage: null,
  entities: [] as ReadonlyArray<IAudit>,
};

const apiUrl = 'management/audits';


export const getEntities = createAsyncThunk('audit/getEntities', async () => {
  const requestUrl = `${apiUrl}`;
  return axios.get<IAudit[]>(requestUrl);
});


export type AuditState = Readonly<typeof initialState>;

const AuditSlice = createSlice({
  name: 'auditReducer',
  initialState: initialState as AuditState,
  reducers: {
    reset() {
      return initialState;
    },
  },
  extraReducers(builder) {
    builder
      .addMatcher(isFulfilled(getEntities), (state, action) => {
        state.loading = false;
        state.entities = action.payload.data;
      })
      .addMatcher(isPending(getEntities), state => {
        state.errorMessage = null;
        state.loading = true;
      })
      .addMatcher(isRejected(getEntities), (state, action) => {
        state.loading = false;
        state.errorMessage = action.error.message;
      })
  },
});

export const {reset} = AuditSlice.actions;

// Reducer
export default AuditSlice.reducer;
