import axios from 'axios';
import {createAsyncThunk, createSlice, isFulfilled, isPending, isRejected} from '@reduxjs/toolkit';
import {ICategory} from "app/shared/model/category.model";

type userCategorySelectorType = {
  datasource: object[];
  loading: boolean,
  errorMessage: string | null;
};

const initialState: userCategorySelectorType = {
  datasource: [],
  loading: false,
  errorMessage: null,
}

const apiUrl = 'api/datasources';

export const getDatasourceByCategoryId = createAsyncThunk('navigation/fetch_category_list', async (categoryId: number) => {
  const requestUrl = `${apiUrl}/${categoryId}`;
  return axios.get<ICategory[]>(requestUrl);
})

const name = 'datasource'
export const Navigation = createSlice({
  name,
  initialState,
  reducers: {
    reset() {
      return initialState
    }
  },
  extraReducers(builder) {
    builder
    .addMatcher(isFulfilled(getDatasourceByCategoryId), (state, action) => {
      const {data} = action.payload;
      return {
        ...state,
        loading: false,
        datasource: data,
      }
    })
    .addMatcher(isPending(getDatasourceByCategoryId), (state) => {
      state.loading = true;
      state.errorMessage = null;
    })
    .addMatcher(isRejected(getDatasourceByCategoryId), (state, action) => {
      state.loading = false;
      state.errorMessage = action.error.message;
    });
  }
});

export const {reset} = Navigation.actions;

export default Navigation.reducer;
