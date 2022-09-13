package io.planit.cancerlibrary.core.sql.datasource.mapper;

import io.planit.cancerlibrary.core.sql.builder.ProviderBuilder;
import io.planit.cancerlibrary.core.sql.constant.SqlType;

public class DataSourceProvider {
    public String getSelectDataSourceList(Class domain, String table) throws Exception {
        return new ProviderBuilder()
            .setClazz(domain)
            .columns()
            .table(SqlType.SELECT, table)
            .build();
    }
}
