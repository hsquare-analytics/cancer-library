package io.planit.cancerlibrary.web.rest.errors;

public class CategoryDeficiencyException extends ConfigurationDeficiencyBaseException {

    private static final long serialVersionUID = 1L;

    public CategoryDeficiencyException() {
        super("There is no usable category", "category");
    }
}
