package io.planit.cancerlibrary.mapper;

import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface DatasourceMapper {

    String getSequenceNextValue();

    @MapKey("id")
    List<Map<String, Object>> executeSelectSQL(SQLAdapter sqlAdapter);

    @MapKey("id")
    Integer executeInsertSQL(SQLAdapter sqlAdapter);

    @MapKey("id")
    Integer executeUpdateSQL(SQLAdapter sqlAdapter);

    @MapKey("id")
    Integer executeDeleteSQL(SQLAdapter sqlAdapter);
}
