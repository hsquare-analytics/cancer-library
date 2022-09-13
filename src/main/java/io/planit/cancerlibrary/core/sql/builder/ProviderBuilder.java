package io.planit.cancerlibrary.core.sql.builder;

import io.planit.cancerlibrary.core.sql.constant.SqlType;
import io.planit.cancerlibrary.core.sql.utils.ProviderUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.jdbc.SQL;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Slf4j
public class ProviderBuilder {
    private Class domain = null;
    private List<Field> rawColumn;
    private SQL sql;

    private boolean clazzIsNull() {
        return domain == null;
    }

    public ProviderBuilder setClazz(Class _domain) {
        domain = _domain;
        rawColumn = Arrays.asList(domain.getDeclaredFields());
        if ( sql == null) {
            sql = new SQL();
        }

        return this;
    }

    public ProviderBuilder and() {
        sql.AND();
        return this;
    }

    public ProviderBuilder or() {
        sql.OR();
        return this;
    }

    public ProviderBuilder orderBy(Map<String, Object> param) throws Exception {
        if( clazzIsNull() ) throw new Exception("");
        rawColumn.forEach(item -> {
            String itemName = item.getName();
            if (param.containsKey(itemName)) {
                sql.ORDER_BY(ProviderUtils.toLowerCase(itemName).orElseThrow());
            }
        });

        return this;
    }

    public ProviderBuilder offset(Object offset) {
        sql.OFFSET(String.valueOf(offset));

        return this;
    }

    public ProviderBuilder where(Map<String, Object> param) throws Exception {
        if( clazzIsNull() ) throw new Exception("");
        if ( param == null || param.isEmpty()) return this;

        rawColumn.forEach(item -> {
            String itemName = item.getName();
            if(param.containsKey(itemName)) {
                String is = ProviderUtils.is(param.get(itemName)).orElseThrow();
                String sentence = String.format("%s %s", itemName, is);
                sql.WHERE(sentence);
            }
        });

        return this;
    }

    public ProviderBuilder where(String sentence) throws Exception {
        if( clazzIsNull() ) throw new Exception("");
        sql.WHERE(sentence);
        return this;
    }

    public ProviderBuilder insertValues(Map<String, Object> param) throws Exception {
        if( clazzIsNull() ) throw new Exception("");

        rawColumn.forEach(item-> {
            String itemName = item.getName();
            String column = ProviderUtils.toLowerCase(itemName).orElseThrow();
            if (param.containsKey(itemName)) {
                String value = param.get(itemName).toString();
                sql.VALUES(column, value);
            } else {
                // TODO : Set Default Values;
                String defaultApostrophe = ProviderUtils.apostrophe(" ").orElseThrow();
                sql.VALUES(column, defaultApostrophe);
            }
        });

        return this;
    }

    public ProviderBuilder insertValues(String colName, String value) throws Exception {
        if( clazzIsNull() ) throw new Exception("");
        sql.VALUES(colName, value);
        return this;
    }

    public ProviderBuilder setValues(Map<String, Object> param) throws Exception {
        if( clazzIsNull() ) throw new Exception("");

        rawColumn.forEach(item -> {
            String itemName = item.getName();
            if (param.containsKey(itemName)) {
                String value = ProviderUtils.is(param.get(itemName)).orElseThrow();
                sql.SET(String.format("%s %s", itemName, value));
            }
        });

        return this;
    }

    public ProviderBuilder setValues(String sentence) throws Exception {
        if ( clazzIsNull()) throw new Exception("");
       sql.SET(sentence);
        return this;
    }

    public ProviderBuilder columns() throws Exception {
        if( clazzIsNull() ) throw new Exception("");

        sql.SELECT(ProviderUtils.getColumns(domain));
        return this;
    }

    public ProviderBuilder table(SqlType type, String tableName) throws Exception {
        if ( clazzIsNull() ) throw new Exception("Class is NULL");

        switch (type) {
            case SELECT:
                sql.FROM(tableName);
                break;
            case INSERT:
                sql.INSERT_INTO(tableName);
                break;
            case UPDATE:
                sql.UPDATE(tableName);
                break;
            case DELETE:
                sql.DELETE_FROM(tableName);
                break;
            default:
                throw new Exception(" Not Supported ");
        }

        return this;
    }

    public String build() {
        return sql.toString();
    }
}
