import axios from 'axios';

import configureStore from 'redux-mock-store';
import thunk from 'redux-thunk';
import sinon from 'sinon';

import reducer, {getOriginRow, reset} from "app/modules/datasource/reducer/datasource.origin.reducer";

describe("DatasourceOriginReducer", () => {

  function isEmpty(element): boolean {
    if (element instanceof Array) {
      return element.length === 0;
    } else {
      return Object.keys(element).length === 0;
    }
  }

  const initialState = {
    row: {},
    loading: false,
    errorMessage: null,
    updating: false,
    updateSuccess: false,
  }

  function testInitialState(state) {
    expect(state).toMatchObject({
      loading: false,
      errorMessage: null,
      updating: false,
      updateSuccess: false,
    });
    expect(isEmpty(state.row));
  }

  describe('Common', () => {
    it('should return the initial state', () => {
      testInitialState(reducer(undefined, {type: ''}));
    });

    it('should reset the state', () => {
      expect(reducer({...initialState, loading: true}, reset())).toEqual({
        ...initialState,
      });
    });

  });

  describe("Requests", () => {
    it("should set state to loading", () => {
      expect(reducer(undefined, {type: getOriginRow.pending.type})).toMatchObject({
        errorMessage: null,
        updateSuccess: false,
        loading: true,
      });
    });
  });

  describe("Failures", () => {
    it("should set errorMessage to error message", () => {
      expect(reducer(undefined, {
        type: getOriginRow.rejected.type, error: {
          message: 'error message',
        }
      })).toMatchObject({
        errorMessage: 'error message',
        updateSuccess: false,
        loading: false,
      });
    });
  });

  describe("Success", () => {
    it("should set origin data", () => {
      const payload = {data: {1: 'fake1'}};

      expect(reducer(undefined, {type: getOriginRow.fulfilled.type, payload})).toMatchObject({
        loading: false,
        row: payload.data,
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

    it('dispatches FETCH_ROW actions', async () => {
      const expectedActions = [
        {
          type: getOriginRow.pending.type,
        },
        {
          type: getOriginRow.fulfilled.type,
          payload: resolvedObject,
        },
      ];
      await store.dispatch(getOriginRow({categoryId: 1, rowId: 1}));
      expect(store.getActions()[0]).toMatchObject(expectedActions[0]);
      expect(store.getActions()[1]).toMatchObject(expectedActions[1]);
    });
  });

});
