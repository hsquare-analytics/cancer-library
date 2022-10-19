import reducer, {
  reset,
  setCategory
} from "app/modules/patient-table-editor/reducer/patient-table-editor.config.reducer";

describe("PatientTableEditorConfigReducer", () => {

  function isEmpty(element): boolean {
    if (element instanceof Array) {
      return element.length === 0;
    } else {
      return Object.keys(element).length === 0;
    }
  }

  const initialState = {
    category: "",
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
    expect(isEmpty(state.category));
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

    it('should set category', () => {
      expect(reducer(undefined, setCategory("test"))).toEqual({
        ...initialState,
        category: "test"
      });
    });
  });

});
