package io.planit.cancerlibrary.service;

import io.planit.cancerlibrary.domain.Patient;
import io.planit.cancerlibrary.repository.SqlExecutor;
import org.apache.ibatis.jdbc.SQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.thymeleaf.util.MapUtils;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import static io.planit.cancerlibrary.constant.DatasourceConstants.getSqlEqualSyntax;

@Service
public class DatasourceSyncService {

    private final Logger log = LoggerFactory.getLogger(DatasourceSyncService.class);
    private final SqlExecutor sqlExecutor;

    public DatasourceSyncService(SqlExecutor sqlExecutor) {
        this.sqlExecutor = sqlExecutor;
    }

    public void syncPatientFdx(Patient patient, String login) {
        log.debug("Request to sync patient fdx : {}", patient);
        String selectAllQuery = String.format("select * from gscn.cncr_rgst where pt_no = '%s' and fdx = (select min(fdx) from gscn.cncr_rgst where pt_no = '%s')", patient.getPtNo(), patient.getPtNo());
        List<Map<String, Object>> targetList = sqlExecutor.executeSelectAll(selectAllQuery);

        targetList.forEach(target -> {
            String getUpdatedDataQuery = String.format("select * from gscn.cncr_rgst_updated where idx = '%s'", target.get("idx"));
            if (MapUtils.isEmpty(sqlExecutor.executeSelectOne(getUpdatedDataQuery))) {
                executeFdxInsert(target, patient, login);
            } else {
                executeFdxUpdate(target, patient, login);
            }
        });
    }

    private void executeFdxInsert(Map<String, Object> target, Patient patient, String login) {
        target.put("fdx", getLocaleYYYYMMDDFromInstant(patient.getDetail().getStandardDate()));
        SQL insertQuery = new SQL().INSERT_INTO("gscn.cncr_rgst_updated");
        target.forEach((key, value) -> {
            if (value != null) {
                insertQuery.VALUES(key, String.format("'%s'", value));
            }
        });

        insertQuery.VALUES("created_by", String.format("'%s'", login)).VALUES("created_date", String.format("'%s'", Instant.now())).VALUES("last_modified_by", String.format("'%s'", login)).VALUES("last_modified_date", String.format("'%s'", Instant.now()));
        sqlExecutor.executeDML(insertQuery.toString());
    }

    private void executeFdxUpdate(Map<String, Object> target, Patient patient, String login) {
        SQL updateQuery = new SQL().UPDATE("gscn.cncr_rgst_updated").SET(getSqlEqualSyntax("fdx", getLocaleYYYYMMDDFromInstant(patient.getDetail().getStandardDate()))).SET(getSqlEqualSyntax("last_modified_by", login)).SET(getSqlEqualSyntax("last_modified_date", Instant.now())).WHERE(getSqlEqualSyntax("idx", target.get("idx")));
        sqlExecutor.executeDML(updateQuery.toString());
    }

    private String getLocaleYYYYMMDDFromInstant(Instant instant) {
        return LocalDateTime.ofInstant(instant, ZoneId.of("Asia/Seoul")).format(DateTimeFormatter.ofPattern("yyyyMMdd"));
    }
}
