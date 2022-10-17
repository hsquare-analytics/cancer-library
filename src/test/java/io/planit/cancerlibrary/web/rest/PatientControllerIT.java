package io.planit.cancerlibrary.web.rest;

import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.Patient;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.domain.UserPatient;
import io.planit.cancerlibrary.mapper.PatientMapper;
import io.planit.cancerlibrary.repository.UserPatientRepository;
import io.planit.cancerlibrary.repository.UserRepository;
import io.planit.cancerlibrary.security.AuthoritiesConstants;
import javax.persistence.EntityManager;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

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
    private PatientMapper patientMapper;

    @Autowired
    private UserPatientRepository userPatientRepository;

    @Test
    @Transactional
    @WithMockUser(username = "accessibleUser")
    void testFetchAccessiblePatientList() throws Exception {

        User user = UserResourceIT.createEntity(em);
        user.setLogin("accessibleUser");
        userRepository.saveAndFlush(user);

        Patient patient = PatientResourceIT.createPatientDTO();
        patientMapper.insert(patient);

        UserPatient userPatient = new UserPatient().user(user).patientNo(patient.getPtNo());
        userPatientRepository.saveAndFlush(userPatient);

        restDatasourcePatientMockMvc.perform(get("/api/user-patient/accessible-patient-list"))
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
        Patient patient = PatientResourceIT.createPatientDTO();
        patientMapper.insert(patient);


        restDatasourcePatientMockMvc.perform(get("/api/user-patient/accessible-patient-list"))
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
