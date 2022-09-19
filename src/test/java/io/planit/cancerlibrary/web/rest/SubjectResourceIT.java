package io.planit.cancerlibrary.web.rest;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.patch;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.Subject;
import io.planit.cancerlibrary.repository.SubjectRepository;
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
class SubjectResourceIT {

    private static final Integer DEFAULT_ORDER_NO = 1;
    private static final Integer UPDATED_ORDER_NO = 2;

    private static final String DEFAULT_TITLE = "AAAAAAAAAA";
    private static final String UPDATED_TITLE = "BBBBBBBBBB";

    private static final boolean DEFAULT_ACTIVATED = true;
    private static final boolean UPDATED_ACTIVATED = false;

    private static final String ENTITY_API_URL = "/api/subjects";
    private static final String ENTITY_API_URL_ID = ENTITY_API_URL + "/{id}";

    private static Random random = new Random();
    private static AtomicLong count = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

    @Autowired
    private SubjectRepository subjectRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restSubjectMockMvc;

    private Subject subject;

    public static Subject createEntity(EntityManager em) {
        Subject subject = new Subject().orderNo(DEFAULT_ORDER_NO).title(DEFAULT_TITLE).activated(DEFAULT_ACTIVATED);
        return subject;
    }

    public static Subject createUpdatedEntity(EntityManager em) {
        Subject subject = new Subject().orderNo(UPDATED_ORDER_NO).title(UPDATED_TITLE).activated(UPDATED_ACTIVATED);
        return subject;
    }

    @BeforeEach
    public void initTest() {
        subject = createEntity(em);
    }

