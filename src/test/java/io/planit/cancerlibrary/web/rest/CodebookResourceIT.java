package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.Codebook;
import io.planit.cancerlibrary.repository.CodebookRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.util.List;
import java.util.Random;
import java.util.concurrent.atomic.AtomicLong;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@IntegrationTest
@AutoConfigureMockMvc
@WithMockUser
class CodebookResourceIT {

    private static final String DEFAULT_TITLE = "AAAAAAAAAA";
    private static final String UPDATED_TITLE = "BBBBBBBBBB";

    private static final String DEFAULT_DESCRIPTION = "AAAAAAAAAA";
    private static final String UPDATED_DESCRIPTION = "BBBBBBBBBB";

    private static final String ENTITY_API_URL = "/api/codebooks";
    private static final String ENTITY_API_URL_ID = ENTITY_API_URL + "/{id}";

    private static Random random = new Random();
    private static AtomicLong count = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

    @Autowired
    private CodebookRepository codebookRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restCodebookMockMvc;

    private Codebook codebook;

    public static Codebook createEntity(EntityManager em) {
        Codebook codebook = new Codebook().title(DEFAULT_TITLE).description(DEFAULT_DESCRIPTION);
        return codebook;
    }

    public static Codebook createUpdatedEntity(EntityManager em) {
        Codebook codebook = new Codebook().title(UPDATED_TITLE).description(UPDATED_DESCRIPTION);
        return codebook;
    }

    @BeforeEach
    public void initTest() {
        codebook = createEntity(em);
    }

