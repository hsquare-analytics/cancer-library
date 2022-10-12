import reducer, {reset} from './user-patient-dnd-grids.reducer';

describe('user-patient-dnd-grids.reducer', () => {
  function isEmpty(element): boolean {
    if (element instanceof Array) {
      return element.length === 0;
    } else {
      return Object.keys(element).length === 0;
    }
  }

  const initialState = {
    patients: [],
    loading: false,
    errorMessage: null,
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

  });
});
