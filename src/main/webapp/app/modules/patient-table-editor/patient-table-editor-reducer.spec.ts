import axios from 'axios';

import configureStore from 'redux-mock-store';
import thunk from 'redux-thunk';
import sinon from 'sinon';

import reducer, {
  getAccessiblePatients,
  getDataSources,
  getUsableCategories,
  getUsableItems,
  reset,
  resetDataSourceLoadedCount,
  resetItemListLoadedCount
} from './patient-table-editor.reducer';

describe('User Patient selector module reducer tests', () => {
  function isEmpty(element): boolean {
    if (element instanceof Array) {
      return element.length === 0;
    } else {
      return Object.keys(element).length === 0;
    }
  }

  const initialState = {
    itemContainer: {} as any,
    dataSourceContainer: {} as any,
    count: {
      dataSource: 0,
      item: 0
    },
    loading: {
      patients: false,
      categories: false,
    },
    patients: [],
    categories: [],
    errorMessage: null,
  }

  function testInitialState(state) {
    expect(state).toMatchObject({
      loading: {
        patients: false,
        categories: false,
      },
      errorMessage: null,
    });
    expect(isEmpty(state.itemContainer));
    expect(isEmpty(state.dataSourceContainer));
    expect(isNaN(state.count.dataSource));
    expect(isNaN(state.count.item));
    expect(isEmpty(state.patients));
  }

  describe('Common', () => {
    it('should return the initial state', () => {
      testInitialState(reducer(undefined, {type: ''}));
    });
  });

  describe('Requests', () => {
    it('should set state to loading', () => {
      expect(reducer(undefined, {type: getAccessiblePatients.pending.type})).toMatchObject({
        errorMessage: null,
        loading: {
          ...initialState.loading,
          patients: true,
        }
      });

      expect(reducer(undefined, {type: getUsableCategories.pending.type})).toMatchObject({
        errorMessage: null,
        loading: {
          ...initialState.loading,
          categories: true,
        }
      });
    });

    it('should reset the state', () => {
      expect(reducer({
        ...initialState, loading: {
          patients: true,
          categories: true,
        }
      }, reset())).toEqual({
        ...initialState
      });
    });

    it('should reset datasource loaded count', () => {
      expect(reducer({
        ...initialState, count: {
          ...initialState.count,
          dataSource: 0,
        }
      }, resetDataSourceLoadedCount())).toEqual({
        ...initialState
      });
    });

    it('should reset datasource loaded count', () => {
      expect(reducer({
        ...initialState, count :{
          ...initialState.count,
          item: 0,
        }
      }, resetItemListLoadedCount())).toEqual({
        ...initialState
      });
    });
  });

  describe('Failures', () => {
    it('should set a message in errorMessage', () => {

      const payload = 'some message';
      const error = {message: 'error message'};

      expect(reducer(undefined, {type: getAccessiblePatients.rejected.type, payload, error})).toMatchObject({
        errorMessage: 'error message',
        loading: {
          ...initialState.loading,
          patients: false,
        }
      });

      expect(reducer(undefined, {type: getUsableCategories.rejected.type, payload, error})).toMatchObject({
        errorMessage: 'error message',
        loading: {
          ...initialState.loading,
          categories: false,
        }
      });

    });
  });

  describe('Successes', () => {
    it('should fetch accessible patients', () => {
      const payload = {data: [{1: 'fake1', 2: 'fake2'}]};

      expect(reducer(undefined, {
        type: getAccessiblePatients.fulfilled.type,
        payload,
      })).toEqual({
        ...initialState,
        patients: payload.data,
        loading: {
          ...initialState.loading,
          patients: false,
        }
      });
    });

    it('should fetch usable categories', () => {
      const payload = {data: [{1: 'fake1', 2: 'fake2'}]};

      expect(reducer(undefined, {
        type: getUsableCategories.fulfilled.type,
        payload,
      })).toEqual({
        ...initialState,
        categories: payload.data,
        loading: {
          ...initialState.loading,
          categories: false,
        }
      });
    });

    it('should fetch usable items', () => {
      const payload = {data: [{group: {category: {id: 'fakeId'}}}]};

      expect(reducer(undefined, {
        type: getUsableItems.fulfilled.type,
        payload,
      })).toEqual({
        ...initialState,
        itemContainer: {
          fakeId: payload.data
        },
        count: {
          ...initialState.count,
          item: 1,
        }
      });
    });

    it('should fetch dataSources', () => {
      const payload = {data: {categoryId: 'fakeId', dataSource: [{1: 'fake1', 2: 'fake2'}]}};

      expect(reducer(undefined, {
        type: getDataSources.fulfilled.type,
        payload,
      })).toEqual({
        ...initialState,
        dataSourceContainer: {
          ...initialState.dataSourceContainer,
          fakeId: payload.data.dataSource
        },
        count: {
          ...initialState.count,
          dataSource: 1,
        }
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
    });

    it('dispatches FETCH_PATIENT_LIST actions', async () => {
      const expectedActions = [
        {
          type: getAccessiblePatients.pending.type
        },
        {
          type: getAccessiblePatients.fulfilled.type,
          payload: resolvedObject
        }
      ];

      await store.dispatch(getAccessiblePatients());

      expect(store.getActions()[0]).toMatchObject(expectedActions[0]);
      expect(store.getActions()[1]).toMatchObject(expectedActions[1]);
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
  });
});
