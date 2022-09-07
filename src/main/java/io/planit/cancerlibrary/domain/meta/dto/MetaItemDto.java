package io.planit.cancerlibrary.domain.meta.dto;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;
import java.util.StringJoiner;

@Getter
@Setter
public class MetaItemDto {
    private int groupId;
    private int id;
    private int seq;
    private String columns;
    private String name;
    private String dataType;
    private String dataLength;
    private Boolean isActive;
    private Boolean isEditable;
    private String dbKey;
    private Timestamp loadDtm;

    @Override
    public String toString() {
        StringJoiner sj = new StringJoiner(" ");
        sj.add(String.valueOf(groupId));
        sj.add(String.valueOf(id));
        sj.add(String.valueOf(seq));
        sj.add(columns);
        sj.add(name);
        sj.add(dataType);
        sj.add(dataLength);
        sj.add(String.valueOf(isActive));
        sj.add(String.valueOf(isEditable));
        sj.add(dbKey);
        sj.add(loadDtm.toString());

        return sj.toString();
    }
}
