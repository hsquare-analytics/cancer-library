import reducer, {getEntities, reset} from './patient.reducer';
import {defaultValue} from "app/shared/model/patient.model";

import configureStore from 'redux-mock-store';
import thunk from 'redux-thunk';
import sinon from 'sinon';
import axios from 'axios';

type patientReducerType = {
  loading: boolean,
  errorMessage: string | null,
  entities: any[],
  entity: any,
}

const initialState: patientReducerType = {
  loading: false,
  errorMessage: null,
  entities: [],
  entity: defaultValue
}

describe('Patient reducer tests', () => {
  describe('Common tests', () => {

    it('should return the initial state', () => {
      const toTest = reducer(undefined, {type: ''});
      expect(toTest).toMatchObject({
        loading: false,
        errorMessage: null,
      });
    });

    it('should reset the state', () => {
      expect(reducer({...initialState, loading: true}, reset())).toEqual({
        ...initialState,
      });
    });
  });

  describe('Requests tests', () => {
    it('should set state to loading', () => {
      const toTest = reducer(undefined, {type: getEntities.pending.type});
      expect(toTest).toMatchObject({
        loading: true,
        errorMessage: null,
      });
    });
  });

  describe('Failures tests', () => {
    it('should set a message in errorMessage', () => {
      const toTest = reducer(undefined, {type: getEntities.rejected.type, error: {message: 'some message'}});
      expect(toTest).toMatchObject({
        loading: false,
        errorMessage: 'some message'
      });
    });
  });

  describe('Success tests', () => {
    it('should set entities', () => {
      const toTest = reducer(undefined, {type: getEntities.fulfilled.type, payload: {data: [{id: 1}]}});
      expect(toTest).toMatchObject({
        loading: false,
        entities: [{id: 1}]
      });
    });
  });

  describe('Actions tests', () => {
    let store;

    const resolvedObject = { value: 'whatever' };
    beforeEach(() => {
      const mockStore = configureStore([thunk]);
      store = mockStore({});
      axios.get = sinon.stub().returns(Promise.resolve(resolvedObject));
      axios.post = sinon.stub().returns(Promise.resolve(resolvedObject));
      axios.put = sinon.stub().returns(Promise.resolve(resolvedObject));
      axios.patch = sinon.stub().returns(Promise.resolve(resolvedObject));
      axios.delete = sinon.stub().returns(Promise.resolve(resolvedObject));
    });

    it('should dispatch action getEntities', async () => {
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
  });


});
