import reducer, {getEntities} from './patient.reducer';

describe('Patient reducer tests', () => {
  describe('Common tests', () => {

    it('should return the initial state', () => {
      const toTest = reducer(undefined, {type: ''});
      expect(toTest).toMatchObject({
        loading: false,
        errorMessage: null,
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

});
