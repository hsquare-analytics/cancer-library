import {createAsyncThunk, createSlice, isFulfilled, isPending, isRejected} from '@reduxjs/toolkit';
import axios from "axios";

const initialState = {
  loading: false,
  errorMessage: null,
  entities: [],
};

export const getEntities = createAsyncThunk('point/fetch_entity_list', async () => {
  return axios.get<any>("test");
});


export const ReviewerStatisticsReducer = createSlice({
  name: 'reviewerStatistics',
  initialState,
  reducers: {
    reset(state) {
      return {
        ...initialState,
      };
    },
  },
  extraReducers(builder) {
    builder
      .addMatcher(isPending(getEntities), state => {
        state.loading = true;
      })
      .addMatcher(isRejected(getEntities), (state, action) => {
        state.loading = false;
        state.errorMessage = action.error.message;
      })
      .addMatcher(isFulfilled(getEntities), (state, action) => {
        state.loading = false;
        state.entities = action.payload.data;
      });
  },
});

export const {reset} = ReviewerStatisticsReducer.actions;
export default ReviewerStatisticsReducer.reducer;
