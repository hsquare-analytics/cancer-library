import axios from 'axios';
import {createAsyncThunk, createSlice, isFulfilled, isPending, isRejected} from '@reduxjs/toolkit';
import {IItem} from "app/shared/model/item.model";
import {ICategory} from "app/shared/model/category.model";
import {IUser} from "app/shared/model/user.model";
import {serializeAxiosError} from "app/shared/reducers/reducer.utils";

type userCategorySelectorType = {
  category: ICategory;
  datasource: object[];
  items: IItem[];
  loading: boolean,
  errorMessage: string | null;
  updating: boolean;
  updateSuccess: boolean;
};

const initialState: userCategorySelectorType = {
  category: {} as ICategory,
  datasource: [],
  items: [],
  loading: false,
  errorMessage: null,
  updating: false,
  updateSuccess: false,
}

const apiUrl = 'api';

export const getDatasourceByCategoryId = createAsyncThunk('datasource/fetch_datasource_list', async (categoryId: number) => {
  const requestUrl = `${apiUrl}/datasource/${categoryId}`;
  return axios.get<any[]>(requestUrl);
});

export const getDatasourceApprovalByCategoryId = createAsyncThunk('datasource/fetch_datasource_approval_list', async (categoryId: number) => {
  const requestUrl = `${apiUrl}/datasource-approval/${categoryId}`;
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

export const updateDatasourceRow = createAsyncThunk(
  'datasource/update_datasource_row',
  async (rowInfo: { categoryId: number, row: any[] }, thunkAPI) => {
    const result = await axios.put<IUser>(`${apiUrl}/datasource/${rowInfo.categoryId}`, rowInfo.row);
    thunkAPI.dispatch(getCategoryById(rowInfo.categoryId));
    return result;
  },
  {serializeError: serializeAxiosError}
);

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
    .addMatcher(isFulfilled(getDatasourceByCategoryId, getDatasourceApprovalByCategoryId), (state, action) => {
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
    .addMatcher(isFulfilled(updateDatasourceRow), (state, action) => {
      state.updating = false;
      state.loading = false;
      state.updateSuccess = true;
    })
    .addMatcher(isPending(getDatasourceByCategoryId, getDatasourceApprovalByCategoryId, getItemListByCategoryId, getCategoryById), (state) => {
      state.loading = true;
      state.errorMessage = null;
    })
    .addMatcher(isPending(updateDatasourceRow), (state) => {
      state.errorMessage = null;
      state.updateSuccess = false;
      state.updating = true;
    })
    .addMatcher(isRejected(getDatasourceByCategoryId, getDatasourceApprovalByCategoryId, getItemListByCategoryId, getCategoryById, updateDatasourceRow), (state, action) => {
      state.loading = false;
      state.updating = false;
      state.updateSuccess = false;
      state.errorMessage = action.error.message;
    });
  }
});

export const {reset} = DataEditor.actions;

export default DataEditor.reducer;
