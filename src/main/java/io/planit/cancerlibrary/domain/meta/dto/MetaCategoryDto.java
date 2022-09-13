package io.planit.cancerlibrary.domain.meta.dto;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;
import java.util.StringJoiner;

@Getter
@Setter
public class MetaCategoryDto {
    private int topicId;
    private int id;
    private int seq;
    private String name;
    private String tableName;
    private Boolean isActive;
    private String dbKey;
    private Timestamp loadDtm;

    @Override
    public String toString() {
        StringJoiner sj = new StringJoiner(" ");
        sj.add(String.valueOf(topicId));
        sj.add(String.valueOf(id));
        sj.add(String.valueOf(seq));
        sj.add(name);
        sj.add(tableName);
        sj.add(dbKey);
        sj.add(String.valueOf(isActive));
        sj.add(loadDtm.toString());

        return sj.toString();
    }
}
