import axios from 'axios';
import {createAsyncThunk, createSlice, isFulfilled, isPending, isRejected} from '@reduxjs/toolkit';
import {IItem} from "app/shared/model/item.model";
import {ICategory} from "app/shared/model/category.model";

type userPatientSelectorType = {
  item: {
    container: { [key: string]: IItem[] },
    count: number
  },
  dataSource: {
    container: { [key: string]: any },
    count: number
  },
  loading: boolean,
  categories: ICategory[];
  errorMessage: string | null;
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
  loading: false,
  categories: [],
  errorMessage: null,
}

export const getUsableItems = createAsyncThunk('patient-table-editor/fetch_usable_item_list', async (categoryId: number) => {
  const requestUrl = `api/items/usable-item-list?categoryId=${categoryId}`;
  return axios.get<IItem[]>(requestUrl);
});

export const getUsableCategories = createAsyncThunk('patient-table-editor/fetch_usable_category_list', async () => {
  const requestUrl = `api/categories/usable-category-list`;
  return axios.get<IItem[]>(requestUrl);
});

export const getDataSources = createAsyncThunk('patient-table-editor/fetch_data_source', async (data: { categoryId: number, patientNo: string }) => {
  const requestUrl = `api/datasource-editor/categories/${data.categoryId}?patientNo=${data.patientNo}`;
  return axios.get<any>(requestUrl);
});

const name = 'patient-table-editor-container'
export const PatientTableEditorContainer = createSlice({
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
    .addMatcher(isPending(getUsableCategories), (state) => {
      state.loading = true;
      state.errorMessage = null;
    })
    .addMatcher(isRejected(getUsableCategories), (state, action) => {
      state.errorMessage = action.error.message;
      state.loading = false;
    });
  }
});

export const {reset, resetDataSource, resetItem } = PatientTableEditorContainer.actions;


export default PatientTableEditorContainer.reducer;
