import reducer, {getEntities, reset} from './reviewer-statistics.reducer';
import axios from 'axios';

import configureStore from 'redux-mock-store';
import thunk from 'redux-thunk';
import sinon from 'sinon';

describe('Reviewer Statistics reducer tests', () => {
  function isEmpty(element): boolean {
    if (element instanceof Array) {
      return element.length === 0;
    } else {
      return Object.keys(element).length === 0;
    }
  }

  const initialState = {
    loading: false,
    errorMessage: null,
    entities: [],
  }

  function testInitialState(state) {
    expect(state).toMatchObject({
      loading: false,
      errorMessage: null,
    });
    expect(isEmpty(state.entities));
  }

  describe('Common', () => {
    it('should return the initial state', () => {
      testInitialState(reducer(undefined, {type: ''}));
    });
  });

  describe('Requests', () => {
    it('should set state to loading', () => {
      expect(reducer(initialState, {type: getEntities.pending.type, payload: {}, error: false}))
        .toMatchObject({errorMessage: null, loading: true});
    });

    it('should reset the state', () => {
      expect(reducer({...initialState, loading: true}, reset())).toEqual(
        {...initialState}
      );
    });
  });

  describe('Failures', () => {
    it('should set errorMessage to error message', () => {
      expect(reducer(initialState, {type: getEntities.rejected.type, error: {message: 'error'}}))
        .toMatchObject({errorMessage: 'error', loading: false});
    });
  });

  describe('Success', () => {
    it('should return the list of entities', () => {
      expect(reducer(initialState, {type: getEntities.fulfilled.type, payload: {data: [{id: 1}]}}))
        .toEqual({...initialState, loading: false, entities: [{id: 1}]});
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


    it('should Fetch entities', async () => {
      const expectedAction = [
        {
          type: getEntities.pending.type,
        },
        {
          type: getEntities.fulfilled.type,
          payload: resolvedObject,
        }
      ];

      await store.dispatch(getEntities());
      expect(store.getActions()[0]).toMatchObject(expectedAction[0]);
      expect(store.getActions()[1]).toMatchObject(expectedAction[1]);
    });

  });
});
