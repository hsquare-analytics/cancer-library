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
  },
  extraReducers(builder) {
    builder
    .addMatcher(isPending(getOriginRow), (state) => {
      state.errorMessage = null;
      state.updateSuccess = false;
      state.loading = true;
    })
    .addMatcher(isRejected(getOriginRow), (state, action) => {
      state.loading = false;
      state.errorMessage = action.error.message;
    })
    .addMatcher(isFulfilled(getOriginRow), (state, action) => {
      state.loading = false;
      state.row = action.payload.data;
    });
  },
});

export const getOriginRow = createAsyncThunk("datasource_origin/get_row", async (data: { categoryId: number, rowId: number }) => {
    const requestUrl = `api/datasource/categories/${data.categoryId}/rows/${data.rowId}`;
    return axios.get<any>(requestUrl);
  },
  {serializeError: serializeAxiosError}
);


export const {reset} = DatasourceOriginReducer.actions;

export default DatasourceOriginReducer.reducer;
