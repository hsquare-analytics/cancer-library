package io.planit.cancerlibrary.core.sql.datasource.service;

import io.planit.cancerlibrary.core.sql.datasource.dto.DataSourceDto;

import java.util.List;

public interface DataSourceService {
    List<DataSourceDto> getDataSourceList(String table);
}
