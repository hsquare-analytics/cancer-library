import axios from 'axios';
import {createAsyncThunk, createSlice, isFulfilled, isPending, isRejected} from '@reduxjs/toolkit';
import {IPatient} from "app/shared/model/patient.model";
import {IItem} from "app/shared/model/item.model";
import {ICategory} from "app/shared/model/category.model";

type userPatientSelectorType = {
  itemListMap: { [key: string]: IItem[] },
  patients: IPatient[];
  categories: ICategory[];
  loading: boolean,
  errorMessage: string | null;
};

const initialState: userPatientSelectorType = {
  itemListMap: {} as any,
  patients: [],
  categories: [],
  loading: false,
  errorMessage: null,
}

export const getAccessiblePatients = createAsyncThunk('patient-table-editor/fetch_patient_list', async () => {
  const requestUrl = `api/patients/accessible-patient-list`;
  return axios.get<IPatient[]>(requestUrl);
})

export const getAccessibleItems = createAsyncThunk('patient-table-editor/fetch_item_list', async (categoryId: number) => {
  const requestUrl = `api/items/usable-item-list?categoryId=${categoryId}`;
  return axios.get<IItem[]>(requestUrl);
});

export const getAccessibleCategories = createAsyncThunk('patient-table-editor/fetch_accessible_categories', async () => {
  const requestUrl = `api/categories/accessible-category-list`;
  return axios.get<IItem[]>(requestUrl);
});

const name = 'patient-table-editor'
export const PatientTableEditor = createSlice({
  name,
  initialState,
  reducers: {
    reset() {
      return initialState
    }
  },
  extraReducers(builder) {
    builder
    .addMatcher(isFulfilled(getAccessiblePatients), (state, action) => {
      const {data} = action.payload;
      return {
        ...state,
        loading: false,
        patients: data,
      }
    })
    .addMatcher(isFulfilled(getAccessibleCategories), (state, action) => {
      const {data} = action.payload;
      return {
        ...state,
        loading: false,
        categories: data,
      }
    })
    .addMatcher(isFulfilled(getAccessibleItems), (state, action) => {
      const {data} = action.payload;
      return {
        ...state,
        loading: false,
        itemListMap: {
          ...state.itemListMap,
          [data[0].group.category.id]: data
        }
      }
    })
    .addMatcher(isPending(getAccessiblePatients, getAccessibleItems, getAccessibleCategories), (state) => {
      state.loading = true;
      state.errorMessage = null;
    })
    .addMatcher(isRejected(getAccessiblePatients, getAccessibleItems, getAccessibleCategories), (state, action) => {
      state.loading = false;
      state.errorMessage = action.error.message;
    });
  }
});

export const {reset} = PatientTableEditor.actions;

export default PatientTableEditor.reducer;
