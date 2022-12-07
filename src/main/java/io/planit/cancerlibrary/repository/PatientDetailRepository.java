package io.planit.cancerlibrary.repository;

import io.planit.cancerlibrary.constant.Table;
import io.planit.cancerlibrary.domain.embedded.PatientDetail;
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
            sql.SET("STATUS = :status");
        }
        if (detail.getComment() != null) {
            sql.SET("COMMENT = :comment");
        }
        if (detail.getDeclineReason() != null) {
            sql.SET("DECLINE_REASON = :declineReason");
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
            .VALUES("STATUS", ":status")
            .VALUES("CREATED_BY", ":createdBy")
            .VALUES("LAST_MODIFIED_BY", ":lastModifiedBy")
            .VALUES("COMMENT", ":comment")
            .VALUES("DECLINE_REASON", ":declineReason");

        if (detail.getCreatedDate() != null) {
            sql.VALUES("CREATED_DATE", String.format("'%s'", Timestamp.from(detail.getCreatedDate())));
        }

        if (detail.getLastModifiedDate() != null) {
            sql.VALUES("LAST_MODIFIED_DATE", String.format("'%s'", Timestamp.from(detail.getLastModifiedDate())));
        }

        SqlParameterSource namedParameters = new BeanPropertySqlParameterSource(detail);
        return jdbcTemplate.update(sql.toString(), namedParameters) > 0;
    }

    public Integer countByStatus(String login, String status) {
        SQL sql = new SQL().SELECT("COUNT(*)").FROM(Table.PATIENT_DETAIL.getTableName()).WHERE("STATUS = :status AND CREATED_BY = :login");
        return jdbcTemplate.queryForObject(sql.toString(), Map.of("status", status, "login", login), Integer.class);
    }
}
