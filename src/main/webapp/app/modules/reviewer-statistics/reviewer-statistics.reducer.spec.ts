import reducer, {getEntities, reset} from './reviewer-statistics.reducer';

describe('reviewerstatistics reducer tests', () => {
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
});
