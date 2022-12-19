package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.Patient;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.domain.UserPatient;
import io.planit.cancerlibrary.domain.embedded.PatientDetail;
import io.planit.cancerlibrary.repository.PatientDetailRepository;
import io.planit.cancerlibrary.repository.PatientRepository;
import io.planit.cancerlibrary.repository.UserPatientRepository;
import io.planit.cancerlibrary.repository.UserRepository;
import io.planit.cancerlibrary.security.AuthoritiesConstants;
import io.planit.cancerlibrary.service.TimeService;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.mockito.BDDMockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.sql.Timestamp;
import java.time.Instant;
import java.time.temporal.ChronoUnit;

import static org.assertj.core.api.Assertions.*;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@IntegrationTest
@AutoConfigureMockMvc
@WithMockUser
class PatientControllerIT {

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restDatasourcePatientMockMvc;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PatientRepository patientRepository;

    @Autowired
    private PatientDetailRepository patientDetailRepository;

    @Autowired
    private UserPatientRepository userPatientRepository;

    @MockBean
    private TimeService timeService;

    @Test
    @Transactional(value = "jdbcTemplateTransactionManager")
    @WithMockUser(username = "accessibleUser")
    void test_fetch_accessible_patient_list_reviewer() throws Exception {

        User user = UserResourceIT.createEntity(em);
        user.setLogin("accessibleUser");
        userRepository.saveAndFlush(user);

        Patient patient = PatientResourceIT.createPatientDTO();
        patientRepository.insert(patient);
        patientDetailRepository.insert(patient.getPtNo(), patient.getDetail());

        UserPatient userPatient = new UserPatient().user(user).patientNo(patient.getPtNo());
        userPatientRepository.saveAndFlush(userPatient);

        restDatasourcePatientMockMvc.perform(get("/api/patients/accessible-patient-list"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].ptNo").value(hasItem(patient.getPtNo())))
            .andExpect(jsonPath("$.[*].ptNm").value(hasItem(patient.getPtNm())))
            .andExpect(jsonPath("$.[*].sexTpCd").value(hasItem(patient.getSexTpCd())))
            .andExpect(jsonPath("$.[*].ptBrdyDt").value(hasItem(patient.getPtBrdyDt())))
            .andExpect(jsonPath("$.[*].hspTpCd").value(hasItem(patient.getHspTpCd())))
            .andExpect(jsonPath("$.[*].detail.status").value(hasItem(patient.getDetail().getStatus())));
    }

    @Test
    @Transactional(value = "jdbcTemplateTransactionManager")
    @WithMockUser(username = "supervisorTest", authorities = AuthoritiesConstants.SUPERVISOR)
    void test_fetch_accessible_patient_list_supervisor() throws Exception {
        // given
        // patient1 - authorized user
        User user = UserResourceIT.createEntity(em);
        user.setLogin("supervisorTest");
        userRepository.saveAndFlush(user);

        Patient authorizedPatient = PatientResourceIT.createPatientDTO().ptNo("authorizedPatient");
        patientRepository.insert(authorizedPatient);
        patientDetailRepository.insert(authorizedPatient.getPtNo(), authorizedPatient.getDetail());

        UserPatient userPatient = new UserPatient().user(user).patientNo(authorizedPatient.getPtNo());
        userPatientRepository.saveAndFlush(userPatient);

        // patient2 - not authorized but in submitted user
        BDDMockito.given(timeService.getCurrentTime()).willReturn(Instant.parse("2020-01-01T00:00:00Z"));
        Patient submittedPatient = PatientResourceIT.createPatientDTO().ptNo("submittedPatient").detail(new PatientDetail().createdDate(timeService.getCurrentTime().minus(1, ChronoUnit.DAYS)));
        patientRepository.insert(submittedPatient);
        patientDetailRepository.insert(submittedPatient.getPtNo(), submittedPatient.getDetail());

        // when, them
        restDatasourcePatientMockMvc.perform(get("/api/patients/accessible-patient-list")
                .param("startDate", timeService.getCurrentTime().minus(365, ChronoUnit.DAYS).toString())
                .param("endDate", timeService.getCurrentTime().toString()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].ptNo").value(hasItem(authorizedPatient.getPtNo())))
            .andExpect(jsonPath("$.[*].ptNm").value(hasItem(authorizedPatient.getPtNm())))
            .andExpect(jsonPath("$.[*].sexTpCd").value(hasItem(authorizedPatient.getSexTpCd())))
            .andExpect(jsonPath("$.[*].ptBrdyDt").value(hasItem(authorizedPatient.getPtBrdyDt())))
            .andExpect(jsonPath("$.[*].hspTpCd").value(hasItem(authorizedPatient.getHspTpCd())))
            .andExpect(jsonPath("$.[*].detail.status").value(hasItem(authorizedPatient.getDetail().getStatus())))
            .andExpect(jsonPath("$.[*].ptNo").value(hasItem(submittedPatient.getPtNo())))
            .andExpect(jsonPath("$.[*].ptNm").value(hasItem(submittedPatient.getPtNm())))
            .andExpect(jsonPath("$.[*].sexTpCd").value(hasItem(submittedPatient.getSexTpCd())))
            .andExpect(jsonPath("$.[*].ptBrdyDt").value(hasItem(submittedPatient.getPtBrdyDt())))
            .andExpect(jsonPath("$.[*].hspTpCd").value(hasItem(submittedPatient.getHspTpCd())))
            .andExpect(jsonPath("$.[*].detail.status").value(hasItem(submittedPatient.getDetail().getStatus())))
        ;
    }

    @Test
    @Transactional(value = "jdbcTemplateTransactionManager")
    void test_update_first_medical_visit_info() throws Exception {
        Patient patient = PatientResourceIT.createPatientDTO();
        patientRepository.insert(patient);
        patientDetailRepository.insert(patient.getPtNo(), patient.getDetail());

        Instant now = Instant.now();

        Patient updatedPatient = PatientResourceIT.createPatientDTO().ptNo(patient.getPtNo()).fsrMedDt(new Timestamp(now.toEpochMilli()));
        restDatasourcePatientMockMvc.perform(patch("/api/patients/{ptNo}/update-first-visit-date", patient.getPtNo())
                .contentType(MediaType.APPLICATION_JSON)
                .content(TestUtil.convertObjectToJsonBytes(updatedPatient)))
            .andExpect(status().isOk());

        Timestamp result = patientRepository.findByPatientNo(patient.getPtNo()).map(Patient::getFsrMedDt).orElse(null);
        assertThat(result).isEqualTo(new Timestamp(now.toEpochMilli()));
    }
}
