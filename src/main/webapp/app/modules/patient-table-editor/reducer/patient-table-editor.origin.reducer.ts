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
    setRow(state, action) {
      return {
        ...state,
        row: action.payload,
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

export const getRow = createAsyncThunk("patient-table-editor-config/get_row", async (data: { categoryId: number, idx: number }) => {
    const requestUrl = `api/patient-table-editor-config?categoryId=${data.categoryId}&idx=${data.idx}`;
    return axios.get<any>(requestUrl);
  },
  {serializeError: serializeAxiosError}
);


export const {reset, setRow} = PatientTableEditorOriginReducer.actions;

export default PatientTableEditorOriginReducer.reducer;
