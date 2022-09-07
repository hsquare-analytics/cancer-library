package io.planit.cancerlibrary.query;

import io.planit.cancerlibrary.domain.meta.constant.MetaDataType;
import io.planit.cancerlibrary.domain.meta.dto.MetaSubjectDto;
import io.planit.cancerlibrary.domain.meta.mapper.MetaProviderBuilder;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;


public class MetaQueryTest {
    private final Logger log = LoggerFactory.getLogger(MetaQueryTest.class);

    @Test
    @DisplayName("MetaQuery Test")
    public void getMetaColumns() {
        Map<String, Object> param = new HashMap<>();
        param.put("id", 0);
        MetaProviderBuilder builder = new MetaProviderBuilder();

        String result = builder.getSelectMeta(MetaSubjectDto.class, MetaDataType.SUBJECT.getTableName(), param);
        log.info(result);

        result = builder.getInsertMeta(MetaSubjectDto.class, MetaDataType.SUBJECT.getTableName(), param);
        log.info(result);

        result = builder.getUpdateMeta(MetaSubjectDto.class, MetaDataType.SUBJECT.getTableName(), param, param);
        log.info(result);

        result = builder.getDeleteMeta(MetaSubjectDto.class, MetaDataType.SUBJECT.getTableName(), param);
        log.info(result);
    }
}
