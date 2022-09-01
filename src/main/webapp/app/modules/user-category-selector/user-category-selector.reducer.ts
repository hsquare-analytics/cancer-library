import axios from 'axios';
import {createAsyncThunk, createSlice, isFulfilled, isPending, isRejected} from '@reduxjs/toolkit';
import {ICategory} from "app/shared/model/category.model";

type userCategorySelectorType = {
  categories: ICategory[];
  loading: boolean,
  errorMessage: string | null;
};

const initialState: userCategorySelectorType = {
  categories: [],
  loading: false,
  errorMessage: null,
}

const apiUrl = 'api/user-category-selector';

export const getCategories = createAsyncThunk('user_category_selector/fetch_category_list', async () => {
  const requestUrl = `${apiUrl}`;
  return axios.get<ICategory[]>(requestUrl);
})

const name = 'userCategorySelector'
export const UserCategorySelectorSlice = createSlice({
  name,
  initialState,
  reducers: {
    reset() {
      return initialState
    }
  },
  extraReducers: (builder) => {
    builder
    .addMatcher(isFulfilled(getCategories), (state, action) => {
      const {data} = action.payload;
      return {
        ...state,
        loading: false,
        categories: data,
      }
    })
    .addMatcher(isPending(getCategories), (state) => {
      state.loading = true;
      state.errorMessage = null;
    })
    .addMatcher(isRejected(getCategories), (state, action) => {
      state.loading = false;
      state.errorMessage = action.error.message;
    });
  }
});

export const {reset} = UserCategorySelectorSlice.actions;

export default UserCategorySelectorSlice.reducer;
