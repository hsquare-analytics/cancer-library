package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.Patient;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.domain.UserPatient;
import io.planit.cancerlibrary.repository.PatientRepository;
import io.planit.cancerlibrary.repository.UserPatientRepository;
import io.planit.cancerlibrary.repository.UserRepository;
import io.planit.cancerlibrary.security.AuthoritiesConstants;
import io.planit.cancerlibrary.service.TimeService;
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
import java.time.Instant;
import java.time.temporal.ChronoUnit;

import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
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
    private UserPatientRepository userPatientRepository;

    @MockBean
    private TimeService timeService;

    @Test
    @Transactional
    @WithMockUser(username = "accessibleUser")
    void testFetchAccessiblePatientList() throws Exception {

        User user = UserResourceIT.createEntity(em);
        user.setLogin("accessibleUser");
        userRepository.saveAndFlush(user);

        Patient patient = PatientResourceIT.createPatientDTO();
        patientRepository.insert(patient);

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
            .andExpect(jsonPath("$.[*].status").value(hasItem(patient.getStatus())));
    }

    @Test
    @Transactional
    @WithMockUser(username = "supervisor", authorities = AuthoritiesConstants.SUPERVISOR)
    void testFetchAccessiblePatientListWithReviewer() throws Exception {
        // given
        BDDMockito.given(timeService.getCurrentTime()).willReturn(Instant.parse("2020-01-01T00:00:00Z"));
        Patient patient = PatientResourceIT.createPatientDTO().createdDate(timeService.getCurrentTime().minus(1, ChronoUnit.DAYS));
        patientRepository.insert(patient);

        // when, them
        restDatasourcePatientMockMvc.perform(get("/api/patients/accessible-patient-list")
                .param("startDate", timeService.getCurrentTime().minus(365, ChronoUnit.DAYS).toString())
                .param("endDate", timeService.getCurrentTime().toString()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].ptNo").value(hasItem(patient.getPtNo())))
            .andExpect(jsonPath("$.[*].ptNm").value(hasItem(patient.getPtNm())))
            .andExpect(jsonPath("$.[*].sexTpCd").value(hasItem(patient.getSexTpCd())))
            .andExpect(jsonPath("$.[*].ptBrdyDt").value(hasItem(patient.getPtBrdyDt())))
            .andExpect(jsonPath("$.[*].hspTpCd").value(hasItem(patient.getHspTpCd())))
            .andExpect(jsonPath("$.[*].status").value(hasItem(patient.getStatus())));
    }
}
