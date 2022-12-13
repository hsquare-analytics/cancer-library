package io.planit.cancerlibrary.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * Properties specific to Cancer Library App.
 * <p>
 * Properties are configured in the {@code application.yml} file.
 * See {@link tech.jhipster.config.JHipsterProperties} for a good example.
 */
@ConfigurationProperties(prefix = "application", ignoreUnknownFields = false)
public class ApplicationProperties {
    private final Hospital hospital = new Hospital();

    public static class Hospital {
        private String code;

        public String getCode() {
            return code;
        }

        public void setCode(String code) {
            this.code = code;
        }
    }

    public Hospital getHospital() {
        return hospital;
    }
}
