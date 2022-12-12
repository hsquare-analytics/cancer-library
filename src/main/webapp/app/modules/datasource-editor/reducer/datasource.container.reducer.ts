import axios from 'axios';
import {createAsyncThunk, createSlice, isFulfilled, isPending, isRejected} from '@reduxjs/toolkit';
import {IItem} from "app/shared/model/item.model";
import {ICategory} from "app/shared/model/category.model";
import {serializeAxiosError} from "app/shared/reducers/reducer.utils";

type userPatientSelectorType = {
  itemContainer: { [key: string]: IItem[] },
  dataContainer: { [key: string]: any },
  categories: ICategory[];
  loading: boolean,
  errorMessage: string | null;
  updating: boolean;
  updateSuccess: boolean;
};

const initialState: userPatientSelectorType = {
  itemContainer: {},
  dataContainer: {},
  categories: [],
  loading: false,
  errorMessage: null,
  updating: false,
  updateSuccess: false
}

export const getUsableItems = createAsyncThunk('datasource_container/fetch_usable_item_list', async (categoryId: number) => {
    const requestUrl = `api/items/usable-item-list?categoryId=${categoryId}`;
    return axios.get<IItem[]>(requestUrl);
  },
  {serializeError: serializeAxiosError}
);

export const getUsableCategories = createAsyncThunk('datasource_container/fetch_usable_category_list', async () => {
    const requestUrl = `api/categories/usable-category-list`;
    return axios.get<ICategory[]>(requestUrl);
  },
  {serializeError: serializeAxiosError}
);

export const getDataSources = createAsyncThunk('datasource_container/fetch_data_source', async (data: { categoryId: number, patientNo: string }) => {
    const requestUrl = `api/datasource/categories/${data.categoryId}/rows?patientNo=${data.patientNo}`;
    return axios.get<any>(requestUrl);
  },
  {serializeError: serializeAxiosError}
);

export const updateDatasourceRow = createAsyncThunk('datasource_container/update_data_sources_row', async (data: { categoryId: number, row: any }, thunkAPI) => {
    const result = await axios.put<any>(`api/datasource/categories/${data.categoryId}/rows/${data.row.idx}`, data.row);
    thunkAPI.dispatch(getDataSources({categoryId: data.categoryId, patientNo: data.row['pt_no']}));
    return result;
  },
  {serializeError: serializeAxiosError}
);

export const createDatasourceRow = createAsyncThunk('datasource_container/create_data_sources_row', async (data: { categoryId: number, row: any }, thunkAPI) => {
    const result = await axios.post<any>(`api/datasource/categories/${data.categoryId}/rows`, data.row);
    thunkAPI.dispatch(getDataSources({categoryId: data.categoryId, patientNo: data.row['pt_no']}));
    return result;
  },
  {serializeError: serializeAxiosError}
);

export const deleteDatasourceRow = createAsyncThunk('datasource_container/delete_data_sources_row', async (data: { categoryId: number, row: any }, thunkAPI) => {
    const result = await axios.delete<any>(`api/datasource/categories/${data.categoryId}/rows/${data.row.idx}`);
    thunkAPI.dispatch(getDataSources({categoryId: data.categoryId, patientNo: data.row['pt_no']}));
    return result;
  },
  {serializeError: serializeAxiosError}
);

export const updateBulkDatasourceRows = createAsyncThunk('datasource_container/update_bulk_data_sources_row', async (data: { categoryId: number, rows: any[] }, thunkAPI) => {
  const result = await axios.put<any>(`api/datasource/categories/${data.categoryId}/update-bulk-datasource-rows`, data.rows);
  thunkAPI.dispatch(getDataSources({categoryId: data.categoryId, patientNo: data.rows[0]['pt_no']}));
  return result;
});

const name = 'datasource-container'
export const DatasourceContainer = createSlice({
  name,
  initialState,
  reducers: {
    reset() {
      return initialState
    },
    resetFlag(state) {
      return {
        ...state,
        updateSuccess: false,
        updating: false,
        errorMessage: null,
        loading: false,
      }
    },
    resetRawData(state) {
      return {
        ...state,
        dataContainer: {},
      }
    },
    resetItem(state) {
      return {
        ...state,
        itemContainer: {},
      }
    },
  },
  extraReducers(builder) {
    builder
      .addMatcher(isFulfilled(getUsableCategories), (state, action) => {
        const {data} = action.payload;
        return {
          ...state,
          categories: data,
          loading: false,
        }
      })
      .addMatcher(isFulfilled(getUsableItems), (state, action) => {
        const {data} = action.payload;
        return {
          ...state,
          itemContainer: {
            ...state.itemContainer,
            [data[0].category.id]: data
          }
        }
      })
      .addMatcher(isFulfilled(getDataSources), (state, action) => {
        const {data} = action.payload;
        return {
          ...state,
          dataContainer: {
            ...state.dataContainer,
            [data.categoryId]: data.dataSource
          },
        }
      })
      .addMatcher(isFulfilled(updateDatasourceRow, createDatasourceRow, deleteDatasourceRow, updateBulkDatasourceRows), (state) => {
        state.updating = false
        state.loading = false;
        state.updateSuccess = true;
      })
      .addMatcher(isPending(getUsableCategories), (state) => {
        state.updating = false
        state.loading = true;
        state.errorMessage = null;
        state.updateSuccess = false;
      })
      .addMatcher(isPending(updateDatasourceRow, createDatasourceRow, deleteDatasourceRow, updateBulkDatasourceRows), (state) => {
        state.errorMessage = null;
        state.updating = true;
        state.updateSuccess = false;
      })
      .addMatcher(isRejected(getUsableCategories, updateDatasourceRow, createDatasourceRow, deleteDatasourceRow, updateBulkDatasourceRows), (state, action) => {
        state.errorMessage = action.error.message;
        state.loading = false;
        state.updating = false;
        state.updateSuccess = false;
      });
  }
});

export const {reset, resetRawData, resetItem, resetFlag} = DatasourceContainer.actions;


export default DatasourceContainer.reducer;
