import axios from 'axios';
import {createAsyncThunk, createSlice, isFulfilled, isPending, isRejected} from '@reduxjs/toolkit';
import {IItem} from "app/shared/model/item.model";
import {ICategory} from "app/shared/model/category.model";

type userCategorySelectorType = {
  category: ICategory;
  datasource: object[];
  items: IItem[];
  loading: boolean,
  errorMessage: string | null;
};

const initialState: userCategorySelectorType = {
  category: {} as ICategory,
  datasource: [],
  items: [],
  loading: false,
  errorMessage: null,
}

const apiUrl = 'api';

export const getDatasourceByCategoryId = createAsyncThunk('datasource/fetch_datasource_list', async (categoryId: number) => {
  const requestUrl = `${apiUrl}/datasource/${categoryId}`;
  return axios.get<any[]>(requestUrl);
});

export const getItemListByCategoryId = createAsyncThunk('datasource/fetch_item_list', async (categoryId: number) => {
  const requestUrl = `${apiUrl}/datasource/${categoryId}/item-list`;
  return axios.get<IItem[]>(requestUrl);
});

export const getCategoryById = createAsyncThunk('datasource/fetch_category', async (categoryId: number) => {
  const requestUrl = `${apiUrl}/categories/${categoryId}`;
  return axios.get<ICategory>(requestUrl);
});


const name = 'datasource'
export const DataEditor = createSlice({
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
    .addMatcher(isFulfilled(getItemListByCategoryId), (state, action) => {
      const {data} = action.payload;
      return {
        ...state,
        loading: false,
        items: data,
      }
    })
    .addMatcher(isFulfilled(getCategoryById), (state, action) => {
      const {data} = action.payload;
      return {
        ...state,
        loading: false,
        category: data,
      }
    })
    .addMatcher(isPending(getDatasourceByCategoryId, getItemListByCategoryId, getCategoryById), (state) => {
      state.loading = true;
      state.errorMessage = null;
    })
    .addMatcher(isRejected(getDatasourceByCategoryId, getItemListByCategoryId, getCategoryById), (state, action) => {
      state.loading = false;
      state.errorMessage = action.error.message;
    });
  }
});

export const {reset} = DataEditor.actions;

export default DataEditor.reducer;
