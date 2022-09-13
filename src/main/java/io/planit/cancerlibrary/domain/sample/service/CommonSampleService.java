package io.planit.cancerlibrary.domain.sample.service;

import io.planit.cancerlibrary.domain.sample.mapper.SampleMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
@RequiredArgsConstructor
public class CommonSampleService implements SampleService{
    private final SampleMapper _sampleMapper;

    @Override
    public Map<String, Object> testQuery(String query) {
        return _sampleMapper.testQuery(query);
    }
}
