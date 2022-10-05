package io.planit.cancerlibrary.web.rest;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.hamcrest.Matchers.hasItem;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.domain.UserPatient;
import io.planit.cancerlibrary.mapper.PatientMapper;
import io.planit.cancerlibrary.repository.UserPatientRepository;
import io.planit.cancerlibrary.repository.UserRepository;
import io.planit.cancerlibrary.service.dto.PatientDTO;
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
class DatasourcePatientControllerIT {

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

        PatientDTO patientDTO = PatientResourceIT.createEntityDTO();
        patientMapper.insert(patientDTO);

        UserPatient userPatient = new UserPatient().user(user).patientNo(patientDTO.getPtNo());
        userPatientRepository.saveAndFlush(userPatient);

        restDatasourcePatientMockMvc.perform(get("/api/datasource-patient/accessible-patient-list"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].pactId").value(hasItem(patientDTO.getPactId())))
            .andExpect(jsonPath("$.[*].ptNo").value(hasItem(patientDTO.getPtNo())))
            .andExpect(jsonPath("$.[*].ptNm").value(hasItem(patientDTO.getPtNm())))
            .andExpect(jsonPath("$.[*].sexTpCd").value(hasItem(patientDTO.getSexTpCd())))
            .andExpect(jsonPath("$.[*].ptBrdyDt").value(hasItem(patientDTO.getPtBrdyDt())))
            .andExpect(jsonPath("$.[*].hspTpCd").value(hasItem(patientDTO.getHspTpCd())))
            .andExpect(jsonPath("$.[*].status").value(hasItem(patientDTO.getStatus())));
    }
}
