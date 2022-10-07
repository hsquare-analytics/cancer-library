import axios from 'axios';

import configureStore from 'redux-mock-store';
import thunk from 'redux-thunk';
import sinon from 'sinon';

import reducer, {
  getAccessiblePatients,
  getUsableCategories,
  getUsableItems,
  reset
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
    itemListMap: {} as any,
    patients: [],
    categories: [],
    loading: false,
    errorMessage: null,
  }

  function testInitialState(state) {
    expect(state).toMatchObject({
      loading: false,
      errorMessage: null,
    });
    expect(isEmpty(state.itemListMap));
    expect(isEmpty(state.patients));
  }

  function testMultipleTypes(types, payload, testFunction, error?) {
    types.forEach(e => {
      testFunction(reducer(undefined, {type: e, payload, error}))
    });
  }

  describe('Common', () => {
    it('should return the initial state', () => {
      testInitialState(reducer(undefined, {type: ''}));
    });
  });

  describe('Requests', () => {
    it('should set state to loading', () => {
      testMultipleTypes([getAccessiblePatients.pending.type, getUsableItems.pending.type, getUsableCategories.pending.type], {}, state => {
        expect(state).toMatchObject({
          errorMessage: null,
          loading: true,
        });
      });
    });

    it('should reset the state', () => {
      expect(reducer({...initialState, loading: true}, reset())).toEqual({
        ...initialState
      });
    });
  });

  describe('Failures', () => {
    it('should set a message in errorMessage', () => {
      testMultipleTypes([getAccessiblePatients.rejected.type, getUsableItems.rejected.type, getUsableCategories.rejected.type],
        'some message',
        state => {
          expect(state).toMatchObject({
            errorMessage: 'error message',
            loading: false,
          })
        },
        {message: 'error message'}
      )
    });
  });

  describe('Successes', () => {
    it('should fetch all patients', () => {
      const payload = {data: [{1: 'fake1', 2: 'fake2'}]};

      expect(reducer(undefined, {
        type: getAccessiblePatients.fulfilled.type,
        payload,
      })).toEqual({
        ...initialState,
        loading: false,
        patients: payload.data,
      });
    });

    it('should fetch accessible categories', () => {
      const payload = {data: [{1: 'fake1', 2: 'fake2'}]};

      expect(reducer(undefined, {
        type: getUsableCategories.fulfilled.type,
        payload,
      })).toEqual({
        ...initialState,
        loading: false,
        categories: payload.data,
      });
    });

    it('should fetch all item list and save as key map', () => {
      const payload = {data: [{group: {category: {id: 'fakeId'}}}]};

      expect(reducer(undefined, {
        type: getUsableItems.fulfilled.type,
        payload,
      })).toEqual({
        ...initialState,
        loading: false,
        itemListMap: {
          fakeId: payload.data
        },
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
