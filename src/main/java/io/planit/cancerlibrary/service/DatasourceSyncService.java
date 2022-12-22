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
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Service
public class DatasourceSyncService {

    private final Logger log = LoggerFactory.getLogger(DatasourceSyncService.class);
    private final SqlExecutor sqlExecutor;

    public DatasourceSyncService(SqlExecutor sqlExecutor) {
        this.sqlExecutor = sqlExecutor;
    }

    public void syncPatientFdx(Patient patient) {
        log.debug("Request to sync patient fdx : {}", patient);
        String selectAllQuery = String.format("select * from gscn.cncr_rgst where pt_no = '%s'", patient.getPtNo());
        List<Map<String, Object>> targetList = sqlExecutor.executeSelectAll(selectAllQuery);

        targetList.forEach(target -> {
            target.put("fdx", getLocaleYYYYMMDDFromInstant(patient.getDetail().getStandardDate()));
            String getUpdatedDataQuery = String.format("select * from gscn.cncr_rgst_updated where idx = '%s'", target.get("idx"));
            if (MapUtils.isEmpty(sqlExecutor.executeSelectOne(getUpdatedDataQuery))) {
                SQL insertQuery = new SQL().INSERT_INTO("gscn.cncr_rgst_updated");
                target.forEach((key, value) -> {
                    if (value != null) {
                        insertQuery.VALUES(key, String.format("'%s'", value));
                    }
                });
                sqlExecutor.executeDML(insertQuery.toString());
            } else {
                String updateQuery = String.format("update gscn.cncr_rgst_updated set fdx = '%s' where idx = '%s'", target.get("fdx"), target.get("idx"));
                sqlExecutor.executeDML(updateQuery);
            }
        });
    }

    public void syncOnlyUpdatedExistPatientFdx(Patient patient) {
        String selectAllQuery = String.format("select * from gscn.cncr_rgst_updated cru where pt_no = '%s' and pt_no not in (select pt_no from gscn.cncr_rgst cr where cr.pt_no = '%s')", patient.getPtNo(), patient.getPtNo());
        List<Map<String, Object>> targetList = sqlExecutor.executeSelectAll(selectAllQuery);

        targetList.forEach(target -> {
            String updateQuery = String.format("update gscn.cncr_rgst_updated set fdx = '%s' where idx = '%s'", getLocaleYYYYMMDDFromInstant(patient.getDetail().getStandardDate()), target.get("idx"));
            sqlExecutor.executeDML(updateQuery);
        });
    }

    private String getLocaleYYYYMMDDFromInstant(Instant instant) {
        return LocalDateTime.ofInstant(instant, ZoneId.of("Asia/Seoul")).format(DateTimeFormatter.ofPattern("yyyyMMdd"));
    }
}