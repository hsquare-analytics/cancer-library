package io.planit.cancerlibrary.repository;

import io.planit.cancerlibrary.constant.PatientStatus;
import io.planit.cancerlibrary.constant.Table;
import io.planit.cancerlibrary.domain.embedded.PatientDetail;
import io.planit.cancerlibrary.service.dto.DateRangeDTO;
import org.apache.ibatis.jdbc.SQL;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.Map;

@Repository
public class PatientDetailRepository {
    private final NamedParameterJdbcTemplate jdbcTemplate;

    public PatientDetailRepository(NamedParameterJdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public boolean update(String ptNo, PatientDetail detail) {
        SQL sql = new SQL().UPDATE(Table.PATIENT_DETAIL.getTableName());
        sql.SET("LAST_MODIFIED_BY = :lastModifiedBy")
            .SET(String.format("LAST_MODIFIED_DATE = '%s'", Timestamp.from(detail.getLastModifiedDate())));

        if (detail.getStatus() != null) {
            sql.SET(String.format("STATUS = '%s'", detail.getStatus().name()));
        }
        if (detail.getComment() != null) {
            sql.SET("COMMENT = :comment");
        }
        if (detail.getDeclineReason() != null) {
            sql.SET("DECLINE_REASON = :declineReason");
        }

        if (detail.getStandardDate() != null) {
            sql.SET(String.format("STANDARD_DATE = '%s'", Timestamp.from(detail.getStandardDate())));
        }

        if (detail.getCreatedBy() != null) {
            sql.SET("CREATED_BY = :createdBy");
        }

        if (detail.getCreatedDate() != null) {
            sql.SET(String.format("CREATED_DATE = '%s'", Timestamp.from(detail.getCreatedDate())));
        }

        sql.WHERE(String.format("PT_NO = '%s'", ptNo));

        SqlParameterSource namedParameters = new BeanPropertySqlParameterSource(detail);
        return jdbcTemplate.update(sql.toString(), namedParameters) > 0;
    }

    public boolean insert(String ptNo, PatientDetail detail) {
        SQL sql = new SQL().INSERT_INTO(Table.PATIENT_DETAIL.getTableName())
            .VALUES("PT_NO", String.format("'%s'", ptNo))
            .VALUES("CREATED_BY", ":createdBy")
            .VALUES("LAST_MODIFIED_BY", ":lastModifiedBy")
            .VALUES("COMMENT", ":comment")
            .VALUES("DECLINE_REASON", ":declineReason");

        if (detail.getStatus() != null) {
            sql.VALUES("STATUS", String.format("'%s'", detail.getStatus().name()));
        }

        if (detail.getStandardDate() != null) {
            sql.VALUES("STANDARD_DATE", String.format("'%s'", Timestamp.from(detail.getStandardDate())));
        }

        if (detail.getCreatedDate() != null) {
            sql.VALUES("CREATED_DATE", String.format("'%s'", Timestamp.from(detail.getCreatedDate())));
        }

        if (detail.getLastModifiedDate() != null) {
            sql.VALUES("LAST_MODIFIED_DATE", String.format("'%s'", Timestamp.from(detail.getLastModifiedDate())));
        }

        SqlParameterSource namedParameters = new BeanPropertySqlParameterSource(detail);
        return jdbcTemplate.update(sql.toString(), namedParameters) > 0;
    }

    public Integer countByStatusAndDateRange(String login, PatientStatus status, DateRangeDTO dateRangeDTO) {
        SQL sql = new SQL().SELECT("COUNT(*)").FROM(Table.PATIENT_DETAIL.getTableName()).WHERE("STATUS = :status AND CREATED_BY = :login");
        if (dateRangeDTO != null && dateRangeDTO.getStartDate() != null) {
            sql.WHERE(String.format("CREATED_DATE >= '%s'", Timestamp.from(dateRangeDTO.getStartDate())));
        }
        if (dateRangeDTO != null && dateRangeDTO.getEndDate() != null) {
            sql.WHERE(String.format("CREATED_DATE <= '%s'", Timestamp.from(dateRangeDTO.getEndDate())));
        }
        return jdbcTemplate.queryForObject(sql.toString(), Map.of("status", status.name(), "login", login), Integer.class);
    }
}
