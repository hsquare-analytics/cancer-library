package io.planit.cancerlibrary.web.rest;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.Library;
import io.planit.cancerlibrary.repository.LibraryRepository;
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

/**
 * Integration tests for the {@link LibraryResource} REST controller.
 */
@IntegrationTest
@AutoConfigureMockMvc
@WithMockUser
class LibraryResourceIT {

    private static final String DEFAULT_TITLE = "AAAAAAAAAA";
    private static final String UPDATED_TITLE = "BBBBBBBBBB";

    private static final String DEFAULT_DESCRIPTION = "AAAAAAAAAA";
    private static final String UPDATED_DESCRIPTION = "BBBBBBBBBB";

    private static final Boolean DEFAULT_ACTIVATED = false;
    private static final Boolean UPDATED_ACTIVATED = true;

    private static final String ENTITY_API_URL = "/api/libraries";
    private static final String ENTITY_API_URL_ID = ENTITY_API_URL + "/{id}";

    private static Random random = new Random();
    private static AtomicLong count = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

    @Autowired
    private LibraryRepository libraryRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restLibraryMockMvc;

    private Library library;

    /**
     * Create an entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static Library createEntity(EntityManager em) {
        Library library = new Library().title(DEFAULT_TITLE).description(DEFAULT_DESCRIPTION).activated(DEFAULT_ACTIVATED);
        return library;
    }

    /**
     * Create an updated entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static Library createUpdatedEntity(EntityManager em) {
        Library library = new Library().title(UPDATED_TITLE).description(UPDATED_DESCRIPTION).activated(UPDATED_ACTIVATED);
        return library;
    }

    @BeforeEach
    public void initTest() {
        library = createEntity(em);
    }

    @Test
    @Transactional
    void createLibrary() throws Exception {
        int databaseSizeBeforeCreate = libraryRepository.findAll().size();
        // Create the Library
        restLibraryMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(library)))
            .andExpect(status().isCreated());

        // Validate the Library in the database
        List<Library> libraryList = libraryRepository.findAll();
        assertThat(libraryList).hasSize(databaseSizeBeforeCreate + 1);
        Library testLibrary = libraryList.get(libraryList.size() - 1);
        assertThat(testLibrary.getTitle()).isEqualTo(DEFAULT_TITLE);
        assertThat(testLibrary.getDescription()).isEqualTo(DEFAULT_DESCRIPTION);
        assertThat(testLibrary.getActivated()).isEqualTo(DEFAULT_ACTIVATED);
    }

    @Test
    @Transactional
    void createLibraryWithExistingId() throws Exception {
        // Create the Library with an existing ID
        library.setId(1L);

        int databaseSizeBeforeCreate = libraryRepository.findAll().size();

        // An entity with an existing ID cannot be created, so this API call must fail
        restLibraryMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(library)))
            .andExpect(status().isBadRequest());

        // Validate the Library in the database
        List<Library> libraryList = libraryRepository.findAll();
        assertThat(libraryList).hasSize(databaseSizeBeforeCreate);
    }

    @Test
    @Transactional
    void checkTitleIsRequired() throws Exception {
        int databaseSizeBeforeTest = libraryRepository.findAll().size();
        // set the field null
        library.setTitle(null);

        // Create the Library, which fails.

        restLibraryMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(library)))
            .andExpect(status().isBadRequest());

        List<Library> libraryList = libraryRepository.findAll();
        assertThat(libraryList).hasSize(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    void checkActivatedIsRequired() throws Exception {
        int databaseSizeBeforeTest = libraryRepository.findAll().size();
        // set the field null
        library.setActivated(null);

        // Create the Library, which fails.

        restLibraryMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(library)))
            .andExpect(status().isBadRequest());

        List<Library> libraryList = libraryRepository.findAll();
        assertThat(libraryList).hasSize(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    void getAllLibraries() throws Exception {
        // Initialize the database
        libraryRepository.saveAndFlush(library);

        // Get all the libraryList
        restLibraryMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(library.getId().intValue())))
            .andExpect(jsonPath("$.[*].title").value(hasItem(DEFAULT_TITLE)))
            .andExpect(jsonPath("$.[*].description").value(hasItem(DEFAULT_DESCRIPTION)))
            .andExpect(jsonPath("$.[*].activated").value(hasItem(DEFAULT_ACTIVATED.booleanValue())));
    }

    @Test
    @Transactional
    void getLibrary() throws Exception {
        // Initialize the database
        libraryRepository.saveAndFlush(library);

        // Get the library
        restLibraryMockMvc
            .perform(get(ENTITY_API_URL_ID, library.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.id").value(library.getId().intValue()))
            .andExpect(jsonPath("$.title").value(DEFAULT_TITLE))
            .andExpect(jsonPath("$.description").value(DEFAULT_DESCRIPTION))
            .andExpect(jsonPath("$.activated").value(DEFAULT_ACTIVATED.booleanValue()));
    }

    @Test
    @Transactional
    void getNonExistingLibrary() throws Exception {
        // Get the library
        restLibraryMockMvc.perform(get(ENTITY_API_URL_ID, Long.MAX_VALUE)).andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    void putNewLibrary() throws Exception {
        // Initialize the database
        libraryRepository.saveAndFlush(library);

        int databaseSizeBeforeUpdate = libraryRepository.findAll().size();

        // Update the library
        Library updatedLibrary = libraryRepository.findById(library.getId()).get();
        // Disconnect from session so that the updates on updatedLibrary are not directly saved in db
        em.detach(updatedLibrary);
        updatedLibrary.title(UPDATED_TITLE).description(UPDATED_DESCRIPTION).activated(UPDATED_ACTIVATED);

        restLibraryMockMvc
            .perform(
                put(ENTITY_API_URL_ID, updatedLibrary.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(updatedLibrary))
            )
            .andExpect(status().isOk());

        // Validate the Library in the database
        List<Library> libraryList = libraryRepository.findAll();
        assertThat(libraryList).hasSize(databaseSizeBeforeUpdate);
        Library testLibrary = libraryList.get(libraryList.size() - 1);
        assertThat(testLibrary.getTitle()).isEqualTo(UPDATED_TITLE);
        assertThat(testLibrary.getDescription()).isEqualTo(UPDATED_DESCRIPTION);
        assertThat(testLibrary.getActivated()).isEqualTo(UPDATED_ACTIVATED);
    }

    @Test
    @Transactional
    void putNonExistingLibrary() throws Exception {
        int databaseSizeBeforeUpdate = libraryRepository.findAll().size();
        library.setId(count.incrementAndGet());

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restLibraryMockMvc
            .perform(
                put(ENTITY_API_URL_ID, library.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(library))
            )
            .andExpect(status().isBadRequest());

        // Validate the Library in the database
        List<Library> libraryList = libraryRepository.findAll();
        assertThat(libraryList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithIdMismatchLibrary() throws Exception {
        int databaseSizeBeforeUpdate = libraryRepository.findAll().size();
        library.setId(count.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restLibraryMockMvc
            .perform(
                put(ENTITY_API_URL_ID, count.incrementAndGet())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(library))
            )
            .andExpect(status().isBadRequest());

        // Validate the Library in the database
        List<Library> libraryList = libraryRepository.findAll();
        assertThat(libraryList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithMissingIdPathParamLibrary() throws Exception {
        int databaseSizeBeforeUpdate = libraryRepository.findAll().size();
        library.setId(count.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restLibraryMockMvc
            .perform(put(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(library)))
            .andExpect(status().isMethodNotAllowed());

        // Validate the Library in the database
        List<Library> libraryList = libraryRepository.findAll();
        assertThat(libraryList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void partialUpdateLibraryWithPatch() throws Exception {
        // Initialize the database
        libraryRepository.saveAndFlush(library);

        int databaseSizeBeforeUpdate = libraryRepository.findAll().size();

        // Update the library using partial update
        Library partialUpdatedLibrary = new Library();
        partialUpdatedLibrary.setId(library.getId());

        partialUpdatedLibrary.activated(UPDATED_ACTIVATED);

        restLibraryMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedLibrary.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(partialUpdatedLibrary))
            )
            .andExpect(status().isOk());

        // Validate the Library in the database
        List<Library> libraryList = libraryRepository.findAll();
        assertThat(libraryList).hasSize(databaseSizeBeforeUpdate);
        Library testLibrary = libraryList.get(libraryList.size() - 1);
        assertThat(testLibrary.getTitle()).isEqualTo(DEFAULT_TITLE);
        assertThat(testLibrary.getDescription()).isEqualTo(DEFAULT_DESCRIPTION);
        assertThat(testLibrary.getActivated()).isEqualTo(UPDATED_ACTIVATED);
    }

    @Test
    @Transactional
    void fullUpdateLibraryWithPatch() throws Exception {
        // Initialize the database
        libraryRepository.saveAndFlush(library);

        int databaseSizeBeforeUpdate = libraryRepository.findAll().size();

        // Update the library using partial update
        Library partialUpdatedLibrary = new Library();
        partialUpdatedLibrary.setId(library.getId());

        partialUpdatedLibrary.title(UPDATED_TITLE).description(UPDATED_DESCRIPTION).activated(UPDATED_ACTIVATED);

        restLibraryMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedLibrary.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(partialUpdatedLibrary))
            )
            .andExpect(status().isOk());

        // Validate the Library in the database
        List<Library> libraryList = libraryRepository.findAll();
        assertThat(libraryList).hasSize(databaseSizeBeforeUpdate);
        Library testLibrary = libraryList.get(libraryList.size() - 1);
        assertThat(testLibrary.getTitle()).isEqualTo(UPDATED_TITLE);
        assertThat(testLibrary.getDescription()).isEqualTo(UPDATED_DESCRIPTION);
        assertThat(testLibrary.getActivated()).isEqualTo(UPDATED_ACTIVATED);
    }

    @Test
    @Transactional
    void patchNonExistingLibrary() throws Exception {
        int databaseSizeBeforeUpdate = libraryRepository.findAll().size();
        library.setId(count.incrementAndGet());

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restLibraryMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, library.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(library))
            )
            .andExpect(status().isBadRequest());

        // Validate the Library in the database
        List<Library> libraryList = libraryRepository.findAll();
        assertThat(libraryList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithIdMismatchLibrary() throws Exception {
        int databaseSizeBeforeUpdate = libraryRepository.findAll().size();
        library.setId(count.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restLibraryMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, count.incrementAndGet())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(library))
            )
            .andExpect(status().isBadRequest());

        // Validate the Library in the database
        List<Library> libraryList = libraryRepository.findAll();
        assertThat(libraryList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithMissingIdPathParamLibrary() throws Exception {
        int databaseSizeBeforeUpdate = libraryRepository.findAll().size();
        library.setId(count.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restLibraryMockMvc
            .perform(patch(ENTITY_API_URL).contentType("application/merge-patch+json").content(TestUtil.convertObjectToJsonBytes(library)))
            .andExpect(status().isMethodNotAllowed());

        // Validate the Library in the database
        List<Library> libraryList = libraryRepository.findAll();
        assertThat(libraryList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void deleteLibrary() throws Exception {
        // Initialize the database
        libraryRepository.saveAndFlush(library);

        int databaseSizeBeforeDelete = libraryRepository.findAll().size();

        // Delete the library
        restLibraryMockMvc
            .perform(delete(ENTITY_API_URL_ID, library.getId()).accept(MediaType.APPLICATION_JSON))
            .andExpect(status().isNoContent());

        // Validate the database contains one less item
        List<Library> libraryList = libraryRepository.findAll();
        assertThat(libraryList).hasSize(databaseSizeBeforeDelete - 1);
    }
}
