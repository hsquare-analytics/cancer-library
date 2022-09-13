package io.planit.cancerlibrary.domain.meta.mapper;

import io.planit.cancerlibrary.core.sql.builder.ProviderBuilder;
import io.planit.cancerlibrary.core.sql.constant.SqlType;
import lombok.extern.slf4j.Slf4j;

import java.util.Map;

@Slf4j
public class MetaProvider {
    public String getSelectMetaList(Class domain, String table) throws  Exception {
        return new ProviderBuilder()
            .setClazz(domain)
            .columns()
            .table(SqlType.SELECT, table)
            .build();
    }

    public String getSelectMeta(Class domain, String table, Map<String, Object> param) throws Exception {
         return new ProviderBuilder()
            .setClazz(domain)
             .columns()
             .table(SqlType.SELECT, table)
             .where("1 = 1")
             .and()
             .where(param)
             .build();
    }

    public String getInsertMeta(Class domain, String table, Map<String, Object> param) throws Exception {
        return new ProviderBuilder()
            .setClazz(domain)
            .table(SqlType.INSERT, table)
            .insertValues(param)
            .build();
    }

    public String getUpdateMeta(Class domain, String table, Map<String, Object> newParam, Map<String, Object> oldParam) throws Exception {
        return new ProviderBuilder()
            .setClazz(domain)
            .table(SqlType.UPDATE, table)
            .setValues(newParam)
            .where("1 = 1")
            .and()
            .where(oldParam)
            .build();
    }

    public String getDeleteMeta(Class domain, String table, Map<String, Object> param) throws Exception {
        return new ProviderBuilder()
            .setClazz(domain)
            .table(SqlType.DELETE, table)
            .where("1 = 1")
            .and()
            .where(param)
            .build();
    }
}
