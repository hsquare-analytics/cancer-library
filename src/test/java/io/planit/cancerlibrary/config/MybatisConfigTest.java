package io.planit.cancerlibrary.config;

import static org.assertj.core.api.Assertions.assertThat;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.mapper.TestMapper;
import java.util.List;
import java.util.Map;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

@IntegrationTest
public class MybatisConfigTest {

    @Autowired
    private TestMapper testMapper;

    @Test
    public void contextLoad() {
        List<Map> userList = testMapper.findUserList();
        assertThat(userList).isNotNull();
    }
}
