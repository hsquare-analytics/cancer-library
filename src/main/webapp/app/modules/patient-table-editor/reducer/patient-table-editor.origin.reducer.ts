import {createAsyncThunk, createSlice, isFulfilled, isPending, isRejected} from '@reduxjs/toolkit';
import axios from "axios";
import {serializeAxiosError} from "app/shared/reducers/reducer.utils";

const initialState = {
  row: {},
  loading: false,
  errorMessage: null,
  updating: false,
  updateSuccess: false,
};

const name = 'patient-table-editor-config';
export const PatientTableEditorOriginReducer = createSlice({
  name,
  initialState,
  reducers: {
    reset() {
      return initialState;
    },
    resetRow(state) {
      return {
        ...state,
        row: {},
      };
    }
  },
  extraReducers(builder) {
    builder
    .addMatcher(isPending(getRow), (state) => {
      state.errorMessage = null;
      state.updateSuccess = false;
      state.loading = true;
    })
    .addMatcher(isRejected(getRow), (state, action) => {
      state.loading = false;
      state.errorMessage = action.error.message;
    })
    .addMatcher(isFulfilled(getRow), (state, action) => {
      state.loading = false;
      state.row = action.payload.data;
    });
  },
});

export const getRow = createAsyncThunk("patient-table-editor-config/get_row", async (data: { categoryId: number, rowId: number }) => {
    const requestUrl = `api/datasource-editor/categories/${data.categoryId}/row/${data.rowId}`;
    return axios.get<any>(requestUrl);
  },
  {serializeError: serializeAxiosError}
);


export const {reset, resetRow} = PatientTableEditorOriginReducer.actions;

export default PatientTableEditorOriginReducer.reducer;
