package io.planit.cancerlibrary.service;

public class ParameterDeficiencyException extends RuntimeException {
    private static final long serialVersionUID = 1L;

    public ParameterDeficiencyException() {
        super("There is a parameter deficiency");
    }
}
