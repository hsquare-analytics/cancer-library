import axios from 'axios';

import configureStore from 'redux-mock-store';
import thunk from 'redux-thunk';
import sinon from 'sinon'

import reducer, {
  createUserPatientAuthorizations,
  getPatients,
  reset,
  setPatients
} from './user-patient-dnd-grids.reducer';

describe('user-patient-dnd-grids.reducer', () => {
  function isEmpty(element): boolean {
    if (element instanceof Array) {
      return element.length === 0;
    } else {
      return Object.keys(element).length === 0;
    }
  }

  function testMultipleTypes(types, payload, testFunction, error?) {
    types.forEach(e => {
      testFunction(reducer(undefined, {type: e, payload, error}));
    });
  }

  const initialState = {
    patients: [],
    loading: false,
    errorMessage: null,
    updating: false,
    updateSuccess: false,
  };

  describe('common', () => {
    it('should return the initial state', () => {
      const result = reducer(undefined, {type: ''});
      expect(result)
      .toMatchObject({
        loading: false,
        errorMessage: null,
      });
      expect(isEmpty(result.patients));
    });

    it('should reset the state', () => {
      expect(reducer({...initialState, loading: true}, reset())).toEqual({
        ...initialState
      });
    });
  });

  describe('Requests', function () {
    it('should set state to loading', () => {
      testMultipleTypes([getPatients.pending.type], {}, state => {
        expect(state).toMatchObject({
          errorMessage: null,
          loading: true,
        });
      });
    });

    it('should set state to updating', () => {
      testMultipleTypes([createUserPatientAuthorizations.pending.type], {}, state => {
        expect(state).toMatchObject({
          errorMessage: null,
          updating: true,
        });
      });
    });

    it('should set patients', () => {
      const patients = [{id: 1}, {id: 2}];
      const result = reducer(undefined, setPatients(patients));
      expect(result)
      .toEqual({
        ...initialState,
        patients,
      });
    });
  });

  describe('Failures', function () {
    it('should set a message in errorMessage', () => {
      testMultipleTypes([getPatients.rejected.type,
          createUserPatientAuthorizations.rejected.type],
        'some message', state => {
          expect(state).toMatchObject({
            updateSuccess: false,
            updating: false,
            errorMessage: 'error message'
          });
        }, {
          message: 'error message'
        })
    });
  });

  describe('Success', function () {
    it('should fetch patient data', () => {
      const payload = {data: [{id: 1, name: 'test'}]};

      const result = reducer(undefined, {type: getPatients.fulfilled.type, payload});
      expect(result)
      .toMatchObject({
        loading: false,
        patients: payload.data,
      });
    });

    it('should create user patient authorization', () => {
      const payload = {data: [{id: 1, name: 'test'}]};

      const result = reducer(undefined, {type: createUserPatientAuthorizations.fulfilled.type, payload});
      expect(result)
      .toMatchObject({
        updating: false,
        updateSuccess: true,
      });
    });
  });

  describe('Actions', function () {
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

    it('should dispatch getPatients', async () => {
      const expectedActions = [
        {
          type: getPatients.pending.type,
        },
        {
          type: getPatients.fulfilled.type,
          payload: resolvedObject,
        }
      ];

      await store.dispatch(getPatients("test"));
      expect(store.getActions()[0]).toMatchObject(expectedActions[0]);
      expect(store.getActions()[1]).toMatchObject(expectedActions[1]);
    });

    it('should dispatch createUserPatientAuthorizations', async () => {
      const expectedActions = [
        {
          type: createUserPatientAuthorizations.pending.type,
        },
        {
          type: getPatients.pending.type,
        },
        {
          type: createUserPatientAuthorizations.fulfilled.type,
          payload: resolvedObject,
        }
      ];

      await store.dispatch(createUserPatientAuthorizations({login: "test", patients: [{id: 1}]}));
      expect(store.getActions()[0]).toMatchObject(expectedActions[0]);
      expect(store.getActions()[1]).toMatchObject(expectedActions[1]);
      expect(store.getActions()[2]).toMatchObject(expectedActions[2]);
    });
  });
});
