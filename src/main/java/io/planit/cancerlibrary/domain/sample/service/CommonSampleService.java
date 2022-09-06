package io.planit.cancerlibrary.domain.sample.service;

import io.planit.cancerlibrary.domain.sample.mapper.SampleMapper;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class CommonSampleService implements SampleService{
    private final SampleMapper _sampleMapper;

    CommonSampleService(SampleMapper sampleMapper) {
        _sampleMapper = sampleMapper;
    }

    @Override
    public Map<String, Object> testQuery(String query) {
        return _sampleMapper.testQuery(query);
    }
}
