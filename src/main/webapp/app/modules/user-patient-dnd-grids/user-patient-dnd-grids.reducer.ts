import {createSlice} from "@reduxjs/toolkit";

const name = 'userPatientDndGrids';

const initialState = {
  patients: [],
  loading: false,
  errorMessage: null,
};

export const UserPatientDndGridsReducer = createSlice({
  name,
  initialState,
  reducers: {
    reset() {
      return initialState;
    }
  },
  extraReducers(builder) {
  }
});

export const {reset} = UserPatientDndGridsReducer.actions;

export default UserPatientDndGridsReducer.reducer;
