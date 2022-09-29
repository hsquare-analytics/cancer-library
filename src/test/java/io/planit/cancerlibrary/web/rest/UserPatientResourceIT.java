package io.planit.cancerlibrary.web.rest;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItems;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.domain.UserPatient;
import io.planit.cancerlibrary.repository.UserPatientRepository;
import io.planit.cancerlibrary.repository.UserRepository;
import java.util.List;
import java.util.Random;
import java.util.concurrent.atomic.AtomicLong;
import javax.persistence.EntityManager;
import org.junit.jupiter.api.BeforeEach;
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
class UserPatientResourceIT {

    private static final String DEFAULT_PATIENT_NO = "AAAAAAAAA";
    private static final String UPDATED_PATIENT_NO = "BBBBBBBBB";

    private static final String ENTITY_API_URL = "/api/users-patients";
    private static final String ENTITY_API_URL_ID = ENTITY_API_URL + "/{id}";

    private static Random random = new Random();
    private static AtomicLong count = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

    @Autowired
    private UserPatientRepository userPatientRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restUserPatientMockMvc;

    private User user;

    private UserPatient userPatient;

    public static UserPatient createEntity(EntityManager em, User user) {
        return new UserPatient()
            .user(user)
            .patientNo(DEFAULT_PATIENT_NO);
    }

    public static UserPatient createUpdatedEntity(EntityManager em, User user) {
        return new UserPatient()
            .user(user)
            .patientNo(UPDATED_PATIENT_NO);
    }

    @BeforeEach
    public void initTest() {
        user = UserResourceIT.createEntity(em);
        userRepository.saveAndFlush(user);
        userPatient = createEntity(em, user);
    }

