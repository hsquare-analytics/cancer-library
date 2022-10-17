import axios from 'axios';
import {createAsyncThunk, createSlice, isFulfilled, isPending, isRejected} from '@reduxjs/toolkit';
import {IPatient} from "app/shared/model/patient.model";
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
  loading: {
    patient: boolean,
    patients: boolean, categories: boolean
  },
  patient: IPatient;
  patients: IPatient[];
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
  loading: {
    patient: false,
    patients: false,
    categories: false,
  },
  patient: {} as IPatient,
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

export const getPatient = createAsyncThunk('patient-table-editor/fetch_patient', async (patientNo: string) => {
  const requestUrl = `api/patients/${patientNo}`;
  return axios.get<IPatient>(requestUrl);
});

const name = 'patient-table-editor'
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
    setPatient(state, action) {
      return {
        ...state,
        patient: action.payload
      }
    },
    setPatients(state, action) {
      return {
        ...state,
        patients: action.payload
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
        item: {
          container: {
            ...state.item.container,
            [data[0].group.category.id]: data
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
    .addMatcher(isFulfilled(getPatient), (state, action) => {
      const {data} = action.payload;
      return {
        ...state,
        patient: data,
        loading: {
          ...state.loading,
          patient: false
        }
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
    .addMatcher(isPending(getPatient), (state) => {
      state.loading.patient = true;
      state.errorMessage = null;
    })
    .addMatcher(isRejected(getAccessiblePatients), (state, action) => {
      state.errorMessage = action.error.message;
      state.loading.patients = false;
    })
    .addMatcher(isRejected(getUsableCategories), (state, action) => {
      state.errorMessage = action.error.message;
      state.loading.categories = false;
    })
    .addMatcher(isRejected(getPatient), (state, action) => {
      state.errorMessage = action.error.message;
      state.loading.patient = false;
    });
  }
});

export const {reset, resetDataSource, resetItem, setPatient, setPatients} = PatientTableEditorContainer.actions;


export default PatientTableEditorContainer.reducer;
