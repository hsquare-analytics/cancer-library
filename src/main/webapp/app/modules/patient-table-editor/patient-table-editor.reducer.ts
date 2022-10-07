import axios from 'axios';
import {createAsyncThunk, createSlice, isFulfilled, isPending, isRejected} from '@reduxjs/toolkit';
import {IPatient} from "app/shared/model/patient.model";
import {IItem} from "app/shared/model/item.model";
import {ICategory} from "app/shared/model/category.model";

type userPatientSelectorType = {
  itemContainer: { [key: string]: IItem[] },
  dataSourceContainer: { [key: string]: any[] },
  dataSourceLoadedCount: number,
  loadingContainer: {
    patients: boolean, categories: boolean, items: boolean
  },
  patients: IPatient[];
  categories: ICategory[];
  errorMessage: string | null;
};

const initialState: userPatientSelectorType = {
  itemContainer: {} as any,
  dataSourceContainer: {} as any,
  dataSourceLoadedCount: 0,
  loadingContainer: {
    patients: false,
    categories: false,
    items: false,
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
    }
  },
  extraReducers(builder) {
    builder
    .addMatcher(isFulfilled(getAccessiblePatients), (state, action) => {
      const {data} = action.payload;
      return {
        ...state,
        patients: data,
        loadingContainer: {
          ...state.loadingContainer,
          patients: false
        }
      }
    })
    .addMatcher(isFulfilled(getUsableCategories), (state, action) => {
      const {data} = action.payload;
      return {
        ...state,
        categories: data,
        loadingContainer: {
          ...state.loadingContainer,
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
        loadingContainer: {
          ...state.loadingContainer,
          items: false
        }
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
      state.loadingContainer.patients = true;
      state.errorMessage = null;
    })
    .addMatcher(isPending(getUsableCategories), (state) => {
      state.loadingContainer.categories = true;
      state.errorMessage = null;
    })
    .addMatcher(isPending(getUsableItems), (state) => {
      state.loadingContainer.items = true;
      state.errorMessage = null;
    })
    .addMatcher(isRejected(getAccessiblePatients), (state, action) => {
      state.errorMessage = action.error.message;
      state.loadingContainer.patients = false;
    })
    .addMatcher(isRejected(getUsableCategories), (state, action) => {
      state.errorMessage = action.error.message;
      state.loadingContainer.categories = false;
    })
    .addMatcher(isRejected(getUsableItems), (state, action) => {
      state.errorMessage = action.error.message;
      state.loadingContainer.items = false;
    })
    ;
  }
});

export const {reset, resetDataSourceLoadedCount} = PatientTableEditor.actions;

export default PatientTableEditor.reducer;