    @Test
    @Transactional
    void createCodebook() throws Exception {
        int databaseSizeBeforeCreate = codebookRepository.findAll().size();
        restCodebookMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(codebook)))
            .andExpect(status().isCreated());

        List<Codebook> codebookList = codebookRepository.findAll();
        assertThat(codebookList).hasSize(databaseSizeBeforeCreate + 1);
        Codebook testCodebook = codebookList.get(codebookList.size() - 1);
        assertThat(testCodebook.getTitle()).isEqualTo(DEFAULT_TITLE);
        assertThat(testCodebook.getDescription()).isEqualTo(DEFAULT_DESCRIPTION);
    }

    @Test
    @Transactional
    void createCodebookWithExistingId() throws Exception {
        codebook.setId(1L);

        int databaseSizeBeforeCreate = codebookRepository.findAll().size();

        restCodebookMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(codebook)))
            .andExpect(status().isBadRequest());

        List<Codebook> codebookList = codebookRepository.findAll();
        assertThat(codebookList).hasSize(databaseSizeBeforeCreate);
    }

    @Test
    @Transactional
    void checkTitleIsRequired() throws Exception {
        int databaseSizeBeforeTest = codebookRepository.findAll().size();
        codebook.setTitle(null);


        restCodebookMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(codebook)))
            .andExpect(status().isBadRequest());

        List<Codebook> codebookList = codebookRepository.findAll();
        assertThat(codebookList).hasSize(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    void getAllCodebooks() throws Exception {
        codebookRepository.saveAndFlush(codebook);

        restCodebookMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(codebook.getId().intValue())))
            .andExpect(jsonPath("$.[*].title").value(hasItem(DEFAULT_TITLE)))
            .andExpect(jsonPath("$.[*].description").value(hasItem(DEFAULT_DESCRIPTION)));
    }

    @Test
    @Transactional
    void getCodebook() throws Exception {
        codebookRepository.saveAndFlush(codebook);

        restCodebookMockMvc
            .perform(get(ENTITY_API_URL_ID, codebook.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.id").value(codebook.getId().intValue()))
            .andExpect(jsonPath("$.title").value(DEFAULT_TITLE))
            .andExpect(jsonPath("$.description").value(DEFAULT_DESCRIPTION));
    }

    @Test
    @Transactional
    void getNonExistingCodebook() throws Exception {
        restCodebookMockMvc.perform(get(ENTITY_API_URL_ID, Long.MAX_VALUE)).andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    void putNewCodebook() throws Exception {
        codebookRepository.saveAndFlush(codebook);

        int databaseSizeBeforeUpdate = codebookRepository.findAll().size();

        Codebook updatedCodebook = codebookRepository.findById(codebook.getId()).get();
        em.detach(updatedCodebook);
        updatedCodebook.title(UPDATED_TITLE).description(UPDATED_DESCRIPTION);

        restCodebookMockMvc
            .perform(
                put(ENTITY_API_URL_ID, updatedCodebook.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(updatedCodebook))
            )
            .andExpect(status().isOk());

        List<Codebook> codebookList = codebookRepository.findAll();
        assertThat(codebookList).hasSize(databaseSizeBeforeUpdate);
        Codebook testCodebook = codebookList.get(codebookList.size() - 1);
        assertThat(testCodebook.getTitle()).isEqualTo(UPDATED_TITLE);
        assertThat(testCodebook.getDescription()).isEqualTo(UPDATED_DESCRIPTION);
    }

    @Test
    @Transactional
    void putNonExistingCodebook() throws Exception {
        int databaseSizeBeforeUpdate = codebookRepository.findAll().size();
        codebook.setId(count.incrementAndGet());

        restCodebookMockMvc
            .perform(
                put(ENTITY_API_URL_ID, codebook.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(codebook))
            )
            .andExpect(status().isBadRequest());

        List<Codebook> codebookList = codebookRepository.findAll();
        assertThat(codebookList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithIdMismatchCodebook() throws Exception {
        int databaseSizeBeforeUpdate = codebookRepository.findAll().size();
        codebook.setId(count.incrementAndGet());

        restCodebookMockMvc
            .perform(
                put(ENTITY_API_URL_ID, count.incrementAndGet())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(codebook))
            )
            .andExpect(status().isBadRequest());

        List<Codebook> codebookList = codebookRepository.findAll();
        assertThat(codebookList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithMissingIdPathParamCodebook() throws Exception {
        int databaseSizeBeforeUpdate = codebookRepository.findAll().size();
        codebook.setId(count.incrementAndGet());

        restCodebookMockMvc
            .perform(put(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(codebook)))
            .andExpect(status().isMethodNotAllowed());

        List<Codebook> codebookList = codebookRepository.findAll();
        assertThat(codebookList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void partialUpdateCodebookWithPatch() throws Exception {
        codebookRepository.saveAndFlush(codebook);

        int databaseSizeBeforeUpdate = codebookRepository.findAll().size();

        Codebook partialUpdatedCodebook = new Codebook();
        partialUpdatedCodebook.setId(codebook.getId());

        partialUpdatedCodebook.description(UPDATED_DESCRIPTION);

        restCodebookMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedCodebook.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(partialUpdatedCodebook))
            )
            .andExpect(status().isOk());

        List<Codebook> codebookList = codebookRepository.findAll();
        assertThat(codebookList).hasSize(databaseSizeBeforeUpdate);
        Codebook testCodebook = codebookList.get(codebookList.size() - 1);
        assertThat(testCodebook.getTitle()).isEqualTo(DEFAULT_TITLE);
        assertThat(testCodebook.getDescription()).isEqualTo(UPDATED_DESCRIPTION);
    }

    @Test
    @Transactional
    void fullUpdateCodebookWithPatch() throws Exception {
        codebookRepository.saveAndFlush(codebook);

        int databaseSizeBeforeUpdate = codebookRepository.findAll().size();

        Codebook partialUpdatedCodebook = new Codebook();
        partialUpdatedCodebook.setId(codebook.getId());

        partialUpdatedCodebook.title(UPDATED_TITLE).description(UPDATED_DESCRIPTION);

        restCodebookMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedCodebook.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(partialUpdatedCodebook))
            )
            .andExpect(status().isOk());

        List<Codebook> codebookList = codebookRepository.findAll();
        assertThat(codebookList).hasSize(databaseSizeBeforeUpdate);
        Codebook testCodebook = codebookList.get(codebookList.size() - 1);
        assertThat(testCodebook.getTitle()).isEqualTo(UPDATED_TITLE);
        assertThat(testCodebook.getDescription()).isEqualTo(UPDATED_DESCRIPTION);
    }

    @Test
    @Transactional
    void patchNonExistingCodebook() throws Exception {
        int databaseSizeBeforeUpdate = codebookRepository.findAll().size();
        codebook.setId(count.incrementAndGet());

        restCodebookMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, codebook.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(codebook))
            )
            .andExpect(status().isBadRequest());

        List<Codebook> codebookList = codebookRepository.findAll();
        assertThat(codebookList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithIdMismatchCodebook() throws Exception {
        int databaseSizeBeforeUpdate = codebookRepository.findAll().size();
        codebook.setId(count.incrementAndGet());

        restCodebookMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, count.incrementAndGet())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(codebook))
            )
            .andExpect(status().isBadRequest());

        List<Codebook> codebookList = codebookRepository.findAll();
        assertThat(codebookList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithMissingIdPathParamCodebook() throws Exception {
        int databaseSizeBeforeUpdate = codebookRepository.findAll().size();
        codebook.setId(count.incrementAndGet());

        restCodebookMockMvc
            .perform(patch(ENTITY_API_URL).contentType("application/merge-patch+json").content(TestUtil.convertObjectToJsonBytes(codebook)))
            .andExpect(status().isMethodNotAllowed());

        List<Codebook> codebookList = codebookRepository.findAll();
        assertThat(codebookList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void deleteCodebook() throws Exception {
        codebookRepository.saveAndFlush(codebook);

        int databaseSizeBeforeDelete = codebookRepository.findAll().size();

        restCodebookMockMvc
            .perform(delete(ENTITY_API_URL_ID, codebook.getId()).accept(MediaType.APPLICATION_JSON))
            .andExpect(status().isNoContent());

        List<Codebook> codebookList = codebookRepository.findAll();
        assertThat(codebookList).hasSize(databaseSizeBeforeDelete - 1);
    }
}
