import axios from 'axios';

import configureStore from 'redux-mock-store';
import thunk from 'redux-thunk';
import sinon from 'sinon';

import reducer, {
  createDatasourceRow,
  deleteDatasourceRow,
  getDataSources,
  getUsableCategories,
  getUsableItems,
  reset,
  resetFlag,
  resetItem,
  resetRawData,
  updateBulkDatasourceRows,
  updateDatasourceRow,
} from './datasource.container.reducer';
import {RowStatus} from "app/config/datasource-constants";

describe('User Patient selector module reducer tests', () => {
  function isEmpty(element): boolean {
    if (element instanceof Array) {
      return element.length === 0;
    } else {
      return Object.keys(element).length === 0;
    }
  }

  const initialState = {
    itemContainer: {},
    dataContainer: {},
    loading: false,
    categories: [],
    errorMessage: null,
    updating: false,
    updateSuccess: false
  }

  function testInitialState(state) {
    expect(state).toMatchObject({
      loading: false,
      errorMessage: null,
    });
    expect(isEmpty(state.itemContainer));
    expect(isEmpty(state.dataContainer));
  }

  function testMultipleTypes(types, payload, testFunction, error?) {
    types.forEach(e => {
      testFunction(reducer(undefined, {type: e, payload, error}));
    });
  }

  describe('Common', () => {
    it('should return the initial state', () => {
      testInitialState(reducer(undefined, {type: ''}));
    });

    it('should reset the state', () => {
      expect(reducer({
        ...initialState, loading: true, errorMessage: 'error'
      }, reset())).toEqual({
        ...initialState
      });
    });

    it('should reset dataSource container', () => {
      expect(reducer({
        ...initialState,
        dataContainer: {1: [{id: 1, name: 'test'}]}
      }, resetRawData())).toEqual({
        ...initialState
      });
    });

    it('should reset flag', () => {
      expect(reducer(undefined, resetFlag())).toMatchObject({
        updating: false,
        updateSuccess: false,
        loading: false,
        errorMessage: null
      });
    });

    it('should reset item container', () => {
      expect(reducer({
        ...initialState,
        itemContainer: {1: [{id: 1, title: 'test'}]}
      }, resetItem())).toEqual({
        ...initialState
      });
    });

  });

  describe('Requests', () => {
    it('should set state to loading', () => {
      expect(reducer(undefined, {type: getUsableCategories.pending.type})).toMatchObject({
        errorMessage: null,
        loading: true,
      });
    });

    it('should set state to loading', () => {
      testMultipleTypes([updateDatasourceRow.pending.type, createDatasourceRow.pending.type, deleteDatasourceRow.pending.type,
        updateBulkDatasourceRows.pending.type ], {}, state => {
        expect(state).toMatchObject({
          errorMessage: null,
          updateSuccess: false,
          updating: true,
        });
      })
    });
  });

  describe('Failures', () => {
    it('should set a message in errorMessage', () => {
      testMultipleTypes(
        [
          getUsableCategories.rejected.type,
          updateDatasourceRow.rejected.type,
          createDatasourceRow.rejected.type,
          deleteDatasourceRow.rejected.type,
          updateBulkDatasourceRows.rejected.type,
        ],
        'some message',
        state => {
          expect(state).toMatchObject({
            errorMessage: 'error message',
            updateSuccess: false,
            updating: false,
          });
        },
        {
          message: 'error message',
        }
      );
    });
  });

  describe('Successes', () => {

    it('should fetch usable categories', () => {
      const payload = {data: [{1: 'fake1', 2: 'fake2'}]};

      expect(reducer(undefined, {
        type: getUsableCategories.fulfilled.type,
        payload,
      })).toEqual({
        ...initialState,
        categories: payload.data,
        loading: false
      });
    });

    it('should fetch usable items', () => {
      const payload = {data: [{category: {id: 'fakeId'}}]};

      expect(reducer(undefined, {
        type: getUsableItems.fulfilled.type,
        payload,
      })).toEqual({
        ...initialState,
        itemContainer: {
          fakeId: payload.data
        },
      });
    });

    it('should fetch dataSources', () => {
      const payload = {data: {categoryId: 'fakeId', dataSource: [{1: 'fake1', 2: 'fake2'}]}};

      expect(reducer(undefined, {
        type: getDataSources.fulfilled.type,
        payload,
      })).toEqual({
        ...initialState,
        dataContainer: {
          fakeId: payload.data.dataSource
        },
      });
    });

    it('should update dataSource row', () => {
      const payload = {data: {categoryId: 'fakeId', dataSource: [{1: 'fake1', 2: 'fake2'}]}};

      testMultipleTypes([updateDatasourceRow.fulfilled.type, createDatasourceRow.fulfilled.type, updateBulkDatasourceRows.fulfilled.type], payload, state => {
        expect(state).toEqual({
          ...initialState,
          updateSuccess: true,
          updating: false,
          loading: false,
        });
      })
    });

    it('should delete dataSource row', () => {
      expect(reducer(undefined, {
        type: deleteDatasourceRow.fulfilled.type,
      })).toMatchObject({
        updateSuccess: true,
        updating: false,
        loading: false,
      });
    });
  });

  describe('Actions', () => {
    let store;
    const resolvedObject = {value: 'whatever'};

    beforeEach(() => {
      const mockStore = configureStore([thunk]);
      store = mockStore({});
      axios.get = sinon.stub().returns(Promise.resolve(resolvedObject));
      axios.post = sinon.stub().returns(Promise.resolve(resolvedObject));
      axios.put = sinon.stub().returns(Promise.resolve(resolvedObject));
      axios.patch = sinon.stub().returns(Promise.resolve(resolvedObject));
      axios.delete = sinon.stub().returns(Promise.resolve(resolvedObject));
    });

    it('dispatches FETCH_CATEGORY_LIST actions', async () => {
      const expectedActions = [
        {
          type: getUsableCategories.pending.type
        },
        {
          type: getUsableCategories.fulfilled.type,
          payload: resolvedObject
        }
      ];

      await store.dispatch(getUsableCategories());

      expect(store.getActions()[0]).toMatchObject(expectedActions[0]);
      expect(store.getActions()[1]).toMatchObject(expectedActions[1]);
    });

    it('dispatches FETCH_ITEM_LIST_BY_CATEGORYID actions', async () => {
      const expectedActions = [
        {
          type: getUsableItems.pending.type
        },
        {
          type: getUsableItems.fulfilled.type,
          payload: resolvedObject
        }
      ];

      await store.dispatch(getUsableItems(1));

      expect(store.getActions()[0]).toMatchObject(expectedActions[0]);
      expect(store.getActions()[1]).toMatchObject(expectedActions[1]);
    });

    it('dispatches UPDATE_DATASOURCE_ROW actions', async () => {
      const expectedActions = [
        {
          type: updateDatasourceRow.pending.type
        },
        {
          type: getDataSources.pending.type
        },
        {
          type: updateDatasourceRow.fulfilled.type,
          payload: resolvedObject
        }
      ];

      await store.dispatch(updateDatasourceRow({categoryId: 1, row: {'pt_no': 'fake'}}));

      expect(store.getActions()[0]).toMatchObject(expectedActions[0]);
      expect(store.getActions()[1]).toMatchObject(expectedActions[1]);
      expect(store.getActions()[2]).toMatchObject(expectedActions[2]);
    });

    it('dispatches CREATE_DATASOURCE_ROW actions', async () => {
      const expectedActions = [
        {
          type: createDatasourceRow.pending.type
        },
        {
          type: getDataSources.pending.type
        },
        {
          type: createDatasourceRow.fulfilled.type,
          payload: resolvedObject
        }
      ];

      await store.dispatch(createDatasourceRow({categoryId: 1, row: {'pt_no': 'fake'}}));

      expect(store.getActions()[0]).toMatchObject(expectedActions[0]);
      expect(store.getActions()[1]).toMatchObject(expectedActions[1]);
      expect(store.getActions()[2]).toMatchObject(expectedActions[2]);
    });

    it('dispatches DELETE_DATASOURCE_ROW actions', async () => {
      const expectedActions = [
        {
          type: deleteDatasourceRow.pending.type
        },
        {
          type: getDataSources.pending.type
        },
        {
          type: deleteDatasourceRow.fulfilled.type,
          payload: resolvedObject
        }
      ];

      await store.dispatch(deleteDatasourceRow({categoryId: 1, row: {'idx': 'fake'}}));

      expect(store.getActions()[0]).toMatchObject(expectedActions[0]);
      expect(store.getActions()[1]).toMatchObject(expectedActions[1]);
      expect(store.getActions()[2]).toMatchObject(expectedActions[2]);
    });

    it('dispatches UPDATE_BULK_DATASOURCE_ROWS actions', async () => {
      const expectedActions = [
        {
          type: updateBulkDatasourceRows.pending.type
        },
        {
          type: getDataSources.pending.type
        },
        {
          type: updateBulkDatasourceRows.fulfilled.type,
          payload: resolvedObject
        }
      ];

      await store.dispatch(updateBulkDatasourceRows({categoryId: 1, rows: [{'pt_no': 'fake'}], status: RowStatus.DISABLED}));

      expect(store.getActions()[0]).toMatchObject(expectedActions[0]);
      expect(store.getActions()[1]).toMatchObject(expectedActions[1]);
      expect(store.getActions()[2]).toMatchObject(expectedActions[2]);
    });
  });
});
