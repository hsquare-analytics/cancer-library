package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.constant.PatientStatus;
import io.planit.cancerlibrary.domain.Authority;
import io.planit.cancerlibrary.domain.Patient;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.domain.UserPatient;
import io.planit.cancerlibrary.domain.embedded.PatientDetail;
import io.planit.cancerlibrary.repository.PatientDetailRepository;
import io.planit.cancerlibrary.repository.PatientRepository;
import io.planit.cancerlibrary.repository.UserPatientRepository;
import io.planit.cancerlibrary.repository.UserRepository;
import io.planit.cancerlibrary.security.AuthoritiesConstants;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.EnumSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;

import static org.hamcrest.Matchers.hasItem;
import static org.hamcrest.Matchers.not;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@IntegrationTest
@AutoConfigureMockMvc
@WithMockUser
class UserControllerIT {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserPatientRepository userPatientRepository;

    @Autowired
    private PatientRepository patientRepository;

    @Autowired
    private PatientDetailRepository patientDetailRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restUserMockMvc;

    @Test
    @Transactional
    void test_fetch_users_with_additional_field() throws Exception {
        User user = UserResourceIT.createEntity(em);
        userRepository.saveAndFlush(user);

        restUserMockMvc
            .perform(get("/api/users/normal-authorization-list"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].login").value(hasItem(user.getLogin())))
            .andExpect(jsonPath("$.[*].assigned").value(hasItem(0)))
            .andExpect(jsonPath("$.[*].submitted").value(hasItem(0)))
            .andExpect(jsonPath("$.[*].approved").value(hasItem(0)))
            .andExpect(jsonPath("$.[*].declined").value(hasItem(0)));
    }

    @Test
    @Transactional
    @WithMockUser(username = "testLogin", authorities = AuthoritiesConstants.ADMIN)
    void test_fetch_users_authorization_info_by_date_param() throws Exception {
        User user = UserResourceIT.createEntity(em);
        userRepository.saveAndFlush(user);

        UserPatient userPatient = new UserPatient().user(user).patientNo("ptno" + new Random().nextInt(100));
        userPatientRepository.saveAndFlush(userPatient);

        Instant startDate = user.getLastModifiedDate().minus(1, ChronoUnit.DAYS);
        Instant endDate = user.getLastModifiedDate().plus(1, ChronoUnit.DAYS);

        Patient patient1 = new Patient().ptNo("ptno" + new Random().nextInt(100)).detail(new PatientDetail().status(PatientStatus.REVIEW_SUBMITTED).createdBy(user.getLogin()));
        patientRepository.insert(patient1);
        patientDetailRepository.insert(patient1.getPtNo(), patient1.getDetail().createdDate(user.getLastModifiedDate()));

        Patient patient2 = new Patient().ptNo("ptno" + new Random().nextInt(100)).detail(new PatientDetail().status(PatientStatus.REVIEW_APPROVED).createdBy(user.getLogin()));
        patientRepository.insert(patient2);
        patientDetailRepository.insert(patient2.getPtNo(), patient2.getDetail().createdDate(endDate.plus(1, ChronoUnit.DAYS)));

        restUserMockMvc
            .perform(get("/api/users/normal-authorization-list?startDate={startDate}&endDate={endDate}", startDate, endDate))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].login").value(hasItem(user.getLogin())))
            .andExpect(jsonPath("$.[*].assigned").value(hasItem(1)))
            .andExpect(jsonPath("$.[*].submitted").value(hasItem(1)))
            .andExpect(jsonPath("$.[*].approved").value(not(hasItem(1))))
            .andExpect(jsonPath("$.[*].declined").value(hasItem(0)));
    }

    @ParameterizedTest
    @Transactional
    @EnumSource(value = PatientStatus.class, names = {"REVIEW_SUBMITTED", "REVIEW_APPROVED", "REVIEW_DECLINED"})
    @WithMockUser(username = "testLogin")
    void test_fetch_users_with_additional_info(PatientStatus status) throws Exception {
        User user = UserResourceIT.createEntity(em).login("testLogin").authorities(new HashSet<>(Set.of(new Authority().name(AuthoritiesConstants.USER))));
        userRepository.saveAndFlush(user);

        String patientNo = "ptno" + new Random().nextInt(100);
        UserPatient userPatient = new UserPatient().user(user).patientNo(patientNo);
        userPatientRepository.saveAndFlush(userPatient);

        Patient patient = new Patient().ptNo(patientNo).detail(new PatientDetail().status(status).createdBy(user.getLogin()));
        patientRepository.insert(patient);
        patientDetailRepository.insert(patient.getPtNo(), patient.getDetail());

        restUserMockMvc
            .perform(get("/api/users/normal-authorization-list"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].login").value(hasItem(user.getLogin())))
            .andExpect(jsonPath("$.[*].assigned").value(hasItem(1)))
            .andExpect(jsonPath("$.[*]." + status.name().toLowerCase().split("_")[1]).value(hasItem(1)));
    }
}

