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

export const getEditorDatasourceByCategoryId = createAsyncThunk('datasource/fetch_editor_datasource_list', async (categoryId: number) => {
  const requestUrl = `${apiUrl}/datasource-editor/categories/${categoryId}`;
  return axios.get<any[]>(requestUrl);
});

export const getApprovalDatasourceByCategoryId = createAsyncThunk('datasource/fetch_approval_datasource_list', async (categoryId: number) => {
  const requestUrl = `${apiUrl}/datasource-approval/categories/${categoryId}`;
  return axios.get<any[]>(requestUrl);
});

export const getItemListByCategoryId = createAsyncThunk('datasource/fetch_meta_item_list', async (categoryId: number) => {
  const requestUrl = `${apiUrl}/datasource-meta/categories/${categoryId}/item-list`;
  return axios.get<IItem[]>(requestUrl);
});

export const getCategoryById = createAsyncThunk('datasource/fetch_category', async (categoryId: number) => {
  const requestUrl = `${apiUrl}/categories/${categoryId}`;
  return axios.get<ICategory>(requestUrl);
});

export const updateEditorDatasourceRow = createAsyncThunk(
  'datasource/update_datasource_row',
  async (rowInfo: { categoryId: number, row: any[] }, thunkAPI) => {
    const result = await axios.put<IUser>(`${apiUrl}/datasource-editor/categories/${rowInfo.categoryId}`, rowInfo.row);
    thunkAPI.dispatch(getCategoryById(rowInfo.categoryId));
    return result;
  },
  {serializeError: serializeAxiosError}
);

const name = 'data-editor'
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
    .addMatcher(isFulfilled(getEditorDatasourceByCategoryId, getApprovalDatasourceByCategoryId), (state, action) => {
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
    .addMatcher(isFulfilled(updateEditorDatasourceRow), (state, action) => {
      state.updating = false;
      state.loading = false;
      state.updateSuccess = true;
    })
    .addMatcher(isPending(getEditorDatasourceByCategoryId, getApprovalDatasourceByCategoryId, getItemListByCategoryId, getCategoryById), (state) => {
      state.loading = true;
      state.errorMessage = null;
    })
    .addMatcher(isPending(updateEditorDatasourceRow), (state) => {
      state.errorMessage = null;
      state.updateSuccess = false;
      state.updating = true;
    })
    .addMatcher(isRejected(getEditorDatasourceByCategoryId, getApprovalDatasourceByCategoryId, getItemListByCategoryId, getCategoryById, updateEditorDatasourceRow), (state, action) => {
      state.loading = false;
      state.updating = false;
      state.updateSuccess = false;
      state.errorMessage = action.error.message;
    });
  }
});

export const {reset} = DataEditor.actions;

export default DataEditor.reducer;
