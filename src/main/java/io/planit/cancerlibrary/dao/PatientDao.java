package io.planit.cancerlibrary.dao;

import io.planit.cancerlibrary.domain.Patient;
import org.apache.ibatis.jdbc.SQL;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Instant;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Component
public class PatientDao {
    private final NamedParameterJdbcTemplate jdbcTemplate;

    private static final String TARGET_TABLE = "TEST_PATIENT";

    public PatientDao(NamedParameterJdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Patient> findAll() {
        SQL sql = new SQL().SELECT("*").FROM(TARGET_TABLE);
        return jdbcTemplate.query(sql.toString(), new PatientMapper());
    }

    public List<Patient> findAllByCreatedDateBetween(Map<String, Instant> dateRange) {
        SQL sql = new SQL().SELECT("*").FROM(TARGET_TABLE).WHERE("CREATED_DATE BETWEEN :startDate AND :endDate");
        return jdbcTemplate.query(sql.toString(), dateRange, new PatientMapper());
    }

    public List<Patient> findAllByPatientNos(List<String> patientNos) {
        SQL sql = new SQL().SELECT("*").FROM(TARGET_TABLE).WHERE("PT_NO IN (:ptNos)");
        return jdbcTemplate.query(sql.toString(), Map.of("ptNos", patientNos), new PatientMapper());
    }

    public Integer insert(Patient patient) {
        SQL sql = new SQL().INSERT_INTO(TARGET_TABLE)
            .VALUES("PT_NO", ":ptNo")
            .VALUES("PT_NM", ":ptNm")
            .VALUES("SEX_TP_CD", ":sexTpCd")
            .VALUES("PT_BRDY_DT", ":ptBrdyDt")
            .VALUES("HSP_TP_CD", ":hspTpCd")
            .VALUES("IDX_DT", ":idxDt")
            .VALUES("STATUS", ":status")
            .VALUES("CREATED_BY", ":createdBy")
            .VALUES("CREATED_DATE", ":createdDate")
            .VALUES("LAST_MODIFIED_BY", ":lastModifiedBy")
            .VALUES("LAST_MODIFIED_DATE", ":lastModifiedDate")
            .VALUES("COMMENT", ":comment")
            .VALUES("DECLINE_REASON", ":declineReason");

        SqlParameterSource namedParameters = new BeanPropertySqlParameterSource(patient);
        return jdbcTemplate.update(sql.toString(), namedParameters);
    }

    public boolean existsByPatientNo(String patientNo) {
        SQL sql = new SQL().SELECT("COUNT(*)").FROM(TARGET_TABLE).WHERE("PT_NO = :ptNo");
        return jdbcTemplate.queryForObject(sql.toString(), Map.of("ptNo", patientNo), Integer.class) > 0;
    }

    public Optional<Patient> findByPatientNo(String patientNo) {
        SQL sql = new SQL().SELECT("*").FROM(TARGET_TABLE).WHERE("PT_NO = :ptNo");
        return Optional.ofNullable(jdbcTemplate.queryForObject(sql.toString(), Map.of("ptNo", patientNo), new PatientMapper()));
    }

    public Integer update(Patient patient) {

        SQL sql = new SQL().UPDATE(TARGET_TABLE);
        sql.SET("LAST_MODIFIED_BY = :lastModifiedBy")
            .SET("LAST_MODIFIED_DATE = :lastModifiedDate");

        if (patient.getStatus() != null) {
            sql.SET("STATUS = :status");
        }
        if (patient.getComment() != null) {
            sql.SET("COMMENT = :comment");
        }
        if (patient.getDeclineReason() != null) {
            sql.SET("DECLINE_REASON = :declineReason");
        }
        if (patient.getCreatedBy() != null) {
            sql.SET("CREATED_BY = :createdBy");
        }
        if (patient.getCreatedDate() != null) {
            sql.SET("CREATED_DATE = :createdDate");
        }

        sql.WHERE("PT_NO = :ptNo");

        SqlParameterSource namedParameters = new BeanPropertySqlParameterSource(patient);
        return jdbcTemplate.update(sql.toString(), namedParameters);
    }

    private static class PatientMapper implements RowMapper<Patient> {
        public Patient mapRow(ResultSet resultSet, int i) throws SQLException {
            Patient patient = new Patient();
            patient.setPtNo(resultSet.getString("pt_no"));
            patient.setPtNm(resultSet.getString("pt_nm"));
            patient.setSexTpCd(resultSet.getString("sex_tp_cd"));
            patient.setPtBrdyDt(resultSet.getString("pt_brdy_dt"));
            patient.setHspTpCd(resultSet.getString("hsp_tp_cd"));
            patient.setIdxDt(resultSet.getDate("idx_dt"));
            patient.setStatus(resultSet.getString("status"));
            patient.setCreatedBy(resultSet.getString("created_by"));
            if (resultSet.getTimestamp("created_date") != null) {
                patient.setCreatedDate(resultSet.getTimestamp("created_date").toInstant());
            }
            patient.setLastModifiedBy(resultSet.getString("last_modified_by"));
            if (resultSet.getTimestamp("last_modified_date") != null) {
                patient.setLastModifiedDate(resultSet.getTimestamp("last_modified_date").toInstant());
            }
            patient.setDeclineReason(resultSet.getString("decline_reason"));
            patient.setComment(resultSet.getString("comment"));

            return patient;
        }
    }
}
