package io.planit.cancerlibrary.mapper;

import org.apache.ibatis.jdbc.SQL;

public class SQLAdapter {
    String sql;

    public SQLAdapter(SQL sql) {
        this.sql = sql.toString();
    }

    public SQLAdapter(String sql) {
        this.sql = sql;
    }

    public String getSql() {
        return sql;
    }

    public void setSql(String sql) {
        this.sql = sql;
    }

}
