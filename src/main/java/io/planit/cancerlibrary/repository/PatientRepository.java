package io.planit.cancerlibrary.repository;

import io.planit.cancerlibrary.domain.Patient;
import org.apache.ibatis.jdbc.SQL;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Repository
public class PatientRepository {
    private final NamedParameterJdbcTemplate jdbcTemplate;

    private static final String PATIENT_VIEW = "TEST_PATIENT";

    private static final String PATIENT_DETAIL = "PH_PATIENT_DETAIL";

    public PatientRepository(NamedParameterJdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Patient> findAll() {
        SQL sql = getFindAllPatientWithDetailSQL();
        return jdbcTemplate.query(sql.toString(), new PatientMapper());
    }

    public List<Patient> findAllByCreatedDateBetween(Map<String, Timestamp> dateRange) {
        SQL sql = getFindAllPatientWithDetailSQL().WHERE("CREATED_DATE BETWEEN :startDate AND :endDate");
        return jdbcTemplate.query(sql.toString(), dateRange, new PatientMapper());
    }

    public List<Patient> findAllByPatientNos(List<String> patientNos) {
        SQL sql = getFindAllPatientWithDetailSQL().WHERE(PATIENT_VIEW + ".PT_NO IN (:ptNos)");
        return jdbcTemplate.query(sql.toString(), Map.of("ptNos", patientNos), new PatientMapper());
    }

    private SQL getFindAllPatientWithDetailSQL() {
        return new SQL().SELECT("*").FROM(PATIENT_VIEW).LEFT_OUTER_JOIN(PATIENT_DETAIL + " ON " + PATIENT_VIEW + ".PT_NO = " + PATIENT_DETAIL + ".PT_NO");
    }

    public boolean insert(Patient patient) {
        SqlParameterSource namedParameters = new BeanPropertySqlParameterSource(patient);

        SQL sql1 = new SQL().INSERT_INTO(PATIENT_VIEW)
            .VALUES("PT_NO", ":ptNo")
            .VALUES("PT_NM", ":ptNm")
            .VALUES("SEX_TP_CD", ":sexTpCd")
            .VALUES("PT_BRDY_DT", ":ptBrdyDt")
            .VALUES("HSP_TP_CD", ":hspTpCd")
            .VALUES("IDX_DT", ":idxDt");
        return jdbcTemplate.update(sql1.toString(), namedParameters) > 0;
    }

    public boolean checkExistPatientByPatientNo(String patientNo) {
        SQL sql = new SQL().SELECT("COUNT(*)").FROM(PATIENT_VIEW).WHERE("PT_NO = :ptNo");
        return jdbcTemplate.queryForObject(sql.toString(), Map.of("ptNo", patientNo), Integer.class) > 0;
    }

    public boolean checkExistPatientDetailByPatientNo(String patientNo) {
        SQL sql = new SQL().SELECT("COUNT(*)").FROM(PATIENT_DETAIL).WHERE("PT_NO = :ptNo");
        return jdbcTemplate.queryForObject(sql.toString(), Map.of("ptNo", patientNo), Integer.class) > 0;
    }

    public Optional<Patient> findByPatientNo(String patientNo) {
        SQL sql = getFindAllPatientWithDetailSQL().WHERE(PATIENT_VIEW + ".PT_NO = :ptNo");
        return Optional.ofNullable(jdbcTemplate.queryForObject(sql.toString(), Map.of("ptNo", patientNo), new PatientMapper()));
    }

    public boolean updatePatientDetail(Patient patient) {
        SQL sql = new SQL().UPDATE(PATIENT_DETAIL);
        sql.SET("LAST_MODIFIED_BY = :lastModifiedBy")
            .SET(String.format("LAST_MODIFIED_DATE = '%s'", Timestamp.from(patient.getLastModifiedDate())));

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
            sql.SET(String.format("CREATED_DATE = '%s'", Timestamp.from(patient.getCreatedDate())));
        }

        sql.WHERE("PT_NO = :ptNo");

        SqlParameterSource namedParameters = new BeanPropertySqlParameterSource(patient);
        return jdbcTemplate.update(sql.toString(), namedParameters) > 0;
    }

    public boolean insertPatientDetail(Patient patient) {
        SQL sql = new SQL().INSERT_INTO(PATIENT_DETAIL)
            .VALUES("PT_NO", ":ptNo")
            .VALUES("STATUS", ":status")
            .VALUES("CREATED_BY", ":createdBy")
            .VALUES("LAST_MODIFIED_BY", ":lastModifiedBy")
            .VALUES("COMMENT", ":comment")
            .VALUES("DECLINE_REASON", ":declineReason");

        if (patient.getCreatedDate() != null) {
            sql.VALUES("CREATED_DATE", String.format("'%s'", Timestamp.from(patient.getCreatedDate())));
        }

        if (patient.getLastModifiedDate() != null) {
            sql.VALUES("LAST_MODIFIED_DATE", String.format("'%s'", Timestamp.from(patient.getLastModifiedDate())));
        }

        SqlParameterSource namedParameters = new BeanPropertySqlParameterSource(patient);
        return jdbcTemplate.update(sql.toString(), namedParameters) > 0;
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
