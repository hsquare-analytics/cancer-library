package io.planit.cancerlibrary.config;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
class JasyptConfigurationTest {

    @Value("${jasypt.test-value}")
    private String testValue;

    @Test
    void jasypt_test() {
        String plainText = "test";

        StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
        encryptor.setPassword("password");
        encryptor.setAlgorithm("PBEWithMD5AndDES");
        String encryptedText = encryptor.encrypt(plainText);
        String decryptedText = encryptor.decrypt(encryptedText);

        assertThat(decryptedText).isEqualTo(plainText);
    }

    @Test
    void jasypt_config_test() {
        assertThat(testValue).isEqualTo("test");
    }
}