    @Test
    @Transactional
    void createUserPatient() throws Exception {
        int databaseSizeBeforeCreate = userPatientRepository.findAll().size();
        // Create the UserPatient
        restUserPatientMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON)
                .content(TestUtil.convertObjectToJsonBytes(userPatient)))
            .andExpect(status().isCreated());

        // Validate the UserPatient in the database
        List<UserPatient> userPatientlist = userPatientRepository.findAll();
        assertThat(userPatientlist).hasSize(databaseSizeBeforeCreate + 1);
        UserPatient testUserPatient = userPatientlist.get(userPatientlist.size() - 1);
        assertThat(testUserPatient.getUser().getId()).isEqualTo(user.getId());
        assertThat(testUserPatient.getPatientNo()).isEqualTo(DEFAULT_PATIENT_NO);
    }

    @Test
    @Transactional
    void createUserPatientWithExistingId() throws Exception {
        // Create the UserPatient with an existing ID
        userPatient.setId(1L);

        int databaseSizeBeforeCreate = userPatientRepository.findAll().size();

        // An entity with an existing ID cannot be created, so this API call must fail
        restUserPatientMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON)
                .content(TestUtil.convertObjectToJsonBytes(userPatient)))
            .andExpect(status().isBadRequest());

        // Validate the UserPatient in the database
        List<UserPatient> userPatientlist = userPatientRepository.findAll();
        assertThat(userPatientlist).hasSize(databaseSizeBeforeCreate);
    }

    @Test
    @Transactional
    void getAllLibraries() throws Exception {
        // Initialize the database
        userPatientRepository.saveAndFlush(userPatient);

        // Get all the userPatientlist
        restUserPatientMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItems(userPatient.getId().intValue())))
            .andExpect(jsonPath("$.[*].user.id").value(hasItems(user.getId().intValue())))
            .andExpect(jsonPath("$.[*].patientNo").value(hasItems(DEFAULT_PATIENT_NO)));
    }

    @Test
    @Transactional
    void getUserPatient() throws Exception {
        // Initialize the database
        userPatientRepository.saveAndFlush(userPatient);

        // Get the userPatient
        restUserPatientMockMvc
            .perform(get(ENTITY_API_URL_ID, userPatient.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.id").value(userPatient.getId().intValue()))
            .andExpect(jsonPath("$.user.id").value(user.getId().intValue()))
            .andExpect(jsonPath("$.patientNo").value(DEFAULT_PATIENT_NO));
    }

    @Test
    @Transactional
    void getNonExistingUserPatient() throws Exception {
        // Get the userPatient
        restUserPatientMockMvc.perform(get(ENTITY_API_URL_ID, Long.MAX_VALUE)).andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    void putNewUserPatient() throws Exception {

        // given
        userPatientRepository.saveAndFlush(userPatient);
        int databaseSizeBeforeUpdate = userPatientRepository.findAll().size();

        UserPatient updatedUserPatient = userPatientRepository.findById(userPatient.getId()).get();
        em.detach(userPatient);

        String updatedUserLogin = "UPDATED_LOGIN";
        String updatedTitle = "UPDATED_TITLE";
        user.setLogin(updatedUserLogin);
        updatedUserPatient.user(user).patientNo(UPDATED_PATIENT_NO);

        //when, then
        restUserPatientMockMvc
            .perform(
                put(ENTITY_API_URL_ID, updatedUserPatient.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(updatedUserPatient))
            )
            .andExpect(status().isOk());

        List<UserPatient> userPatientlist = userPatientRepository.findAll();
        assertThat(userPatientlist).hasSize(databaseSizeBeforeUpdate);

        UserPatient testUserPatient = userPatientlist.get(userPatientlist.size() - 1);
        assertThat(testUserPatient.getUser().getLogin()).isEqualTo(updatedUserLogin.toLowerCase());
        assertThat(testUserPatient.getPatientNo()).isEqualTo(UPDATED_PATIENT_NO);
    }

    @Test
    @Transactional
    void putNonExistingUserPatient() throws Exception {
        int databaseSizeBeforeUpdate = userPatientRepository.findAll().size();
        userPatient.setId(count.incrementAndGet());

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restUserPatientMockMvc
            .perform(
                put(ENTITY_API_URL_ID, userPatient.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(userPatient))
            )
            .andExpect(status().isBadRequest());

        // Validate the UserPatient in the database
        List<UserPatient> userPatientlist = userPatientRepository.findAll();
        assertThat(userPatientlist).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithIdMismatchUserPatient() throws Exception {
        int databaseSizeBeforeUpdate = userPatientRepository.findAll().size();
        userPatient.setId(count.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restUserPatientMockMvc
            .perform(
                put(ENTITY_API_URL_ID, count.incrementAndGet())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(userPatient))
            )
            .andExpect(status().isBadRequest());

        // Validate the UserPatient in the database
        List<UserPatient> userPatientlist = userPatientRepository.findAll();
        assertThat(userPatientlist).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithMissingIdPathParamUserPatient() throws Exception {
        int databaseSizeBeforeUpdate = userPatientRepository.findAll().size();
        userPatient.setId(count.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restUserPatientMockMvc
            .perform(put(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON)
                .content(TestUtil.convertObjectToJsonBytes(userPatient)))
            .andExpect(status().isMethodNotAllowed());

        // Validate the UserPatient in the database
        List<UserPatient> userPatientlist = userPatientRepository.findAll();
        assertThat(userPatientlist).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void deleteUserPatient() throws Exception {
        // Initialize the database
        userPatientRepository.saveAndFlush(userPatient);

        int databaseSizeBeforeDelete = userPatientRepository.findAll().size();

        // Delete the userPatient
        restUserPatientMockMvc
            .perform(delete(ENTITY_API_URL_ID, userPatient.getId()).accept(MediaType.APPLICATION_JSON))
            .andExpect(status().isNoContent());

        // Validate the database contains one less item
        List<UserPatient> userPatientlist = userPatientRepository.findAll();
        assertThat(userPatientlist).hasSize(databaseSizeBeforeDelete - 1);
    }
}
