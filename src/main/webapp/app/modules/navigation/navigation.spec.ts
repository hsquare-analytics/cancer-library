import axios from 'axios';

import configureStore from 'redux-mock-store';
import thunk from 'redux-thunk';
import sinon from 'sinon';

import reducer, {getCategories, reset} from './navigation.reducer';

describe('User category selector module reducer tests', () => {
  function isEmpty(element): boolean {
    if (element instanceof Array) {
      return element.length === 0;
    } else {
      return Object.keys(element).length === 0;
    }
  }

  const initialState = {
    categories: [],
    loading: false,
    errorMessage: null,
  }

  function testInitialState(state) {
    expect(state).toMatchObject({
      loading: false,
      errorMessage: null,
    });
    expect(isEmpty(state.categories));
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
      testMultipleTypes([getCategories.pending.type], {}, state => {
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
      testMultipleTypes([getCategories.rejected.type],
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
    it('should fetch all entities', () => {
      const payload = {data: [{1: 'fake1', 2: 'fake2'}]};

      expect(reducer(undefined, {
        type: getCategories.fulfilled.type,
        payload,
      })).toEqual({
        ...initialState,
        loading: false,
        categories: payload.data,
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

    it('dispatches FETCH_CATEGORY_LIST actions', async () => {
      const expectedActions = [
        {
          type: getCategories.pending.type
        },
        {
          type: getCategories.fulfilled.type,
          payload: resolvedObject
        }
      ];

      await store.dispatch(getCategories());

      expect(store.getActions()[0]).toMatchObject(expectedActions[0]);
      expect(store.getActions()[1]).toMatchObject(expectedActions[1]);
    });
  });
});
