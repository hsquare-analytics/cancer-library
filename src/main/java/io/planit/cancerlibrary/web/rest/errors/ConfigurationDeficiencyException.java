package io.planit.cancerlibrary.web.rest.errors;

import java.util.HashMap;
import java.util.Map;
import org.zalando.problem.AbstractThrowableProblem;
import org.zalando.problem.Status;

public class ConfigurationDeficiencyException extends AbstractThrowableProblem {

    private static final long serialVersionUID = 1L;

    private final String entityName;

    private final String errorKey;

    public ConfigurationDeficiencyException(String defaultMessage, String entityName) {
        super(ErrorConstants.CONFIGURATION_DEFICIENCY_TYPE, defaultMessage, Status.BAD_REQUEST, null, null, null, getAlertParameters(entityName));
        this.entityName = entityName;
        this.errorKey = "configurationDeficiency";
    }

    public String getEntityName() {
        return entityName;
    }

    public String getErrorKey() {
        return errorKey;
    }

    private static Map<String, Object> getAlertParameters(String entityName) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("message", "error.configurationDeficiency");
        parameters.put("params", entityName);
        return parameters;
    }}
