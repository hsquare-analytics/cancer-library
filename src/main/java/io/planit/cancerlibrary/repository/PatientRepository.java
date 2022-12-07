package io.planit.cancerlibrary.repository;

import io.planit.cancerlibrary.constant.Table;
import io.planit.cancerlibrary.domain.Patient;
import io.planit.cancerlibrary.domain.embedded.PatientDetail;
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

    private static final String PT_NO_EQUAL = "PT_NO = :ptNo";

    public PatientRepository(NamedParameterJdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    public List<Patient> findAll() {
        SQL sql = getFindAllPatientWithDetailSQL();
        return jdbcTemplate.query(sql.toString(), new PatientMapper());
    }

    public List<Patient> findAllByPtNoNotIn(List<String> ptNos) {
        SQL sql = getFindAllPatientWithDetailSQL();
        sql.WHERE(Table.PATIENT_VIEW.getTableName() + ".PT_NO NOT IN (:ptNos)");
        return jdbcTemplate.query(sql.toString(), Map.of("ptNos", ptNos), new PatientMapper());
    }

    public List<Patient> findAllByPtNoNotInAndCreatedDateBetween(List<String> ptNos, Map<String, Timestamp> dateRange) {
        SQL sql = getFindAllPatientWithDetailSQL().WHERE("CREATED_DATE BETWEEN :startDate AND :endDate");
        if (ptNos.isEmpty()) {
            sql.WHERE(Table.PATIENT_VIEW.getTableName() + ".PT_NO NOT IN (:ptNos)");
        }
        Map<String, ?> params = Map.of("ptNos", ptNos, "startDate", dateRange.get("startDate"), "endDate", dateRange.get("endDate"));
        return jdbcTemplate.query(sql.toString(), params, new PatientMapper());
    }

    public List<Patient> findAllByPatientNos(List<String> patientNos) {
        SQL sql = getFindAllPatientWithDetailSQL().WHERE(Table.PATIENT_VIEW.getTableName() + ".PT_NO IN (:ptNos)");
        return jdbcTemplate.query(sql.toString(), Map.of("ptNos", patientNos), new PatientMapper());
    }

    private SQL getFindAllPatientWithDetailSQL() {
        return new SQL().SELECT("*").FROM(Table.PATIENT_VIEW.getTableName()).LEFT_OUTER_JOIN(Table.PATIENT_DETAIL.getTableName() + " ON " + Table.PATIENT_VIEW.getTableName() + ".PT_NO = " + Table.PATIENT_DETAIL.getTableName() + ".PT_NO");
    }

    public boolean insert(Patient patient) {
        SqlParameterSource namedParameters = new BeanPropertySqlParameterSource(patient);

        SQL sql1 = new SQL().INSERT_INTO(Table.PATIENT_VIEW.getTableName())
            .VALUES("PT_NO", ":ptNo")
            .VALUES("PT_NM", ":ptNm")
            .VALUES("SEX_TP_CD", ":sexTpCd")
            .VALUES("PT_BRDY_DT", ":ptBrdyDt")
            .VALUES("HSP_TP_CD", ":hspTpCd")
            .VALUES("IDX_DT", ":idxDt");
        return jdbcTemplate.update(sql1.toString(), namedParameters) > 0;
    }

    public boolean checkRowExistByPtNoOnTable(Table table, String patientNo) {
        SQL sql = new SQL().SELECT("COUNT(*)").FROM(table.getTableName()).WHERE(PT_NO_EQUAL);
        return jdbcTemplate.queryForObject(sql.toString(), Map.of("ptNo", patientNo), Integer.class) > 0;
    }

    public Optional<Patient> findByPatientNo(String patientNo) {
        SQL sql = getFindAllPatientWithDetailSQL().WHERE(Table.PATIENT_VIEW.getTableName() + ".PT_NO = :ptNo");
        return Optional.ofNullable(jdbcTemplate.queryForObject(sql.toString(), Map.of("ptNo", patientNo), new PatientMapper()));
    }

    private static class PatientMapper implements RowMapper<Patient> {
        public Patient mapRow(ResultSet resultSet, int i) throws SQLException {
            Patient patient = new Patient();
            patient.setPtNo(resultSet.getString("pt_no"));
            patient.setPtNm(resultSet.getString("pt_nm"));
            patient.setSexTpCd(resultSet.getString("sex_tp_cd"));
            patient.setPtBrdyDt(resultSet.getString("pt_brdy_dt"));
            patient.setHspTpCd(resultSet.getString("hsp_tp_cd"));
            patient.setGid(resultSet.getString("gid"));
            patient.setFsrMedDt(resultSet.getTimestamp("fsr_med_dt"));
            patient.setCrtnDt(resultSet.getTimestamp("crtn_dt"));
            patient.setIdxDt(resultSet.getTimestamp("idx_dt"));

            PatientDetail detail = new PatientDetail();
            detail.setDeclineReason(resultSet.getString("decline_reason"));
            detail.setComment(resultSet.getString("comment"));
            detail.setStatus(resultSet.getString("status"));
            detail.setCreatedBy(resultSet.getString("created_by"));
            if (resultSet.getTimestamp("created_date") != null) {
                detail.setCreatedDate(resultSet.getTimestamp("created_date").toInstant());
            }
            detail.setLastModifiedBy(resultSet.getString("last_modified_by"));
            if (resultSet.getTimestamp("last_modified_date") != null) {
                detail.setLastModifiedDate(resultSet.getTimestamp("last_modified_date").toInstant());
            }

            patient.detail(detail);

            return patient;
        }
    }
}
