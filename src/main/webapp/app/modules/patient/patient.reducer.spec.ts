import reducer from './patient.reducer';

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
});
