package io.planit.cancerlibrary.config;

import org.jasypt.encryption.StringEncryptor;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import javax.annotation.Resource;

@SpringBootTest(properties = {
    "jasypt.encryptor.password=test1127!@"
})
@ActiveProfiles("local")
public class JasyptConfigTest {
    private final Logger log = LoggerFactory.getLogger(JasyptConfigTest.class);

    @Resource(name = "jasyptStringEncryptor")
    private StringEncryptor encryptor;

    @Test
    @DisplayName("Property Encryptor Test")
    public void testJasyptConfigure() {
       String jdbcUrlEncrypted = encryptor.encrypt("jdbc:postgresql://localhost:5432/postgres");
       log.info(jdbcUrlEncrypted);

       String jdbcUserEncrypted = encryptor.encrypt("postgres");
       log.info(jdbcUserEncrypted);

       // NOTICE : 실제 패스워드를 적고 커밋 및 푸시 하지 말것
       String jdbcPasswordEncrypted = encryptor.encrypt("postgres");
       log.info(jdbcPasswordEncrypted);

       String jdbcUrlDecrypted = encryptor.decrypt(jdbcUrlEncrypted);
       String jdbcUserDecrypted = encryptor.decrypt(jdbcUserEncrypted);
       String jdbcPasswordDecrypted = encryptor.decrypt(jdbcPasswordEncrypted);
       log.info(String.format("\n%s\n%s\n%s\n", jdbcUrlDecrypted, jdbcUserDecrypted, jdbcPasswordDecrypted));
    }
}
