import axios from 'axios';
import {createAsyncThunk, createSlice, isFulfilled, isPending, isRejected} from '@reduxjs/toolkit';
import {IPatient} from "app/shared/model/patient.model";
import {IItem} from "app/shared/model/item.model";
import {ICategory} from "app/shared/model/category.model";

type userPatientSelectorType = {
  itemContainer: { [key: string]: IItem[] },
  patients: IPatient[];
  categories: ICategory[];
  loading: boolean,
  errorMessage: string | null;
};

const initialState: userPatientSelectorType = {
  itemContainer: {} as any,
  patients: [],
  categories: [],
  loading: false,
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
    .addMatcher(isFulfilled(getUsableCategories), (state, action) => {
      const {data} = action.payload;
      return {
        ...state,
        loading: false,
        categories: data,
      }
    })
    .addMatcher(isFulfilled(getUsableItems), (state, action) => {
      const {data} = action.payload;
      return {
        ...state,
        loading: false,
        itemContainer: {
          ...state.itemContainer,
          [data[0].group.category.id]: data
        }
      }
    })
    .addMatcher(isPending(getAccessiblePatients, getUsableItems, getUsableCategories), (state) => {
      state.loading = true;
      state.errorMessage = null;
    })
    .addMatcher(isRejected(getAccessiblePatients, getUsableItems, getUsableCategories), (state, action) => {
      state.loading = false;
      state.errorMessage = action.error.message;
    });
  }
});

export const {reset} = PatientTableEditor.actions;

export default PatientTableEditor.reducer;
