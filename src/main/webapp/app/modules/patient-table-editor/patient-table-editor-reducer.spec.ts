import axios from 'axios';

import configureStore from 'redux-mock-store';
import thunk from 'redux-thunk';
import sinon from 'sinon';

import reducer, {
  getAccessiblePatients,
  getDataSources,
  getPatient,
  getUsableCategories,
  getUsableItems,
  reset,
  resetDataSource,
  resetItem,
  setPatient
} from './patient-table-editor.reducer';
import {IPatient} from "app/shared/model/patient.model";

describe('User Patient selector module reducer tests', () => {
  function isEmpty(element): boolean {
    if (element instanceof Array) {
      return element.length === 0;
    } else {
      return Object.keys(element).length === 0;
    }
  }

  const initialState = {
    item: {
      container: {},
      count: 0
    },
    dataSource: {
      container: {},
      count: 0
    },
    loading: {
      patient: false,
      patients: false,
      categories: false,
    },
    patient: {} as IPatient,
    patients: [],
    categories: [],
    errorMessage: null,
  }

  function testInitialState(state) {
    expect(state).toMatchObject({
      loading: {
        patient: false,
        patients: false,
        categories: false,
      },
      errorMessage: null,
    });
    expect(isEmpty(state.item.container));
    expect(isEmpty(state.dataSource.container));
    expect(isNaN(state.item.count));
    expect(isNaN(state.dataSource.count));
    expect(isEmpty(state.patient));
    expect(isEmpty(state.patients));
  }

  describe('Common', () => {
    it('should return the initial state', () => {
      testInitialState(reducer(undefined, {type: ''}));
    });

    it('should reset the state', () => {
      expect(reducer({
        ...initialState, loading: {
          patient: true,
          patients: true,
          categories: true,
        }
      }, reset())).toEqual({
        ...initialState
      });
    });

    it('should reset dataSource container', () => {
      expect(reducer({
        ...initialState,
        dataSource: {
          container: {},
          count: 0
        }
      }, resetDataSource())).toEqual({
        ...initialState
      });
    });

    it('should reset item container', () => {
      expect(reducer({
        ...initialState,
        item: {
          container: {},
          count: 0
        }
      }, resetItem())).toEqual({
        ...initialState
      });
    });

    it('should set patient', () => {
      expect(reducer({
        ...initialState, patient: null
      }, setPatient({id: 1}))).toEqual({
        ...initialState, patient: {id: 1}
      });
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

      expect(reducer(undefined, {type: getPatient.pending.type})).toMatchObject({
        errorMessage: null,
        loading: {
          ...initialState.loading,
          patient: true,
        }
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

      expect(reducer(undefined, {type: getPatient.rejected.type, payload, error})).toMatchObject({
        errorMessage: 'error message',
        loading: {
          ...initialState.loading,
          patient: false,
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
        item: {
          container: {
            fakeId: payload.data
          },
          count: 1
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
        dataSource: {
          container: {
            fakeId: payload.data.dataSource
          },
          count: 1
        }
      });
    });

    it('should fetch patient', () => {
      const payload = {data: [{group: {category: {id: 'fakeId'}}}]};

      expect(reducer(undefined, {
        type: getPatient.fulfilled.type,
        payload,
      })).toEqual({
        ...initialState,
        patient: payload.data,
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

    it('dispatches FETCH_PATIENT actions', async () => {
      const expectedActions = [
        {
          type: getPatient.pending.type
        },
        {
          type: getPatient.fulfilled.type,
          payload: resolvedObject
        }
      ];

      await store.dispatch(getPatient("test"));

      expect(store.getActions()[0]).toMatchObject(expectedActions[0]);
      expect(store.getActions()[1]).toMatchObject(expectedActions[1]);
    });


  });
});
