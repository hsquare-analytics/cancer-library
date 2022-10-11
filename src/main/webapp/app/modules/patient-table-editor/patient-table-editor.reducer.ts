import axios from 'axios';
import {createAsyncThunk, createSlice, isFulfilled, isPending, isRejected} from '@reduxjs/toolkit';
import {IPatient} from "app/shared/model/patient.model";
import {IItem} from "app/shared/model/item.model";
import {ICategory} from "app/shared/model/category.model";

type userPatientSelectorType = {
  itemContainer: { [key: string]: IItem[] },
  dataSourceContainer: { [key: string]: any[] },
  dataSourceLoadedCount: number,
  itemListLoadedCount: number,
  loading: {
    patients: boolean, categories: boolean
  },
  patients: IPatient[];
  categories: ICategory[];
  errorMessage: string | null;
};

const initialState: userPatientSelectorType = {
  itemContainer: {} as any,
  dataSourceContainer: {} as any,
  dataSourceLoadedCount: 0,
  itemListLoadedCount: 0,
  loading: {
    patients: false,
    categories: false,
  },
  patients: [],
  categories: [],
  errorMessage: null,
}

export const getAccessiblePatients = createAsyncThunk('patient-table-editor/fetch_accesible_patient_list', async () => {
  const requestUrl = `api/patients/accessible-patient-list`;
  return axios.get<IPatient[]>(requestUrl);
})

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

const name = 'patient-table-editor'
export const PatientTableEditor = createSlice({
  name,
  initialState,
  reducers: {
    reset() {
      return initialState
    },
    resetDataSourceLoadedCount(state) {
      return  {
        ...state,
        dataSourceLoadedCount: 0,
      }
    },
    resetItemListLoadedCount(state) {
      return  {
        ...state,
        itemListLoadedCount: 0,
      }
    }
  },
  extraReducers(builder) {
    builder
    .addMatcher(isFulfilled(getAccessiblePatients), (state, action) => {
      const {data} = action.payload;
      return {
        ...state,
        patients: data,
        loading: {
          ...state.loading,
          patients: false
        }
      }
    })
    .addMatcher(isFulfilled(getUsableCategories), (state, action) => {
      const {data} = action.payload;
      return {
        ...state,
        categories: data,
        loading: {
          ...state.loading,
          categories: false
        }
      }
    })
    .addMatcher(isFulfilled(getUsableItems), (state, action) => {
      const {data} = action.payload;
      return {
        ...state,
        itemContainer: {
          ...state.itemContainer,
          [data[0].group.category.id]: data
        },
        itemListLoadedCount: state.itemListLoadedCount + 1
      }
    })
    .addMatcher(isFulfilled(getDataSources), (state, action) => {
      const {data} = action.payload;
      return {
        ...state,
        dataSourceContainer: {
          ...state.dataSourceContainer,
          [data.categoryId]: data.dataSource
        },
        dataSourceLoadedCount: state.dataSourceLoadedCount + 1,
      }
    })
    .addMatcher(isPending(getAccessiblePatients), (state) => {
      state.loading.patients = true;
      state.errorMessage = null;
    })
    .addMatcher(isPending(getUsableCategories), (state) => {
      state.loading.categories = true;
      state.errorMessage = null;
    })
    .addMatcher(isRejected(getAccessiblePatients), (state, action) => {
      state.errorMessage = action.error.message;
      state.loading.patients = false;
    })
    .addMatcher(isRejected(getUsableCategories), (state, action) => {
      state.errorMessage = action.error.message;
      state.loading.categories = false;
    });
  }
});

export const {reset, resetDataSourceLoadedCount, resetItemListLoadedCount} = PatientTableEditor.actions;

export default PatientTableEditor.reducer;