    @Test
    @Transactional
    void createSubject() throws Exception {
        int databaseSizeBeforeCreate = subjectRepository.findAll().size();
        restSubjectMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(subject)))
            .andExpect(status().isCreated());

        List<Subject> subjectList = subjectRepository.findAll();
        assertThat(subjectList).hasSize(databaseSizeBeforeCreate + 1);
        Subject testSubject = subjectList.get(subjectList.size() - 1);
        assertThat(testSubject.getTitle()).isEqualTo(DEFAULT_TITLE);
        assertThat(testSubject.getActivated()).isEqualTo(DEFAULT_ACTIVATED);
        assertThat(testSubject.getOrderNo()).isEqualTo(DEFAULT_ORDER_NO);
    }

    @Test
    @Transactional
    void createSubjectWithExistingId() throws Exception {
        subject.setId(1L);

        int databaseSizeBeforeCreate = subjectRepository.findAll().size();

        restSubjectMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(subject)))
            .andExpect(status().isBadRequest());

        List<Subject> subjectList = subjectRepository.findAll();
        assertThat(subjectList).hasSize(databaseSizeBeforeCreate);
    }

    @Test
    @Transactional
    void checkTitleIsRequired() throws Exception {
        int databaseSizeBeforeTest = subjectRepository.findAll().size();
        subject.setTitle(null);

        restSubjectMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(subject)))
            .andExpect(status().isBadRequest());

        List<Subject> subjectList = subjectRepository.findAll();
        assertThat(subjectList).hasSize(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    void getAllSubjects() throws Exception {
        subjectRepository.saveAndFlush(subject);

        restSubjectMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(subject.getId().intValue())))
            .andExpect(jsonPath("$.[*].orderNo").value(hasItem(DEFAULT_ORDER_NO)))
            .andExpect(jsonPath("$.[*].title").value(hasItem(DEFAULT_TITLE)))
            .andExpect(jsonPath("$.[*].activated").value(hasItem(DEFAULT_ACTIVATED)));
    }

    @Test
    @Transactional
    void getSubject() throws Exception {
        subjectRepository.saveAndFlush(subject);

        restSubjectMockMvc
            .perform(get(ENTITY_API_URL_ID, subject.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.id").value(subject.getId().intValue()))
            .andExpect(jsonPath("$.orderNo").value(subject.getOrderNo().intValue()))
            .andExpect(jsonPath("$.title").value(DEFAULT_TITLE))
            .andExpect(jsonPath("$.activated").value(DEFAULT_ACTIVATED));
    }

    @Test
    @Transactional
    void getNonExistingSubject() throws Exception {
        // Get the subject
        restSubjectMockMvc.perform(get(ENTITY_API_URL_ID, Long.MAX_VALUE)).andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    void putNewSubject() throws Exception {
        subjectRepository.saveAndFlush(subject);

        int databaseSizeBeforeUpdate = subjectRepository.findAll().size();

        Subject updatedSubject = subjectRepository.findById(subject.getId()).get();
        em.detach(updatedSubject);
        updatedSubject.orderNo(UPDATED_ORDER_NO).title(UPDATED_TITLE).activated(UPDATED_ACTIVATED);

        restSubjectMockMvc
            .perform(
                put(ENTITY_API_URL_ID, updatedSubject.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(updatedSubject))
            )
            .andExpect(status().isOk());

        List<Subject> subjectList = subjectRepository.findAll();
        assertThat(subjectList).hasSize(databaseSizeBeforeUpdate);
        Subject testSubject = subjectList.get(subjectList.size() - 1);
        assertThat(testSubject.getOrderNo()).isEqualTo(UPDATED_ORDER_NO);
        assertThat(testSubject.getTitle()).isEqualTo(UPDATED_TITLE);
        assertThat(testSubject.getActivated()).isEqualTo(UPDATED_ACTIVATED);
    }

    @Test
    @Transactional
    void putNonExistingSubject() throws Exception {
        int databaseSizeBeforeUpdate = subjectRepository.findAll().size();
        subject.setId(count.incrementAndGet());

        restSubjectMockMvc
            .perform(
                put(ENTITY_API_URL_ID, subject.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(subject))
            )
            .andExpect(status().isBadRequest());

        List<Subject> subjectList = subjectRepository.findAll();
        assertThat(subjectList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithIdMismatchSubject() throws Exception {
        int databaseSizeBeforeUpdate = subjectRepository.findAll().size();
        subject.setId(count.incrementAndGet());

        restSubjectMockMvc
            .perform(
                put(ENTITY_API_URL_ID, count.incrementAndGet())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(subject))
            )
            .andExpect(status().isBadRequest());

        List<Subject> subjectList = subjectRepository.findAll();
        assertThat(subjectList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithMissingIdPathParamSubject() throws Exception {
        int databaseSizeBeforeUpdate = subjectRepository.findAll().size();
        subject.setId(count.incrementAndGet());

        restSubjectMockMvc
            .perform(put(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(subject)))
            .andExpect(status().isMethodNotAllowed());

        List<Subject> subjectList = subjectRepository.findAll();
        assertThat(subjectList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void partialUpdateSubjectWithPatch() throws Exception {
        subjectRepository.saveAndFlush(subject);

        int databaseSizeBeforeUpdate = subjectRepository.findAll().size();

        Subject partialUpdatedSubject = new Subject();
        partialUpdatedSubject.setId(subject.getId());

        partialUpdatedSubject.activated(UPDATED_ACTIVATED);

        restSubjectMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedSubject.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(partialUpdatedSubject))
            )
            .andExpect(status().isOk());

        List<Subject> subjectList = subjectRepository.findAll();
        assertThat(subjectList).hasSize(databaseSizeBeforeUpdate);
        Subject testSubject = subjectList.get(subjectList.size() - 1);
        assertThat(testSubject.getTitle()).isEqualTo(DEFAULT_TITLE);
        assertThat(testSubject.getActivated()).isEqualTo(UPDATED_ACTIVATED);
    }

    @Test
    @Transactional
    void fullUpdateSubjectWithPatch() throws Exception {
        subjectRepository.saveAndFlush(subject);

        int databaseSizeBeforeUpdate = subjectRepository.findAll().size();

        Subject partialUpdatedSubject = new Subject();
        partialUpdatedSubject.setId(subject.getId());

        partialUpdatedSubject.title(UPDATED_TITLE).activated(UPDATED_ACTIVATED);

        restSubjectMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedSubject.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(partialUpdatedSubject))
            )
            .andExpect(status().isOk());

        List<Subject> subjectList = subjectRepository.findAll();
        assertThat(subjectList).hasSize(databaseSizeBeforeUpdate);
        Subject testSubject = subjectList.get(subjectList.size() - 1);
        assertThat(testSubject.getTitle()).isEqualTo(UPDATED_TITLE);
        assertThat(testSubject.getActivated()).isEqualTo(UPDATED_ACTIVATED);
    }

    @Test
    @Transactional
    void patchNonExistingSubject() throws Exception {
        int databaseSizeBeforeUpdate = subjectRepository.findAll().size();
        subject.setId(count.incrementAndGet());

        restSubjectMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, subject.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(subject))
            )
            .andExpect(status().isBadRequest());

        List<Subject> subjectList = subjectRepository.findAll();
        assertThat(subjectList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithIdMismatchSubject() throws Exception {
        int databaseSizeBeforeUpdate = subjectRepository.findAll().size();
        subject.setId(count.incrementAndGet());

        restSubjectMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, count.incrementAndGet())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(subject))
            )
            .andExpect(status().isBadRequest());

        List<Subject> subjectList = subjectRepository.findAll();
        assertThat(subjectList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithMissingIdPathParamSubject() throws Exception {
        int databaseSizeBeforeUpdate = subjectRepository.findAll().size();
        subject.setId(count.incrementAndGet());

        restSubjectMockMvc
            .perform(patch(ENTITY_API_URL).contentType("application/merge-patch+json").content(TestUtil.convertObjectToJsonBytes(subject)))
            .andExpect(status().isMethodNotAllowed());

        List<Subject> subjectList = subjectRepository.findAll();
        assertThat(subjectList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void deleteSubject() throws Exception {
        subjectRepository.saveAndFlush(subject);

        int databaseSizeBeforeDelete = subjectRepository.findAll().size();

        restSubjectMockMvc
            .perform(delete(ENTITY_API_URL_ID, subject.getId()).accept(MediaType.APPLICATION_JSON))
            .andExpect(status().isNoContent());

        List<Subject> subjectList = subjectRepository.findAll();
        assertThat(subjectList).hasSize(databaseSizeBeforeDelete - 1);
    }
}
