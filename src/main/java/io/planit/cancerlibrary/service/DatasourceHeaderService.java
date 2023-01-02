package io.planit.cancerlibrary.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Map;

import static io.planit.cancerlibrary.constant.DatasourceConstants.STATUS_COLUMN;
import static io.planit.cancerlibrary.constant.DatasourceConstants.parameterization;

@Service
@Transactional
public class DatasourceHeaderService {
    private final Logger log = LoggerFactory.getLogger(DatasourceHeaderService.class);

    private static final String ENTITY_NAME = "datasource";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    public HttpHeaders getCreateHeader(Map<String, Object> row) {
        HttpHeaders headers = new HttpHeaders();
        String status = (String) row.get(parameterization(STATUS_COLUMN));
        if (row.get("idx") != null) {
            headers.add("X-" + applicationName + "-alert", applicationName + ".datasource." + status.toLowerCase());
        } else {
            headers.add("X-" + applicationName + "-alert", applicationName + ".datasource.created");
        }
        try {
            String params = (String) row.get("idx");
            if (params != null) {
                headers.add("X-" + applicationName + "-params", URLEncoder.encode(params, StandardCharsets.UTF_8.toString()));
            }
        } catch (UnsupportedEncodingException e) {
            log.error("Failed to encode params", e);
        }
        return headers;
    }

    public HttpHeaders getUpdateHeader(Map<String, Object> row) {
        HttpHeaders headers = new HttpHeaders();
        String status = (String) row.get(parameterization(STATUS_COLUMN));
        if (status != null) {
            headers.add("X-" + applicationName + "-alert", applicationName + ".datasource." + status.toLowerCase());
        } else {
            headers.add("X-" + applicationName + "-alert", applicationName + ".datasource.updated");
        }
        try {
            String params = (String) row.get("idx");
            if (params != null) {
                headers.add("X-" + applicationName + "-params", URLEncoder.encode(params, StandardCharsets.UTF_8.toString()));
            }
        } catch (UnsupportedEncodingException e) {
            log.error("Failed to encode params", e);
        }
        return headers;
    }
}
