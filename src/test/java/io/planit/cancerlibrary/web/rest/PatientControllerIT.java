package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.constant.PatientConstants;
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
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.mockito.BDDMockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;

import static org.assertj.core.api.Assertions.assertThat;
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

        Instant now = Instant.parse("2020-01-01T00:00:00Z");

        Patient updatedPatient = PatientResourceIT.createPatientDTO().ptNo(patient.getPtNo()).detail(patient.getDetail().standardDate(now));
        restDatasourcePatientMockMvc.perform(patch("/api/patients/{ptNo}/first-visit-date", patient.getPtNo())
                .contentType(MediaType.APPLICATION_JSON)
                .content(TestUtil.convertObjectToJsonBytes(updatedPatient)))
            .andExpect(status().isOk());

        Instant result = patientRepository.findByPatientNo(patient.getPtNo()).map(Patient::getDetail).map(PatientDetail::getStandardDate).orElse(null);
        assertThat(result).isEqualTo(now);
    }

    @ParameterizedTest
    @Transactional(value = "jdbcTemplateTransactionManager")
    @WithMockUser
    @ValueSource(strings = {PatientConstants.DECLINED, PatientConstants.APPROVED})
    void test_bulk_update_patient_status_detail(String status) throws Exception {
        Patient patient1 = PatientResourceIT.createPatientDTO().ptNo("patient1");
        patientRepository.insert(patient1);
        patientDetailRepository.insert(patient1.getPtNo(), patient1.getDetail().status(PatientConstants.SUBMITTED));

        Patient patient2 = PatientResourceIT.createPatientDTO().ptNo("patient2");
        patientRepository.insert(patient2);
        patientDetailRepository.insert(patient2.getPtNo(), patient2.getDetail().status(PatientConstants.SUBMITTED));

        restDatasourcePatientMockMvc.perform(post("/api/patients/update-bulk-status/{status}", status)
                .contentType(MediaType.APPLICATION_JSON)
                .content(TestUtil.convertObjectToJsonBytes(Arrays.asList(patient1.getPtNo(), patient2.getPtNo()))))
            .andExpect(status().isOk());

        Patient result1 = patientRepository.findByPatientNo(patient1.getPtNo()).get();
        assertThat(result1.getDetail().getStatus()).isEqualTo(status);

        Patient result2 = patientRepository.findByPatientNo(patient2.getPtNo()).get();
        assertThat(result2.getDetail().getStatus()).isEqualTo(status);
    }

    @Test
    @Transactional(value = "jdbcTemplateTransactionManager")
    void test_get_total_number_of_all_patient() throws Exception {
        Patient patient1 = PatientResourceIT.createPatientDTO().ptNo("patient1");
        patientRepository.insert(patient1);

        Patient patient2 = PatientResourceIT.createPatientDTO().ptNo("patient2");
        patientRepository.insert(patient2);

        restDatasourcePatientMockMvc.perform(get("/api/patients/total-patient-count"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$").value(2));
    }
}
