package io.planit.cancerlibrary.web.rest.errors;

public class CategoryDeficiencyException extends BadRequestAlertException {

    private static final long serialVersionUID = 1L;

    public CategoryDeficiencyException() {
        super(ErrorConstants.CONFIGURATION_DEFICIENCY_TYPE, "There is no usable category", "category", "configurationDeficiency");
    }
}
