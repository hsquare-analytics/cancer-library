package io.planit.cancerlibrary.domain.sample.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import java.util.Map;

@Mapper
public interface SampleMapper {
    Map<String, Object> testQuery(String query);

    @SelectProvider(type=SampleProvider.class, method = "get")
    String get();
}
