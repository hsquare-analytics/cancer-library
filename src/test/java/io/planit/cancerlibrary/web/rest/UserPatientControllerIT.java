package io.planit.cancerlibrary.web.rest;

import static org.hamcrest.Matchers.hasItem;
import static org.hamcrest.Matchers.hasItems;
import static org.hamcrest.Matchers.not;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.domain.UserPatient;
import io.planit.cancerlibrary.mapper.PatientMapper;
import io.planit.cancerlibrary.repository.UserPatientRepository;
import io.planit.cancerlibrary.repository.UserRepository;
import io.planit.cancerlibrary.security.AuthoritiesConstants;
import io.planit.cancerlibrary.service.dto.PatientDTO;
import io.planit.cancerlibrary.web.rest.UserPatientController.DivisiblePatientVM;
import io.planit.cancerlibrary.web.rest.UserPatientController.UserPatientAuthorizationsVM;
import java.util.ArrayList;
import java.util.List;
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
class UserPatientControllerIT {

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
    @WithMockUser(authorities = AuthoritiesConstants.ADMIN)
    void testWithDivisiblePatientInfo() throws Exception {
        User user = UserResourceIT.createEntity(em);
        user.setLogin("test");
        userRepository.saveAndFlush(user);

        PatientDTO patientDTO = PatientResourceIT.createPatientDTO();
        patientMapper.insert(patientDTO);

        UserPatient userPatient = new UserPatient().user(user).patientNo(patientDTO.getPtNo());
        userPatientRepository.saveAndFlush(userPatient);

        restDatasourcePatientMockMvc.perform(get("/api/user-patients/divisible-patient-list").param("login", "test"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].ptNo").value(hasItem(patientDTO.getPtNo())))
            .andExpect(jsonPath("$.[*].ptNm").value(hasItem(patientDTO.getPtNm())))
            .andExpect(jsonPath("$.[*].authorized").value(hasItem(true)));
    }

    @Test
    @Transactional
    @WithMockUser(authorities = AuthoritiesConstants.ADMIN)
    void testWithIndiscerptiblePatient() throws Exception {
        PatientDTO patientDTO = PatientResourceIT.createPatientDTO();
        patientMapper.insert(patientDTO);

        restDatasourcePatientMockMvc.perform(get("/api/user-patients/divisible-patient-list").param("login", "test"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].ptNo").value(hasItem(patientDTO.getPtNo())))
            .andExpect(jsonPath("$.[*].ptNm").value(hasItem(patientDTO.getPtNm())))
            .andExpect(jsonPath("$.[*].authorized").value(not(hasItem(true))));

    }

    @Test
    @Transactional
    @WithMockUser(authorities = AuthoritiesConstants.ADMIN)
    void testCreateMultipleUserPatientAuthorizations() throws Exception {
        // given
        User user = UserResourceIT.createEntity(em);
        userRepository.saveAndFlush(user);

        List<DivisiblePatientVM> patientList = new ArrayList<>();

        List<String> patientNos = List.of("1", "2", "3");
        patientNos.forEach(patientNo -> {
            PatientDTO patientDTO = PatientResourceIT.createPatientDTO().ptNo(patientNo);
            patientDTO.setPtNo(patientNo);
            patientMapper.insert(patientDTO);
            patientList.add(new DivisiblePatientVM(patientDTO, true));
        });

        // when, then
        UserPatientAuthorizationsVM userPatientAuthorizationsVM = new UserPatientAuthorizationsVM(user.getLogin(), patientList);

        restDatasourcePatientMockMvc.perform(
                post("/api/user-patients/user-patient-authorizations").contentType(MediaType.APPLICATION_JSON).content(
                    TestUtil.convertObjectToJsonBytes(userPatientAuthorizationsVM)))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].ptNo").value(hasItems("1", "2", "3")))
            .andExpect(jsonPath("$.[*].authorized").value(hasItem(true)))
        ;
    }

    private class TestVM {

        String login;
        List<String> patientNos;

        public TestVM(String login, List<String> patientNos) {
            this.login = login;
            this.patientNos = patientNos;
        }
    }
}
