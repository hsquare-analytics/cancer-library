package io.planit.cancerlibrary.core.sql.datasource.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;
import java.util.StringJoiner;

@Getter
@Setter
@Builder
public class DataSourceDto {
    private String dbKey;
    private String driverNm;
    private String jdbcUrl;
    private String userNm;
    private String userPw;
    private String dbType;
    private String schema;
    private String dbms;
    private Timestamp loadDtm;

    public String getUniqueDbKey() {
        return getDbKey() + getDbType();
    }

    @Override
    public String toString() {
        StringJoiner sj = new StringJoiner(" ");
        sj.add(dbKey);
        sj.add(driverNm);
        sj.add(jdbcUrl);
        sj.add(userNm);
        sj.add(userPw);
        sj.add(dbType);
        sj.add(schema);
        sj.add(dbms);
        sj.add(loadDtm.toString());

        return sj.toString();
    }
}
