package io.planit.cancerlibrary.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DatasourceMapper {

    @MapKey("id")
    List<Map> executeSelectSQL(SQLAdapter sqlAdapter);

    @MapKey("id")
    Integer executeInsertSQL(SQLAdapter sqlAdapter);

    @MapKey("id")
    Integer executeUpdateSQL(SQLAdapter sqlAdapter);
}
