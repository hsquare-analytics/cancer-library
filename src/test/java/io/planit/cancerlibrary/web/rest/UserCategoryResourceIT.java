//package io.planit.cancerlibrary.web.rest;
//
//import static org.assertj.core.api.Assertions.assertThat;
//import static org.hamcrest.Matchers.hasItems;
//import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
//import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
//import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
//import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
//
//import io.planit.cancerlibrary.IntegrationTest;
//import io.planit.cancerlibrary.domain.Category;
//import io.planit.cancerlibrary.domain.Library;
//import io.planit.cancerlibrary.domain.User;
//import io.planit.cancerlibrary.domain.UserCategory;
//import io.planit.cancerlibrary.repository.CategoryRepository;
//import io.planit.cancerlibrary.repository.LibraryRepository;
//import io.planit.cancerlibrary.repository.UserCategoryRepository;
//import io.planit.cancerlibrary.repository.UserRepository;
//import java.time.Instant;
//import java.util.List;
//import java.util.Random;
//import java.util.concurrent.atomic.AtomicLong;
//import javax.persistence.EntityManager;
//import org.junit.jupiter.api.BeforeEach;
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
//import org.springframework.http.MediaType;
//import org.springframework.security.test.context.support.WithMockUser;
//import org.springframework.test.web.servlet.MockMvc;
//import org.springframework.transaction.annotation.Transactional;
//
//
///**
// * Integration tests for the {@link UserCategoryResource} REST controller.
// */
//@IntegrationTest
//@AutoConfigureMockMvc
//@WithMockUser
//class UserCategoryResourceIT {
//
//    private static final Boolean DEFAULT_ACTIVATED = false;
//    private static final Boolean UPDATED_ACTIVATED = true;
//
//    private static final Instant DEFAULT_TERM_START = Instant.parse("2019-01-01T00:00:00.000Z");
//    private static final Instant UPDATED_TERM_START = Instant.parse("2022-01-01T00:00:00.000Z");
//
//    private static final Instant DEFAULT_TERM_END = Instant.parse("2019-12-31T00:00:00.000Z");
//    private static final Instant UPDATED_TERM_END = Instant.parse("2022-12-01T00:00:00.000Z");
//
//    private static final String ENTITY_API_URL = "/api/users-categories";
//    private static final String ENTITY_API_URL_ID = ENTITY_API_URL + "/{id}";
//
//    private static Random random = new Random();
//    private static AtomicLong count = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));
//
//    @Autowired
//    private UserCategoryRepository userCategoryRepository;
//
//    @Autowired
//    private UserRepository userRepository;
//
//    @Autowired
//    private LibraryRepository libraryRepository;
//
//    @Autowired
//    private CategoryRepository categoryRepository;
//
//    @Autowired
//    private EntityManager em;
//
//    @Autowired
//    private MockMvc restUserCategoryMockMvc;
//
//    private UserCategory userCategory;
//
//    private User user;
//
//    private Library library;
//
//    private Category category;
//
//    public static UserCategory createEntity(EntityManager em , User user, Category category) {
//        return new UserCategory()
//            .user(user)
//            .category(category)
//            .activated(DEFAULT_ACTIVATED)
//            .termStart(DEFAULT_TERM_START)
//            .termEnd(DEFAULT_TERM_END);
//    }
//
//    public static UserCategory createUpdatedEntity(EntityManager em, User user, Category category) {
//        return new UserCategory()
//            .user(user)
//            .category(category)
//            .activated(UPDATED_ACTIVATED)
//            .termStart(UPDATED_TERM_START)
//            .termEnd(UPDATED_TERM_END);
//    }
//
//    @BeforeEach
//    public void initTest() {
//        user = UserResourceIT.createEntity(em);
//        userRepository.saveAndFlush(user);
//
//        library = LibraryResourceIT.createEntity(em);
//        libraryRepository.saveAndFlush(library);
//
//        category = CategoryResourceIT.createEntity(em, library);
//        categoryRepository.saveAndFlush(category);
//
//        userCategory = createEntity(em, user, category);
//    }
//
//    @Test
//    @Transactional
//    void createUserCategory() throws Exception {
//        int databaseSizeBeforeCreate = userCategoryRepository.findAll().size();
//        // Create the UserCategory
//        restUserCategoryMockMvc
//            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON)
//                .content(TestUtil.convertObjectToJsonBytes(userCategory)))
//            .andExpect(status().isCreated());
//
//        // Validate the UserCategory in the database
//        List<UserCategory> userCategorylist = userCategoryRepository.findAll();
//        assertThat(userCategorylist).hasSize(databaseSizeBeforeCreate + 1);
//        UserCategory testUserCategory = userCategorylist.get(userCategorylist.size() - 1);
//        assertThat(testUserCategory.getUser().getId()).isEqualTo(user.getId());
//        assertThat(testUserCategory.getCategory().getId()).isEqualTo(category.getId());
//        assertThat(testUserCategory.isActivated()).isEqualTo(DEFAULT_ACTIVATED);
//        assertThat(testUserCategory.getTermStart()).isEqualTo(DEFAULT_TERM_START);
//        assertThat(testUserCategory.getTermEnd()).isEqualTo(DEFAULT_TERM_END);
//    }
//
//    @Test
//    @Transactional
//    void createUserCategoryWithExistingId() throws Exception {
//        // Create the UserCategory with an existing ID
//        userCategory.setId(1L);
//
//        int databaseSizeBeforeCreate = userCategoryRepository.findAll().size();
//
//        // An entity with an existing ID cannot be created, so this API call must fail
//        restUserCategoryMockMvc
//            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON)
//                .content(TestUtil.convertObjectToJsonBytes(userCategory)))
//            .andExpect(status().isBadRequest());
//
//        // Validate the UserCategory in the database
//        List<UserCategory> userCategorylist = userCategoryRepository.findAll();
//        assertThat(userCategorylist).hasSize(databaseSizeBeforeCreate);
//    }
//
//    @Test
//    @Transactional
//    void getAllLibraries() throws Exception {
//        // Initialize the database
//        userCategoryRepository.saveAndFlush(userCategory);
//
//        // Get all the userCategorylist
//        restUserCategoryMockMvc
//            .perform(get(ENTITY_API_URL + "?sort=id,desc"))
//            .andExpect(status().isOk())
//            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
//            .andExpect(jsonPath("$.[*].id").value(hasItems(userCategory.getId().intValue())))
//            .andExpect(jsonPath("$.[*].user.id").value(hasItems(user.getId().intValue())))
//            .andExpect(jsonPath("$.[*].category.id").value(hasItems(category.getId().intValue())));
//    }
//
//    @Test
//    @Transactional
//    void getUserCategory() throws Exception {
//        // Initialize the database
//        userCategoryRepository.saveAndFlush(userCategory);
//
//        // Get the userCategory
//        restUserCategoryMockMvc
//            .perform(get(ENTITY_API_URL_ID, userCategory.getId()))
//            .andExpect(status().isOk())
//            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
//            .andExpect(jsonPath("$.id").value(userCategory.getId().intValue()))
//            .andExpect(jsonPath("$.user.id").value(user.getId().intValue()))
//            .andExpect(jsonPath("$.category.id").value(category.getId().intValue()))
//            .andExpect(jsonPath("$.activated").value(DEFAULT_ACTIVATED))
//            .andExpect(jsonPath("$.termStart").value(DEFAULT_TERM_START.toString()))
//            .andExpect(jsonPath("$.termEnd").value(DEFAULT_TERM_END.toString()));
//    }
//
//    @Test
//    @Transactional
//    void getNonExistingUserCategory() throws Exception {
//        // Get the userCategory
//        restUserCategoryMockMvc.perform(get(ENTITY_API_URL_ID, Long.MAX_VALUE)).andExpect(status().isNotFound());
//    }
//
//    @Test
//    @Transactional
//    void putNewUserCategory() throws Exception {
//        // Initialize the database
//        userCategoryRepository.saveAndFlush(userCategory);
//
//        int databaseSizeBeforeUpdate = userCategoryRepository.findAll().size();
//
//        // Update the userCategory
//        UserCategory updatedUserCategory = userCategoryRepository.findById(userCategory.getId()).get();
//        // Disconnect from session so that the updates on updatedUserCategory are not directly saved in db
//        em.detach(userCategory);
//        Category category = CategoryResourceIT.createUpdatedEntity(em, library);
//        categoryRepository.saveAndFlush(category);
//
//        updatedUserCategory.category(category)
//            .activated(UPDATED_ACTIVATED)
//            .termStart(UPDATED_TERM_START)
//            .termEnd(UPDATED_TERM_END);
//
//        restUserCategoryMockMvc
//            .perform(
//                put(ENTITY_API_URL_ID, updatedUserCategory.getId())
//                    .contentType(MediaType.APPLICATION_JSON)
//                    .content(TestUtil.convertObjectToJsonBytes(updatedUserCategory))
//            )
//            .andExpect(status().isOk());
//
//        // Validate the UserCategory in the database
//        List<UserCategory> userCategorylist = userCategoryRepository.findAll();
//        assertThat(userCategorylist).hasSize(databaseSizeBeforeUpdate);
//        UserCategory testUserCategory = userCategorylist.get(userCategorylist.size() - 1);
//        assertThat(testUserCategory.getCategory()).isEqualTo(category);
//        assertThat(testUserCategory.getUser()).isEqualTo(user);
//        assertThat(testUserCategory.isActivated()).isEqualTo(UPDATED_ACTIVATED);
//        assertThat(testUserCategory.getTermStart()).isEqualTo(UPDATED_TERM_START);
//        assertThat(testUserCategory.getTermEnd()).isEqualTo(UPDATED_TERM_END);
//    }
//
//    @Test
//    @Transactional
//    void putNonExistingUserCategory() throws Exception {
//        int databaseSizeBeforeUpdate = userCategoryRepository.findAll().size();
//        userCategory.setId(count.incrementAndGet());
//
//        // If the entity doesn't have an ID, it will throw BadRequestAlertException
//        restUserCategoryMockMvc
//            .perform(
//                put(ENTITY_API_URL_ID, userCategory.getId())
//                    .contentType(MediaType.APPLICATION_JSON)
//                    .content(TestUtil.convertObjectToJsonBytes(userCategory))
//            )
//            .andExpect(status().isBadRequest());
//
//        // Validate the UserCategory in the database
//        List<UserCategory> userCategorylist = userCategoryRepository.findAll();
//        assertThat(userCategorylist).hasSize(databaseSizeBeforeUpdate);
//    }
//
//    @Test
//    @Transactional
//    void putWithIdMismatchUserCategory() throws Exception {
//        int databaseSizeBeforeUpdate = userCategoryRepository.findAll().size();
//        userCategory.setId(count.incrementAndGet());
//
//        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
//        restUserCategoryMockMvc
//            .perform(
//                put(ENTITY_API_URL_ID, count.incrementAndGet())
//                    .contentType(MediaType.APPLICATION_JSON)
//                    .content(TestUtil.convertObjectToJsonBytes(userCategory))
//            )
//            .andExpect(status().isBadRequest());
//
//        // Validate the UserCategory in the database
//        List<UserCategory> userCategorylist = userCategoryRepository.findAll();
//        assertThat(userCategorylist).hasSize(databaseSizeBeforeUpdate);
//    }
//
//    @Test
//    @Transactional
//    void putWithMissingIdPathParamUserCategory() throws Exception {
//        int databaseSizeBeforeUpdate = userCategoryRepository.findAll().size();
//        userCategory.setId(count.incrementAndGet());
//
//        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
//        restUserCategoryMockMvc
//            .perform(put(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(userCategory)))
//            .andExpect(status().isMethodNotAllowed());
//
//        // Validate the UserCategory in the database
//        List<UserCategory> userCategorylist = userCategoryRepository.findAll();
//        assertThat(userCategorylist).hasSize(databaseSizeBeforeUpdate);
//    }
//
////    @Test
////    @Transactional
////    void partialUpdateUserCategoryWithPatch() throws Exception {
////        // Initialize the database
////        userCategoryRepository.saveAndFlush(userCategory);
////
////        int databaseSizeBeforeUpdate = userCategoryRepository.findAll().size();
////
////        // Update the userCategory using partial update
////        UserCategory partialUpdatedUserCategory = new UserCategory();
////        UserCategory.setId(userCategory.getId());
////
////        UserCategory.activated(UPDATED_ACTIVATED);
////
////        restUserCategoryMockMvc
////            .perform(
////                patch(ENTITY_API_URL_ID, UserCategory.getId())
////                    .contentType("application/merge-patch+json")
////                    .content(TestUtil.convertObjectToJsonBytes(UserCategory))
////            )
////            .andExpect(status().isOk());
////
////        // Validate the UserCategory in the database
////        List<UserCategory> userCategorylist = userCategoryRepository.findAll();
////        assertThat(userCategorylist).hasSize(databaseSizeBeforeUpdate);
////        UserCategory testUserCategory = userCategorylist.get(userCategorylist.size() - 1);
////        assertThat(UserCategory.getTitle()).isEqualTo(DEFAULT_TITLE);
////        assertThat(UserCategory.getDescription()).isEqualTo(DEFAULT_DESCRIPTION);
////        assertThat(UserCategory.getActivated()).isEqualTo(UPDATED_ACTIVATED);
////    }
////
////    @Test
////    @Transactional
////    void fullUpdateUserCategoryWithPatch() throws Exception {
////        // Initialize the database
////        userCategoryRepository.saveAndFlush(userCategory);
////
////        int databaseSizeBeforeUpdate = userCategoryRepository.findAll().size();
////
////        // Update the userCategory using partial update
////        UserCategory partialUpdatedUserCategory = new UserCategory();
////        UserCategory.setId(userCategory.getId());
////
////        UserCategory.title(UPDATED_TITLE).description(UPDATED_DESCRIPTION).activated(UPDATED_ACTIVATED);
////
////        restUserCategoryMockMvc
////            .perform(
////                patch(ENTITY_API_URL_ID, UserCategory.getId())
////                    .contentType("application/merge-patch+json")
////                    .content(TestUtil.convertObjectToJsonBytes(UserCategory))
////            )
////            .andExpect(status().isOk());
////
////        // Validate the UserCategory in the database
////        List<UserCategory> userCategorylist = userCategoryRepository.findAll();
////        assertThat(userCategorylist).hasSize(databaseSizeBeforeUpdate);
////        UserCategory testUserCategory = userCategorylist.get(userCategorylist.size() - 1);
////        assertThat(UserCategory.getTitle()).isEqualTo(UPDATED_TITLE);
////        assertThat(UserCategory.getDescription()).isEqualTo(UPDATED_DESCRIPTION);
////        assertThat(UserCategory.getActivated()).isEqualTo(UPDATED_ACTIVATED);
////    }
////
////    @Test
////    @Transactional
////    void patchNonExistingUserCategory() throws Exception {
////        int databaseSizeBeforeUpdate = userCategoryRepository.findAll().size();
////        userCategory.setId(count.incrementAndGet());
////
////        // If the entity doesn't have an ID, it will throw BadRequestAlertException
////        restUserCategoryMockMvc
////            .perform(
////                patch(ENTITY_API_URL_ID, userCategory.getId())
////                    .contentType("application/merge-patch+json")
////                    .content(TestUtil.convertObjectToJsonBytes(userCategory))
////            )
////            .andExpect(status().isBadRequest());
////
////        // Validate the UserCategory in the database
////        List<UserCategory> userCategorylist = userCategoryRepository.findAll();
////        assertThat(userCategorylist).hasSize(databaseSizeBeforeUpdate);
////    }
////
////    @Test
////    @Transactional
////    void patchWithIdMismatchUserCategory() throws Exception {
////        int databaseSizeBeforeUpdate = userCategoryRepository.findAll().size();
////        userCategory.setId(count.incrementAndGet());
////
////        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
////        restUserCategoryMockMvc
////            .perform(
////                patch(ENTITY_API_URL_ID, count.incrementAndGet())
////                    .contentType("application/merge-patch+json")
////                    .content(TestUtil.convertObjectToJsonBytes(userCategory))
////            )
////            .andExpect(status().isBadRequest());
////
////        // Validate the UserCategory in the database
////        List<UserCategory> userCategorylist = userCategoryRepository.findAll();
////        assertThat(userCategorylist).hasSize(databaseSizeBeforeUpdate);
////    }
////
////    @Test
////    @Transactional
////    void patchWithMissingIdPathParamUserCategory() throws Exception {
////        int databaseSizeBeforeUpdate = userCategoryRepository.findAll().size();
////        userCategory.setId(count.incrementAndGet());
////
////        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
////        restUserCategoryMockMvc
////            .perform(patch(ENTITY_API_URL).contentType("application/merge-patch+json").content(TestUtil.convertObjectToJsonBytes(userCategory)))
////            .andExpect(status().isMethodNotAllowed());
////
////        // Validate the UserCategory in the database
////        List<UserCategory> userCategorylist = userCategoryRepository.findAll();
////        assertThat(userCategorylist).hasSize(databaseSizeBeforeUpdate);
////    }
//
//    @Test
//    @Transactional
//    void deleteUserCategory() throws Exception {
//        // Initialize the database
//        userCategoryRepository.saveAndFlush(userCategory);
//
//        int databaseSizeBeforeDelete = userCategoryRepository.findAll().size();
//
//        // Delete the userCategory
//        restUserCategoryMockMvc
//            .perform(delete(ENTITY_API_URL_ID, userCategory.getId()).accept(MediaType.APPLICATION_JSON))
//            .andExpect(status().isNoContent());
//
//        // Validate the database contains one less item
//        List<UserCategory> userCategorylist = userCategoryRepository.findAll();
//        assertThat(userCategorylist).hasSize(databaseSizeBeforeDelete - 1);
//    }
//}
