package io.planit.cancerlibrary.web.sample.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.SelectProvider;

import java.util.Map;

@Mapper
public interface SampleMapper {
    Map<String, Object> testQuery(String query);

    @SelectProvider(type=SampleProvider.class, method = "get")
    String get();
}
