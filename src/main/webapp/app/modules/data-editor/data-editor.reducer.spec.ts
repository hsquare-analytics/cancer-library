import axios from 'axios';

import configureStore from 'redux-mock-store';
import thunk from 'redux-thunk';
import sinon from 'sinon';

import reducer, {
  getCategoryById,
  getDatasourceApprovalByCategoryId,
  getDatasourceEditorByCategoryId,
  getItemListByCategoryId,
  reset,
  updateDatasourceEditorRow
} from './data-editor.reducer';

describe('User category selector module reducer tests', () => {
  function isEmpty(element): boolean {
    if (element instanceof Array) {
      return element.length === 0;
    } else {
      return Object.keys(element).length === 0;
    }
  }

  const initialState = {
    category: {},
    datasource: [],
    items: [],
    loading: false,
    errorMessage: null,
    updating: false,
    updateSuccess: false,
  }

  function testInitialState(state) {
    expect(state).toMatchObject({
      loading: false,
      errorMessage: null,
    });
    expect(isEmpty(state.category));
    expect(isEmpty(state.datasource));
    expect(isEmpty(state.items));
  }

  function testMultipleTypes(types, payload, testFunction, error?) {
    types.forEach(e => {
      testFunction(reducer(undefined, {type: e, payload, error}))
    });
  }

  describe('Common', () => {
    it('should return the initial state', () => {
      testInitialState(reducer(undefined, {type: 'unknown'}));
    });
  });

  describe('Requests', () => {
    it('should set state to loading', () => {
      testMultipleTypes([getDatasourceEditorByCategoryId.pending.type, getDatasourceApprovalByCategoryId.pending.type, getItemListByCategoryId.pending.type, getCategoryById.pending.type], {}, state => {
        expect(state).toMatchObject({
          errorMessage: null,
          loading: true,
        });
      });
    });

    it('should set state to updating', () => {
      testMultipleTypes([updateDatasourceEditorRow.pending.type], {}, state => {
        expect(state).toMatchObject({
          errorMessage: null,
          updateSuccess: false,
          updating: true,
        });
      });
    });

    it('should reset the state', () => {
      expect(reducer({...initialState, updating: true, updateSuccess: true, loading: true}, reset())).toEqual({
        ...initialState
      });
    });
  });

  describe('Failures', () => {
    it('should set a message in errorMessage', () => {
      testMultipleTypes([
          getDatasourceEditorByCategoryId.rejected.type,
          getDatasourceApprovalByCategoryId.rejected.type,
          getItemListByCategoryId.rejected.type,
          getCategoryById.rejected.type, updateDatasourceEditorRow.rejected.type
        ],
        {message: 'something happened'},
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
      testMultipleTypes([getDatasourceEditorByCategoryId.fulfilled.type, getDatasourceApprovalByCategoryId.fulfilled.type], payload,
        state => {
          expect(reducer(undefined, {
            type: getDatasourceEditorByCategoryId.fulfilled.type,
            payload,
          })).toEqual({
            ...initialState,
            loading: false,
            datasource: payload.data,
          });
        }
      )
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

    it('should fetch category', () => {
      const payload = {data: [{1: 'fake1', 2: 'fake2'}]};

      expect(reducer(undefined, {
        type: getCategoryById.fulfilled.type,
        payload,
      })).toEqual({
        ...initialState,
        loading: false,
        category: payload.data,
      });
    });

    it('should set state to successful update', () => {
      testMultipleTypes([updateDatasourceEditorRow.fulfilled.type], {data: 'some handsome user'}, state => {
        expect(state).toMatchObject({
          updating: false,
          updateSuccess: true,
        });
      });
    })
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
          type: getDatasourceEditorByCategoryId.pending.type
        },
        {
          type: getDatasourceEditorByCategoryId.fulfilled.type,
          payload: resolvedObject
        }
      ];

      await store.dispatch(getDatasourceEditorByCategoryId(1));

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

    it('dispatches FETCH_CATEGORY actions', async () => {
      const expectedActions = [
        {
          type: getCategoryById.pending.type
        },
        {
          type: getCategoryById.fulfilled.type,
          payload: resolvedObject
        }
      ];

      await store.dispatch(getCategoryById(1));

      expect(store.getActions()[0]).toMatchObject(expectedActions[0]);
      expect(store.getActions()[1]).toMatchObject(expectedActions[1]);
    });
  });
});
