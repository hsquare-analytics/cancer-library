package io.planit.cancerlibrary.core.sql.datasource.entity;

import java.util.List;
import java.util.stream.Collectors;

public class InMemoryDataSourceEntities {
    public static List<ClientDataSourceEntity> dataSourceList;

    public static List<ClientDataSourceEntity> getDataSourceList() {
        return dataSourceList;
    }

    public static void setDataSourceList(List<ClientDataSourceEntity> _dataSourceList) {
        dataSourceList = _dataSourceList;
    }

    public static List<String>  getDatabaseKeyList() {
        return dataSourceList.stream()
            .map(ClientDataSourceEntity::getDbKey)
            .collect(Collectors.toList());
    }

    public static ClientDataSourceEntity getDataSource(String databaseKey) {
        return dataSourceList.stream()
            .filter(dataSource -> dataSource.getDbKey().equals(databaseKey))
            .findAny()
            .orElseThrow();
    }

    public static String getDbmsType(String databaseKey) {
        return getDataSource(databaseKey).getDbmsType();
    }

    public static String getSchema(String databaseKey) {
        return getDataSource(databaseKey).getSchema();
    }
}
