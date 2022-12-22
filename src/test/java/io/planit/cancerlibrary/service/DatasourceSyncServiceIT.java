package io.planit.cancerlibrary.service;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.Patient;
import io.planit.cancerlibrary.domain.embedded.PatientDetail;
import io.planit.cancerlibrary.repository.SqlExecutor;
import io.planit.cancerlibrary.web.rest.PatientResourceIT;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.util.List;
import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;

@IntegrationTest
@Transactional
public class DatasourceSyncServiceIT {

    @Autowired
    private DatasourceSyncService datasourceSyncService;

    @Autowired
    private SqlExecutor sqlExecutor;

    @Test
    @Sql(scripts = "classpath:sql/cncr_rgst.ddl.sql")
    public void test_sync_fdx_update_not_exist() {
        // given
        Patient patient = PatientResourceIT.createPatientDTO();
        PatientDetail detail = patient.getDetail().standardDate(Instant.parse("2019-01-01T00:00:00Z"));

        sqlExecutor.executeDML(String.format("insert into gscn.cncr_rgst (idx, hosp_cd, pt_no, crtn_dt, fdx) values ('1', '1234', '%s', '2020-01-01', '20200101')", patient.getPtNo()));

        // when
        datasourceSyncService.syncPatientFdx(patient.detail(detail));

        // then
        List<Map<String, Object>> result = sqlExecutor.executeSelectAll(String.format("select * from gscn.cncr_rgst_updated where pt_no = '%s'", patient.getPtNo()));

        result.forEach(map -> {
            assertThat(map.get("fdx")).isEqualTo("20190101");
        });
    }

    @Test
    @Sql(scripts = "classpath:sql/cncr_rgst.ddl.sql")
    public void test_sync_fdx_update_exist() {
        // given
        Patient patient = PatientResourceIT.createPatientDTO();
        PatientDetail detail = patient.getDetail().standardDate(Instant.parse("2019-01-01T00:00:00Z"));

        sqlExecutor.executeDML(String.format("insert into gscn.cncr_rgst (idx, hosp_cd, pt_no, crtn_dt, fdx) values ('1', '1234', '%s', '2020-01-01', '20200101')", patient.getPtNo()));
        sqlExecutor.executeDML(String.format("insert into gscn.cncr_rgst_updated (idx, hosp_cd, pt_no, crtn_dt, fdx) values ('1', '1234', '%s', '2020-01-01', '20200101')", patient.getPtNo()));

        // when
        datasourceSyncService.syncPatientFdx(patient.detail(detail));

        // then
        List<Map<String, Object>> result = sqlExecutor.executeSelectAll(String.format("select * from gscn.cncr_rgst_updated where pt_no = '%s'", patient.getPtNo()));

        result.forEach(map -> {
            assertThat(map.get("fdx")).isEqualTo("20190101");
        });
    }
}
