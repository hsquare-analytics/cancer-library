package io.planit.cancerlibrary.domain;

import io.planit.cancerlibrary.domain.sample.service.CommonSampleService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import java.util.Map;

@SpringBootTest(properties = {
    "jasypt.encryptor.password=test1127!@"
})
@Slf4j
@ActiveProfiles("local")
public class SampleTest {
    @Autowired
    private CommonSampleService commonSampleService;

    @Test
    @DisplayName("Test Connection")
    public void TestPostgresqlConnection() {
        final String query = "SELECT 1";

        Map<String, Object> actual = this.commonSampleService.testQuery(query);

        actual.forEach((key, value) -> log.debug(String.format("%s : %s", key, value.toString())));
    }
}
