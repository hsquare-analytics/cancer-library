package io.planit.cancerlibrary.domain.meta.mapper;

import org.apache.ibatis.jdbc.SQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Arrays;
import java.util.Map;

public class MetaProviderBuilder implements ProviderBuilder {
    private final Logger log = LoggerFactory.getLogger(MetaProviderBuilder.class);

    public String getSelectMeta(Class domain, String table, Map<String, Object> param) {
        SQL sql = new SQL();

        sql.SELECT(ProviderUtils.getColumns(domain));
        sql.FROM(table);
        sql.WHERE("1 = 1");

        whereSentence(domain, sql, param);
        return  sql.toString();
    }

    public String getInsertMeta(Class domain, String table, Map<String, Object> param) {
        SQL sql = new SQL();

        sql.INSERT_INTO(table);

        insertValuesSentence(domain, sql, param);
        return sql.toString();
    }

    public String getUpdateMeta(Class domain, String table, Map<String, Object> newParam, Map<String, Object> oldParam) {
        SQL sql = new SQL();

        sql.UPDATE(table);

        setValuesSentence(domain, sql, newParam);
        whereSentence(domain, sql, oldParam);

        return sql.toString();
    }

    public String getDeleteMeta(Class domain, String table, Map<String, Object> param) {
        SQL sql = new SQL();
        sql.DELETE_FROM(table);

        whereSentence(domain, sql, param);

        return sql.toString();
    }
}
