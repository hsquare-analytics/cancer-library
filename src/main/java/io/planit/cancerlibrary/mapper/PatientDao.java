package io.planit.cancerlibrary.mapper;

import io.planit.cancerlibrary.domain.Patient;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class PatientDao {
    private final JdbcTemplate jdbcTemplate;

    private final String SQL_FIND_ALL = "SELECT * FROM TEST_PATIENT";

    private final String SQL_FIND_ALL_BY_CREATED_DATE_BETWEEN = "SELECT * FROM TEST_PATIENT WHERE created_date BETWEEN ? AND ?";

    private final String SQL_FIND_ALL_BY_PT_NOS = "SELECT * FROM TEST_PATIENT WHERE PT_NO IN (?)";

    private final String SQL_FIND_ONE_BY_PT_NO = "SELECT * FROM TEST_PATIENT WHERE PT_NO = ?";

    private final String SQL_INSERT_PATIENT = "INSERT INTO TEST_PATIENT (PT_NO, PT_NM, SEX_TP_CD, PT_BRDY_DT, HSP_TP_CD, IDX_DT, STATUS, CREATED_BY, CREATED_DATE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, COMMENT, DECLINE_REASON)" +
        " VALUES (:ptNo, :ptNm, :sexTpCd, :ptBrdyDt, :hspTpCd, :idxDt, :status, :createdBy, :createdDate, :lastModifiedBy, :lastModifiedDate, :comment, :declineReason);";

    private final String SQL_CHECK_PATIENT_EXISTS = "SELECT COUNT(*) FROM TEST_PATIENT WHERE PT_NO = ?";

    public PatientDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Patient> findAll() {
        return jdbcTemplate.query(SQL_FIND_ALL, new PersonMapper());
    }

    public List<Patient> findAllByCreatedDateBetween(String startDate, String endDate) {
        return jdbcTemplate.query(SQL_FIND_ALL_BY_CREATED_DATE_BETWEEN, new PersonMapper(), new Object[]{startDate, endDate});
    }

    public List<Patient> findAllByPatientNos(List<String> patientNos) {
        return jdbcTemplate.query(SQL_FIND_ALL_BY_PT_NOS, new PersonMapper(), new Object[]{patientNos});
    }

    public Integer insert(Patient patient) {
        return jdbcTemplate.update(SQL_INSERT_PATIENT, patient);
    }

    public boolean existsByPatientNo(String patientNo) {
        return jdbcTemplate.queryForObject(SQL_CHECK_PATIENT_EXISTS, Integer.class, new Object[]{patientNo}) > 0;
    }

    public Optional<Patient> findByPatientNo(String patientNo) {
        return Optional.ofNullable(jdbcTemplate.queryForObject(SQL_FIND_ONE_BY_PT_NO, new PersonMapper(), new Object[]{patientNo}));
    }

    public Integer update(Patient patient) {
        String SQL_UPDATE_PATIENT = "UPDATE TEST_PATIENT SET LAST_MODIFIED_BY = :lastModifiedBy, LAST_MODIFIED_DATE = :lastModifiedDate";
        if (patient.getStatus() != null) {
            SQL_UPDATE_PATIENT += ", STATUS = :status";
        }
        if (patient.getComment() != null) {
            SQL_UPDATE_PATIENT += ", COMMENT = :comment";
        }
        if (patient.getDeclineReason() != null) {
            SQL_UPDATE_PATIENT += ", DECLINE_REASON = :declineReason";
        }
        if (patient.getCreatedBy() != null) {
            SQL_UPDATE_PATIENT += ", CREATED_BY = :createdBy";
        }
        if (patient.getCreatedDate() != null) {
            SQL_UPDATE_PATIENT += ", CREATED_DATE = :createdDate";
        }

        SQL_UPDATE_PATIENT += " WHERE PT_NO = :ptNo";

        return jdbcTemplate.update(SQL_UPDATE_PATIENT, patient);
    }


}
