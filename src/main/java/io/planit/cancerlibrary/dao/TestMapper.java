package io.planit.cancerlibrary.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TestMapper {
    @MapKey("id")
    List<Map> findUserList();
}
