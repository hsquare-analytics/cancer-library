package io.planit.cancerlibrary.web.rest.errors;

public class AbnormalSetupException extends BadRequestAlertException {

    private static final long serialVersionUID = 1L;

    public AbnormalSetupException() {
        super(ErrorConstants.ABNORMAL_CONFIGURATION_TYPE, "There is abnormal setup", "setup", "abnormalSetup");
    }
}
