package io.planit.cancerlibrary.service;

public class SetupDeficiencyException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public SetupDeficiencyException() {
        super("There is no usable setup");
    }
}
