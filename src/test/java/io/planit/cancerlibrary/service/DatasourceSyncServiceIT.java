package io.planit.cancerlibrary.service;

import io.planit.cancerlibrary.IntegrationTest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.transaction.annotation.Transactional;

@IntegrationTest
@Transactional
public class DatasourceSyncServiceIT {

    @Autowired
    private DatasourceSyncService datasourceSyncService;

    @Test
    @Sql(scripts = "classpath:sql/cncr_rgst.ddl.sql")
    public void test_sync_fdx() {
        // when:
        datasourceSyncService.syncFdx();
    }
}
