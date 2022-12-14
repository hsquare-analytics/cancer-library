import axios from 'axios';
import {createAsyncThunk, isFulfilled, isPending} from '@reduxjs/toolkit';

import {cleanEntity} from 'app/shared/util/entity-utils';
import {createEntitySlice, EntityState, IQueryParams, serializeAxiosError} from 'app/shared/reducers/reducer.utils';
import {defaultValue, IComment} from 'app/shared/model/comment.model';

const initialState: EntityState<IComment> = {
  loading: false,
  errorMessage: null,
  entities: [],
  entity: defaultValue,
  updating: false,
  updateSuccess: false,
};

const apiUrl = 'api/comments';

// Actions
export const getEntities = createAsyncThunk('row-comment/fetch_entity_list', async (ptNo: string) => {
  const requestUrl = `${apiUrl}/ptNo/${ptNo}`;
  return axios.get<IComment[]>(requestUrl);
});

export const getEntity = createAsyncThunk(
  'row-comment/fetch_entity',
  async (data: {
    categoryId: number;
    rowId: string;
  }) => {
    const requestUrl = `${apiUrl}/categories/${data.categoryId}/rows/${data.rowId}`;
    return axios.get<IComment>(requestUrl);
  },
  {serializeError: serializeAxiosError}
);

export const createEntity = createAsyncThunk(
  'row-comment/create_entity',
  async (entity: IComment, thunkAPI) => {
    const result = await axios.post<IComment>(apiUrl, cleanEntity(entity));
    thunkAPI.dispatch(getEntities(entity.ptNo));
    return result;
  },
  {serializeError: serializeAxiosError}
);

export const updateEntity = createAsyncThunk('row-comment/update_entity',
  async (entity: IComment, thunkAPI) => {
    const result = await axios.put<IComment>(`${apiUrl}/${entity.id}`, cleanEntity(entity));
    thunkAPI.dispatch(getEntities(entity.ptNo));
    return result;
  },
  {serializeError: serializeAxiosError}
);

export const RowCommentSlice = createEntitySlice({
  name: 'row-comment',
  initialState,
  extraReducers(builder) {
    builder
      .addCase(getEntity.fulfilled, (state, action) => {
        state.loading = false;
        state.entity = action.payload.data;
      })
      .addMatcher(isFulfilled(getEntities), (state, action) => {
        const {data} = action.payload;

        return {
          ...state,
          loading: false,
          entities: data,
        };
      })
      .addMatcher(isFulfilled(createEntity, updateEntity), (state, action) => {
        state.updating = false;
        state.loading = false;
        state.updateSuccess = true;
        state.entity = action.payload.data;
      })
      .addMatcher(isPending(getEntities, getEntity), state => {
        state.errorMessage = null;
        state.updateSuccess = false;
        state.loading = true;
      })
      .addMatcher(isPending(createEntity, updateEntity), state => {
        state.errorMessage = null;
        state.updateSuccess = false;
        state.updating = true;
      });
  },
});

export const {reset} = RowCommentSlice.actions;

// Reducer
export default RowCommentSlice.reducer;
