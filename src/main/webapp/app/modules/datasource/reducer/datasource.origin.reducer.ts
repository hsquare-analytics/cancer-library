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

const name = 'datasource-origin';
export const DatasourceOriginReducer = createSlice({
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

export const getRow = createAsyncThunk("datasource_origin/get_row", async (data: { categoryId: number, rowId: number }) => {
    const requestUrl = `api/datasource/categories/${data.categoryId}/row/${data.rowId}`;
    return axios.get<any>(requestUrl);
  },
  {serializeError: serializeAxiosError}
);


export const {reset, resetRow} = DatasourceOriginReducer.actions;

export default DatasourceOriginReducer.reducer;
