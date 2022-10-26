import {createAsyncThunk, createSlice, isFulfilled, isPending, isRejected} from '@reduxjs/toolkit';
import axios from "axios";
import {serializeAxiosError} from "app/shared/reducers/reducer.utils";

const initialState = {
  selected: {
    category: {},
  },
  originRow: {},
  loading: false,
  errorMessage: null,
  updating: false,
  updateSuccess: false,
};

const name = 'datasource-status';
export const DatasourceStatusReducer = createSlice({
  name,
  initialState,
  reducers: {
    reset() {
      return initialState;
    },
    setCategory(state, action) {
      state.selected.category = action.payload;
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
      state.originRow = action.payload.data;
    });
  },
});

export const getOriginRow = createAsyncThunk("datasource_origin/get_row", async (data: { categoryId: number, rowId: number }) => {
    const requestUrl = `api/datasource/categories/${data.categoryId}/rows/${data.rowId}`;
    return axios.get<any>(requestUrl);
  },
  {serializeError: serializeAxiosError}
);


export const {reset, setCategory } = DatasourceStatusReducer.actions;

export default DatasourceStatusReducer.reducer;
