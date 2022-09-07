package io.planit.cancerlibrary.domain.meta.mapper;

import org.apache.ibatis.jdbc.SQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Arrays;
import java.util.Map;

public interface ProviderBuilder {
    Logger log = LoggerFactory.getLogger(ProviderBuilder.class);

    default void whereSentence(Class domain, SQL sql, Map<String, Object> param) {
        Arrays.stream(domain.getDeclaredFields()).forEach(item -> {
            if (param.containsKey(item.getName())) {
                try {
                    sql.AND();
                    sql.WHERE(String.format("%s %s", item.getName(), ProviderUtils.is(param.get(item.getName())).orElseThrow()));
                } catch (Exception e) {
                    log.error(e.getMessage());
                }
            }
        });
    }

    default void insertValuesSentence(Class domin, SQL sql, Map<String, Object> param) {
        Arrays.stream(domin.getDeclaredFields()).forEach(item-> {
            if (param.containsKey(item.getName())) {
                sql.VALUES(ProviderUtils.toLowerCase(item.getName()).orElseThrow(), param.get(item.getName()).toString());
            } else {
                // TODO : Set Default Values;
                sql.VALUES(ProviderUtils.toLowerCase(item.getName()).orElseThrow(), ProviderUtils.apostrophe(" ").orElseThrow());
            }
        });
    }

    default void setValuesSentence(Class domain, SQL sql, Map<String, Object> param) {
        Arrays.stream(domain.getDeclaredFields()).forEach(item -> {
            if (param.containsKey(item.getName())) {
                sql.SET(String.format("%s %s", item.getName(), ProviderUtils.is(param.get(item.getName())).orElseThrow()));
            }
        });
    }
}
