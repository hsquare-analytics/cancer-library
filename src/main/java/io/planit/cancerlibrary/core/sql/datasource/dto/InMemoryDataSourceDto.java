package io.planit.cancerlibrary.core.sql.datasource.dto;

import java.util.List;
import java.util.stream.Collectors;

public class InMemoryDataSourceDto {
    public static List<DataSourceDto> dataSourceList;

    public static List<DataSourceDto> getDataSourceList() {
        return dataSourceList;
    }

    public static void setDataSourceList(List<DataSourceDto> _dataSourceList) {
        dataSourceList = _dataSourceList;
    }

    public static List<String>  getDatabaseKeyList() {
        return dataSourceList.stream()
            .map(DataSourceDto::getDbKey)
            .collect(Collectors.toList());
    }

    public static DataSourceDto getDataSource(String databaseKey) {
        return dataSourceList.stream()
            .filter(dataSource -> dataSource.getDbKey().equals(databaseKey))
            .findAny()
            .orElseThrow();
    }

    public static String getDbmsType(String databaseKey) {
        return getDataSource(databaseKey).getDbType();
    }

    public static String getSchema(String databaseKey) {
        return getDataSource(databaseKey).getSchema();
    }
}
