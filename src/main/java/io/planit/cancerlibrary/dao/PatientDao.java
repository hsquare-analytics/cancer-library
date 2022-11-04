package io.planit.cancerlibrary.dao;

import io.planit.cancerlibrary.domain.Patient;
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

    private static final String SQL_FIND_ALL = "SELECT * FROM TEST_PATIENT";

    private static final String SQL_FIND_ALL_BY_CREATED_DATE_BETWEEN = "SELECT * FROM TEST_PATIENT WHERE created_date BETWEEN :startDate AND :endDate";

    private static final String SQL_FIND_ALL_BY_PT_NOS = "SELECT * FROM TEST_PATIENT WHERE PT_NO IN (:ptNos)";

    private static final String SQL_FIND_ONE_BY_PT_NO = "SELECT * FROM TEST_PATIENT WHERE PT_NO = :ptNo";

    private static final String SQL_INSERT_PATIENT = "INSERT INTO TEST_PATIENT (PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, STATUS, CREATED_BY, CREATED_DATE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, COMMENT, DECLINE_REASON)" +
        " VALUES ( :ptNo, :ptNm, :sexTpCd, :ptBrdyDt, :hspTpCd, :idxDt, :status, :createdBy, :createdDate, :lastModifiedBy, :lastModifiedDate, :comment, :declineReason)";

    private static final String SQL_CHECK_PATIENT_EXISTS = "SELECT COUNT(*) FROM TEST_PATIENT WHERE PT_NO = :ptNo";

    public PatientDao(NamedParameterJdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Patient> findAll() {
        return jdbcTemplate.query(SQL_FIND_ALL, new PatientMapper());
    }

    public List<Patient> findAllByCreatedDateBetween(Map<String, Instant> dateRange) {
        return jdbcTemplate.query(SQL_FIND_ALL_BY_CREATED_DATE_BETWEEN, dateRange, new PatientMapper());
    }

    public List<Patient> findAllByPatientNos(List<String> patientNos) {
        return jdbcTemplate.query(SQL_FIND_ALL_BY_PT_NOS, Map.of("ptNos", patientNos), new PatientMapper());
    }

    public Integer insert(Patient patient) {
        SqlParameterSource namedParameters = new BeanPropertySqlParameterSource(patient);
        return jdbcTemplate.update(SQL_INSERT_PATIENT, namedParameters);
    }

    public boolean existsByPatientNo(String patientNo) {
        return jdbcTemplate.queryForObject(SQL_CHECK_PATIENT_EXISTS, Map.of("ptNo", patientNo), Integer.class) > 0;
    }

    public Optional<Patient> findByPatientNo(String patientNo) {
        return Optional.ofNullable(jdbcTemplate.queryForObject(SQL_FIND_ONE_BY_PT_NO, Map.of("ptNo", patientNo), new PatientMapper()));
    }

    public Integer update(Patient patient) {
        String sql = "UPDATE TEST_PATIENT SET LAST_MODIFIED_BY = :lastModifiedBy, LAST_MODIFIED_DATE = :lastModifiedDate";
        if (patient.getStatus() != null) {
            sql += ", STATUS = :status";
        }
        if (patient.getComment() != null) {
            sql += ", COMMENT = :comment";
        }
        if (patient.getDeclineReason() != null) {
            sql += ", DECLINE_REASON = :declineReason";
        }
        if (patient.getCreatedBy() != null) {
            sql += ", CREATED_BY = :createdBy";
        }
        if (patient.getCreatedDate() != null) {
            sql += ", CREATED_DATE = :createdDate";
        }

        sql += " WHERE PT_NO = :ptNo";

        SqlParameterSource namedParameters = new BeanPropertySqlParameterSource(patient);
        return jdbcTemplate.update(sql, namedParameters);
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
