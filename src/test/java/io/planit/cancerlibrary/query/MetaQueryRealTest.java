package io.planit.cancerlibrary.query;

import com.fasterxml.jackson.databind.ObjectMapper;
import io.planit.cancerlibrary.core.sql.utils.ConvertUtils;
import io.planit.cancerlibrary.domain.meta.constant.MetaDataType;
import io.planit.cancerlibrary.domain.meta.dto.MetaSubjectDto;
import io.planit.cancerlibrary.domain.meta.service.SubjectMetaService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SpringBootTest(properties = {
    "jasypt.encryptor.password=test1127!@"
})
@Slf4j
@ActiveProfiles("local")
public class MetaQueryRealTest {
    @Autowired
    private SubjectMetaService subjectMetaService;

    @Test
    @DisplayName("Test Meta Query")
    public void TestMetaQuerySubjectList() {
        List<MetaSubjectDto> result = subjectMetaService.getMetaList(MetaDataType.SUBJECT);

        log.info(result.size() + "");

        MetaSubjectDto paramDto = new MetaSubjectDto();
        paramDto.setId(1);

        MetaSubjectDto dto = subjectMetaService.getMeta(
            MetaDataType.SUBJECT,
            ConvertUtils.toMap(MetaSubjectDto.class, paramDto)
        ).orElseThrow();

        log.info(dto.toString());
    }
}
