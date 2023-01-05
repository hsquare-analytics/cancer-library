import {createAsyncThunk, createSlice, isFulfilled, isPending, isRejected} from '@reduxjs/toolkit';
import axios from "axios";
import {IReviewerStatisticsModel} from "app/modules/reviewer-statistics/reviewer-statistics.model";

import moment from "moment";

const initialState = {
  loading: false,
  errorMessage: null,
  entities: [] as any,
};

export const getEntities = createAsyncThunk('point/fetch_entity_list', async (dateRange: { startDate: string, endDate: string }) => {
  return axios.get<IReviewerStatisticsModel>(`api/users/normal-authorization-list?startDate=${dateRange.startDate}&endDate=${dateRange.endDate}`)
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
