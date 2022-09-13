package io.planit.cancerlibrary.domain.meta.constant;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum MetaDataType {
    SUBJECT("subject", "ag_meta_subject") ,
    TOPIC("topic", "ag_meta_topic"),
    CATEGORY("category", "ag_meta_category"),
    GROUP("group", "ag_meta_group"),
    ITEM("item", "ag_meta_item"),

    ;

    private final String name;
    private final String tableName;
}
