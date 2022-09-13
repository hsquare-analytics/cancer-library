package io.planit.cancerlibrary.domain.sample.service;

import java.util.HashMap;
import java.util.Map;

public interface SampleService {
    default Map<String, Object> testQuery(String query) {
        return new HashMap<>();
    }
}
