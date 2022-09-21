import axios from 'axios';

import configureStore from 'redux-mock-store';
import thunk from 'redux-thunk';
import sinon from 'sinon';

import reducer, {getDatasourceByCategoryId, getItemListByCategoryId, reset} from './data-editor.reducer';

describe('User category selector module reducer tests', () => {
  function isEmpty(element): boolean {
    if (element instanceof Array) {
      return element.length === 0;
    } else {
      return Object.keys(element).length === 0;
    }
  }

  const initialState = {
    datasource: [],
    items: [],
    loading: false,
    errorMessage: null,
  }

  function testInitialState(state) {
    expect(state).toMatchObject({
      loading: false,
      errorMessage: null,
    });
    expect(isEmpty(state.datasource));
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
      testMultipleTypes([getDatasourceByCategoryId.pending.type, getItemListByCategoryId.pending.type], {}, state => {
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
      testMultipleTypes([getDatasourceByCategoryId.rejected.type, getItemListByCategoryId.rejected.type],
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
    it('should fetch datasource', () => {
      const payload = {data: [{1: 'fake1', 2: 'fake2'}]};

      expect(reducer(undefined, {
        type: getDatasourceByCategoryId.fulfilled.type,
        payload,
      })).toEqual({
        ...initialState,
        loading: false,
        datasource: payload.data,
      });
    });
    it('should fetch item list', () => {
      const payload = {data: [{1: 'fake1', 2: 'fake2'}]};

      expect(reducer(undefined, {
        type: getItemListByCategoryId.fulfilled.type,
        payload,
      })).toEqual({
        ...initialState,
        loading: false,
        items: payload.data,
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

    it('dispatches FETCH_DATASOURCE actions', async () => {
      const expectedActions = [
        {
          type: getDatasourceByCategoryId.pending.type
        },
        {
          type: getDatasourceByCategoryId.fulfilled.type,
          payload: resolvedObject
        }
      ];

      await store.dispatch(getDatasourceByCategoryId(1));

      expect(store.getActions()[0]).toMatchObject(expectedActions[0]);
      expect(store.getActions()[1]).toMatchObject(expectedActions[1]);
    });

    it('dispatches FETCH_ITEM_LIST actions', async () => {
      const expectedActions = [
        {
          type: getItemListByCategoryId.pending.type
        },
        {
          type: getItemListByCategoryId.fulfilled.type,
          payload: resolvedObject
        }
      ];

      await store.dispatch(getItemListByCategoryId(1));

      expect(store.getActions()[0]).toMatchObject(expectedActions[0]);
      expect(store.getActions()[1]).toMatchObject(expectedActions[1]);
    });
  });
});
