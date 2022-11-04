package io.planit.cancerlibrary.mapper;

import io.planit.cancerlibrary.domain.Patient;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class PersonMapper implements RowMapper<Patient> {

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
