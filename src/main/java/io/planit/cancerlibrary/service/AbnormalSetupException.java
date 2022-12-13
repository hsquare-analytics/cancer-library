package io.planit.cancerlibrary.service;

public class AbnormalSetupException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public AbnormalSetupException() {
        super("Abnormal setup");
    }

    public AbnormalSetupException(String message) {
        super(message);
    }
}
