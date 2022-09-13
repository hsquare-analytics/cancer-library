package io.planit.cancerlibrary.domain.meta.dto;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;
import java.util.StringJoiner;

@Getter
@Setter
public class MetaGroupDto {
    private int categoryId;
    private int id;
    private int seq;
    private String name;
    private Boolean isActive;
    private String dbKey;
    private Timestamp loadDtm;

    @Override
    public String toString() {
        StringJoiner sj = new StringJoiner(" ");
        sj.add(String.valueOf(categoryId));
        sj.add(String.valueOf(id));
        sj.add(String.valueOf(seq));
        sj.add(name);
        sj.add(String.valueOf(isActive));
        sj.add(dbKey);
        sj.add(loadDtm.toString());

        return sj.toString();
    }
}
