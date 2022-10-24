import axios from 'axios';
import {createAsyncThunk, createSlice, isFulfilled, isPending, isRejected} from '@reduxjs/toolkit';
import {IItem} from "app/shared/model/item.model";
import {ICategory} from "app/shared/model/category.model";
import {serializeAxiosError} from "app/shared/reducers/reducer.utils";

type userPatientSelectorType = {
  item: {
    container: { [key: string]: IItem[] },
    count: number
  },
  dataSource: {
    container: { [key: string]: any },
    count: number
  },
  categories: ICategory[];
  loading: boolean,
  errorMessage: string | null;
  updating: boolean;
  updateSuccess: boolean;
};

const initialState: userPatientSelectorType = {
  item: {
    container: {},
    count: 0
  },
  dataSource: {
    container: {},
    count: 0
  },
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
    return axios.get<IItem[]>(requestUrl);
  },
  {serializeError: serializeAxiosError}
);

export const getDataSources = createAsyncThunk('datasource_container/fetch_data_source', async (data: { categoryId: number, patientNo: string }) => {
    const requestUrl = `api/datasource/categories/${data.categoryId}?patientNo=${data.patientNo}`;
    return axios.get<any>(requestUrl);
  },
  {serializeError: serializeAxiosError}
);

export const updateDatasourceRow = createAsyncThunk('datasource_container/update_data_sources_row', async (data: { categoryId: number, row: any }, thunkAPI) => {
    const result = await axios.put<any>(`api/datasource/categories/${data.categoryId}`, data.row);
    thunkAPI.dispatch(getDataSources({categoryId: data.categoryId, patientNo: data.row['pt_no']}));
    return result;
  },
  {serializeError: serializeAxiosError}
);

const name = 'datasource-container'
export const DatasourceContainer = createSlice({
  name,
  initialState,
  reducers: {
    reset() {
      return initialState
    },
    resetDataSource(state) {
      return {
        ...state,
        dataSource: {
          container: {},
          count: 0
        }
      }
    },
    resetItem(state) {
      return {
        ...state,
        item: {
          container: {},
          count: 0
        }
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
        item: {
          container: {
            ...state.item.container,
            [data[0].category.id]: data
          },
          count: state.item.count + 1
        }
      }
    })
    .addMatcher(isFulfilled(getDataSources), (state, action) => {
      const {data} = action.payload;
      return {
        ...state,
        dataSource: {
          container: {
            ...state.dataSource.container,
            [data.categoryId]: data.dataSource
          },
          count: state.dataSource.count + 1,
        }
      }
    })
    .addMatcher(isFulfilled(updateDatasourceRow), (state) => {
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
    .addMatcher(isPending(updateDatasourceRow), (state) => {
      state.errorMessage = null;
      state.updating = true;
      state.updateSuccess = false;
    })
    .addMatcher(isRejected(getUsableCategories, updateDatasourceRow), (state, action) => {
      state.errorMessage = action.error.message;
      state.loading = false;
      state.updating = false;
      state.updateSuccess = false;
    });
  }
});

export const {reset, resetDataSource, resetItem} = DatasourceContainer.actions;


export default DatasourceContainer.reducer;
