package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.Authority;
import io.planit.cancerlibrary.domain.Patient;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.domain.UserPatient;
import io.planit.cancerlibrary.repository.PatientRepository;
import io.planit.cancerlibrary.repository.UserPatientRepository;
import io.planit.cancerlibrary.repository.UserRepository;
import io.planit.cancerlibrary.security.AuthoritiesConstants;
import io.planit.cancerlibrary.web.rest.UserPatientController.DivisiblePatientVM;
import io.planit.cancerlibrary.web.rest.UserPatientController.UserPatientAuthorizationsVM;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;
import org.testcontainers.shaded.org.apache.commons.lang3.RandomStringUtils;

import javax.persistence.EntityManager;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import static org.hamcrest.Matchers.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;


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
    private PatientRepository patientRepository;

    @Autowired
    private UserPatientRepository userPatientRepository;

    @Test
    @Transactional("jdbcTemplateTransactionManager")
    @WithMockUser(authorities = AuthoritiesConstants.ADMIN)
    void test_fetch_user_divisible_patient_list() throws Exception {
        // authorized user
        User user = UserResourceIT.createEntity(em);
        user.setLogin("userLogin" + RandomStringUtils.randomAlphabetic(5));
        userRepository.saveAndFlush(user);

        Patient patient = PatientResourceIT.createPatientDTO();
        patientRepository.insert(patient);

        UserPatient userPatient = new UserPatient().user(user).patientNo(patient.getPtNo());
        userPatientRepository.saveAndFlush(userPatient);

        // authorized to other
        Patient otherUserPatient = PatientResourceIT.createPatientDTO().ptNo("otherUserPatient" + RandomStringUtils.randomAlphabetic(5));
        patientRepository.insert(otherUserPatient);
        User otherUser = UserResourceIT.createEntity(em).login(RandomStringUtils.randomAlphabetic(5));
        userRepository.saveAndFlush(otherUser);
        UserPatient otherUsePatient = new UserPatient().user(otherUser).patientNo(otherUserPatient.getPtNo());
        userPatientRepository.saveAndFlush(otherUsePatient);

        // authorized to other admin
        Patient otherAdminPatient = PatientResourceIT.createPatientDTO().ptNo("otherAdminPatient" + RandomStringUtils.randomAlphabetic(5));
        patientRepository.insert(otherAdminPatient);
        User otherAdminUser = UserResourceIT.createEntity(em).login(RandomStringUtils.randomAlphabetic(5)).authorities(Set.of(new Authority().name(AuthoritiesConstants.ADMIN)));
        userRepository.saveAndFlush(otherAdminUser);
        UserPatient otherAdminUserPatient = new UserPatient().user(otherAdminUser).patientNo(otherAdminPatient.getPtNo());
        userPatientRepository.saveAndFlush(otherAdminUserPatient);

        restDatasourcePatientMockMvc.perform(get("/api/user-patients/divisible-patient-list").param("login", user.getLogin()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].ptNo").value(hasItem(patient.getPtNo())))
            .andExpect(jsonPath("$.[*].ptNm").value(hasItem(patient.getPtNm())))
            .andExpect(jsonPath("$.[*].authorized").value(hasItem(true)))
            .andExpect(jsonPath("$.[*].ptNo").value(not(hasItem(otherUserPatient.getPtNo()))))
            .andExpect(jsonPath("$.[*].ptNo").value(hasItem(otherAdminPatient.getPtNo())))
        ;
    }

    @Test
    @Transactional("jdbcTemplateTransactionManager")
    @WithMockUser(authorities = AuthoritiesConstants.ADMIN)
    void test_fetch_admin_divisible_patient_list() throws Exception {
        User adminUser = UserResourceIT.createEntity(em).login("adminLogin" + RandomStringUtils.randomAlphabetic(5)).authorities(new HashSet<>(Set.of(new Authority().name(AuthoritiesConstants.ADMIN))));
        userRepository.saveAndFlush(adminUser);

        // other user patient
        Patient patient = PatientResourceIT.createPatientDTO().ptNo("ptNo" + RandomStringUtils.randomAlphabetic(5));
        patientRepository.insert(patient);
        User otherUser = UserResourceIT.createEntity(em).login("userpatient" + RandomStringUtils.randomAlphabetic(5));
        userRepository.saveAndFlush(otherUser);
        UserPatient otherUserPatient = new UserPatient().user(otherUser).patientNo(patient.getPtNo());
        userPatientRepository.saveAndFlush(otherUserPatient);

        restDatasourcePatientMockMvc.perform(get("/api/user-patients/divisible-patient-list").param("login", adminUser.getLogin()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].ptNo").value(hasItem(patient.getPtNo())))
            .andExpect(jsonPath("$.[*].ptNm").value(hasItem(patient.getPtNm())))
            .andExpect(jsonPath("$.[*].authorized").value(hasItem(false)));
    }

    @Test
    @Transactional("jdbcTemplateTransactionManager")
    @WithMockUser(authorities = AuthoritiesConstants.ADMIN)
    void test_create_multiple_user_patient_authorizations() throws Exception {
        // given
        User user = UserResourceIT.createEntity(em);
        userRepository.saveAndFlush(user);

        List<DivisiblePatientVM> patientList = new ArrayList<>();

        List<String> patientNos = List.of("1", "2", "3");
        patientNos.forEach(patientNo -> {
            Patient patient = PatientResourceIT.createPatientDTO().ptNo(patientNo);
            patient.setPtNo(patientNo);
            patientRepository.insert(patient);
            patientList.add(new DivisiblePatientVM(patient, true));
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
}
