package io.planit.cancerlibrary.query;

import com.fasterxml.jackson.databind.ObjectMapper;
import io.planit.cancerlibrary.core.sql.utils.ConvertUtils;
import io.planit.cancerlibrary.domain.meta.constant.MetaDataType;
import io.planit.cancerlibrary.domain.meta.dto.MetaSubjectDto;
import io.planit.cancerlibrary.domain.meta.mapper.MetaProvider;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.Map;


@Slf4j
public class MetaQueryTest {
    @Test
    @DisplayName("MetaQuery Test")
    public void getMetaColumns() {
        Map<String, Object> param = new HashMap<>();
        param.put("id", 0);
        MetaProvider builder = new MetaProvider();

        try {
            String result = builder.getSelectMeta(MetaSubjectDto.class, MetaDataType.SUBJECT.getTableName(), param);
            log.info(result);

            result = builder.getInsertMeta(MetaSubjectDto.class, MetaDataType.SUBJECT.getTableName(), param);
            log.info(result);

            result = builder.getUpdateMeta(MetaSubjectDto.class, MetaDataType.SUBJECT.getTableName(), param, param);
            log.info(result);

            result = builder.getDeleteMeta(MetaSubjectDto.class, MetaDataType.SUBJECT.getTableName(), param);
            log.info(result);
        } catch (Exception e) {
            log.error(e.getMessage());
        }
    }

    @Test
    @DisplayName("Convert Test")
    public void TestDtoToObj() {
        MetaSubjectDto paramDto = new MetaSubjectDto();

        paramDto.setId(1);

        Map<String, Object> testResult = ConvertUtils.toMap(MetaSubjectDto.class, paramDto);

        testResult.forEach((key, value) -> {
            log.info(String.format("%s %s", key, String.valueOf(value)));
        });
    }
}
