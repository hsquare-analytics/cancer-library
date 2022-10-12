import reducer, {getPatients, reset} from './user-patient-dnd-grids.reducer';

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
    it('should set state to loading', () => {
      const result = reducer(undefined, {type: getPatients.pending.type});
      expect(result)
      .toMatchObject({
        loading: true,
        errorMessage: null,
      });
    });
  });

  describe('Failures', function () {
    it('should set a message in errorMessage', () => {
      const result = reducer(undefined, {type: getPatients.rejected.type, error: {message: 'some message'}});
      expect(result)
      .toMatchObject({
        loading: false,
        errorMessage: 'some message'
      });
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
  });
});
