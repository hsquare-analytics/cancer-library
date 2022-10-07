import axios from 'axios';
import {createAsyncThunk, createSlice, isFulfilled, isPending, isRejected} from '@reduxjs/toolkit';
import {IPatient} from "app/shared/model/patient.model";
import {IItem} from "app/shared/model/item.model";

type userPatientSelectorType = {
  itemListMap: { [key: string]: IItem[] },
  patients: IPatient[];
  loading: boolean,
  errorMessage: string | null;
};

const initialState: userPatientSelectorType = {
  itemListMap: {} as any,
  patients: [],
  loading: false,
  errorMessage: null,
}

export const getPatients = createAsyncThunk('patient-table-editor/fetch_patient_list', async () => {
  const requestUrl = `api/patients/accessible-patient-list`;
  return axios.get<IPatient[]>(requestUrl);
})

export const getItemListByCategoryId = createAsyncThunk('patient-table-editor/fetch_item_list', async (categoryId: number) => {
  const requestUrl = `api/datasource-meta/categories/${categoryId}/item-list`;
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
    .addMatcher(isFulfilled(getPatients), (state, action) => {
      const {data} = action.payload;
      return {
        ...state,
        loading: false,
        patients: data,
      }
    })
    .addMatcher(isFulfilled(getItemListByCategoryId), (state, action) => {
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
    .addMatcher(isPending(getPatients, getItemListByCategoryId), (state) => {
      state.loading = true;
      state.errorMessage = null;
    })
    .addMatcher(isRejected(getPatients, getItemListByCategoryId), (state, action) => {
      state.loading = false;
      state.errorMessage = action.error.message;
    });
  }
});

export const {reset} = PatientTableEditor.actions;

export default PatientTableEditor.reducer;
