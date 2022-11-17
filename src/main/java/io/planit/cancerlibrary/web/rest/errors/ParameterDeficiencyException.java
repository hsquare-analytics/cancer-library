package io.planit.cancerlibrary.web.rest.errors;

public class ParameterDeficiencyException extends BadRequestAlertException {

    private static final long serialVersionUID = 1L;

    public ParameterDeficiencyException() {
        super(ErrorConstants.PARAMETER_DEFICIENCY_TYPE, "Parameter is deficiency!", "parameter", "parameterDeficiency");
    }
}
