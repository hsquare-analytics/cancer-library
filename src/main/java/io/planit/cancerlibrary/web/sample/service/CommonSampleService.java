package io.planit.cancerlibrary.web.sample.service;

import io.planit.cancerlibrary.web.sample.mapper.SampleMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
@RequiredArgsConstructor
public class CommonSampleService implements SampleService {
    private final SampleMapper mapper;

    @Override
    public Map<String, Object> testQuery(String query) {
        return mapper.testQuery(query);
    }
}
