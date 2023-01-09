import configureStore from 'redux-mock-store';
import axios from 'axios';
import thunk from 'redux-thunk';
import sinon from 'sinon';

import audit, {getEntities, reset,} from './audit.reducer';

describe('Audit reducer tests', () => {

  function isEmpty(element): boolean {
    if (element instanceof Array) {
      return element.length === 0;
    } else {
      return Object.keys(element).length === 0;
    }
  }

  function testInitialState(state) {
    expect(state).toMatchObject({
      loading: false,
      errorMessage: null,
    });
    expect(isEmpty(state.entities));
  }

  function testMultipleTypes(types, payload, testFunction, error?) {
    types.forEach(e => {
      testFunction(audit(undefined, {type: e, payload, error}));
    });
  }

  describe('Common', () => {
    it('should return the initial state', () => {
      testInitialState(audit(undefined, {type: 'unknown'}));
    });
  });

  describe('Requests', () => {

    it('should set state to loading', () => {
      testMultipleTypes([getEntities.pending.type], {}, state => {
        expect(state).toMatchObject({
          errorMessage: null,
          loading: true,
        });
      });
    });
  });

  describe('Failures', () => {
    it('should set state to failed and put an error message in errorMessage', () => {
      testMultipleTypes(
        [
          getEntities.rejected.type,
        ],
        {message: 'something happened'},
        state => {
          expect(state).toMatchObject({
            loading: false,
            errorMessage: 'error happened',
          });
        },
        {message: 'error happened'}
      );
    });
  });

  describe('Success', () => {
    it('should update state according to a successful fetch audits request', () => {
      const headers = {['x-total-count']: 42};
      const payload = {data: 'some handsome audits', headers};
      const toTest = audit(undefined, {type: getEntities.fulfilled.type, payload});

      expect(toTest).toMatchObject({
        loading: false,
        entities: payload.data,
      });
    });
  });

  describe('Reset', () => {
    it('should reset the state', () => {
      const initialState = {
        loading: false,
        errorMessage: null,
        entities: [] as any[],
      };
      const initialStateNew = {
        ...initialState,
        loading: true,
      };
      expect(audit(initialStateNew, reset)).toEqual(initialState);
    });
  });

  describe('Actions', () => {
    let store;

    const resolvedObject = {value: 'whatever'};
    beforeEach(() => {
      const mockStore = configureStore([thunk]);
      store = mockStore({});
      axios.get = sinon.stub().returns(Promise.resolve(resolvedObject));
      axios.put = sinon.stub().returns(Promise.resolve(resolvedObject));
      axios.post = sinon.stub().returns(Promise.resolve(resolvedObject));
      axios.delete = sinon.stub().returns(Promise.resolve(resolvedObject));
    });

    it('dispatches FETCH_USERS_AS_ADMIN_PENDING and FETCH_USERS_AS_ADMIN_FULFILLED actions', async () => {
      const expectedActions = [
        {
          type: getEntities.pending.type,
        },
        {
          type: getEntities.fulfilled.type,
          payload: resolvedObject,
        },
      ];
      await store.dispatch(getEntities());
      expect(store.getActions()[0]).toMatchObject(expectedActions[0]);
      expect(store.getActions()[1]).toMatchObject(expectedActions[1]);
    });



    it('dispatches RESET actions', async () => {
      const expectedActions = [reset()];
      await store.dispatch(reset());
      expect(store.getActions()).toEqual(expectedActions);
    });
  });
});
