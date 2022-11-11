package io.planit.cancerlibrary.repository;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Repository
public class SqlExecutor {
    JdbcTemplate jdbcTemplate;

    public SqlExecutor(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public Long getSequenceNextValue() {
        return jdbcTemplate.query("SELECT NEXTVAL('sequence_generator')",
            rs -> {
                if (rs.next()) {
                    return rs.getLong(1);
                } else {
                    throw new SQLException("Unable to retrieve value from sequence sequence_generator.");
                }
            });
    }

    public List<Map<String, Object>> executeSelectAll(String sql) {
        List<Map<String, Object>> result = jdbcTemplate.queryForList(sql);
        return result.stream().map(SqlExecutor::keyChangeLowerMap).collect(Collectors.toList());
    }

    public Map<String, Object> executeSelectOne(String sql) {
        return keyChangeLowerMap(jdbcTemplate.queryForMap(sql));
    }

    public Boolean executeDML(String sql) {
        return jdbcTemplate.update(sql) > 0;
    }

    public static Map<String, Object> keyChangeLowerMap(Map<String, Object> param) {

        Iterator<String> iteratorKey = param.keySet().iterator();

        Map<String, Object> newMap = new HashMap<>();

        while (iteratorKey.hasNext()) {
            String key = iteratorKey.next();
            newMap.put(key.toLowerCase(), param.get(key));
        }

        return newMap;

    }
}


