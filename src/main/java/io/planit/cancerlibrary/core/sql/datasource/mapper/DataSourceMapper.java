package io.planit.cancerlibrary.core.sql.datasource.mapper;

import io.planit.cancerlibrary.core.sql.datasource.dto.DataSourceDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.SelectProvider;

import java.util.List;

@Mapper
public interface DataSourceMapper {
    @SelectProvider(type = DataSourceProvider.class, method = "getSelectDataSourceList")
    List<DataSourceDto> getDataSourceList(Class domain, String table);
}
