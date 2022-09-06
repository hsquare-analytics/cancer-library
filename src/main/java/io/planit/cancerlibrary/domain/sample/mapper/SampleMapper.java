package io.planit.cancerlibrary.domain.sample.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface SampleMapper {
    Map<String, Object> testQuery(String query);
}
