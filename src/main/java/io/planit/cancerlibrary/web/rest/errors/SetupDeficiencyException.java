package io.planit.cancerlibrary.web.rest.errors;

public class SetupDeficiencyException extends BadRequestAlertException {

    private static final long serialVersionUID = 1L;

    public SetupDeficiencyException() {
        super(ErrorConstants.CONFIGURATION_DEFICIENCY_TYPE, "There is some deficiency of setup", "setup", "setupDeficiency");
    }
}
