package io.planit.cancerlibrary.web.rest;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.domain.Library;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.domain.UserCategory;
import io.planit.cancerlibrary.repository.CategoryRepository;
import io.planit.cancerlibrary.repository.LibraryRepository;
import io.planit.cancerlibrary.repository.UserCategoryRepository;
import io.planit.cancerlibrary.repository.UserRepository;
import io.planit.cancerlibrary.service.InstantService;
import javax.persistence.EntityManager;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.BDDMockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;

@IntegrationTest
@AutoConfigureMockMvc
@WithMockUser(username = "testuser")
class NavigationControllerIT {

    private static final String API_URL = "/api/navigations";

    @Autowired
    private LibraryRepository libraryRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserCategoryRepository userCategoryRepository;

    @MockBean
    private InstantService instantService;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restNavigationMockMvc;

    private Category category;

    private User user;

    private UserCategory userCategory;

    @BeforeEach
    public void initTest() {
        Library library = libraryRepository.saveAndFlush(LibraryResourceIT.createEntity(em));

        category = CategoryResourceIT.createEntity(em, library);
        categoryRepository.saveAndFlush(category);

        user = UserResourceIT.createEntity(em);
        user.setLogin("testuser");
        userRepository.saveAndFlush(user);

        userCategory = UserCategoryResourceIT.createEntity(em, user, category);
    }

    @Test
    void getAllPersonalNavigationsInBetweenValidTerm() throws Exception {
        // given
        BDDMockito.given(instantService.getCurrentTime()).willReturn(userCategory.getTermEnd().minusMillis(10));

        userCategoryRepository.saveAndFlush(userCategory);

        // when, then
        restNavigationMockMvc
            .perform(get(API_URL))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.[0].id").value(category.getId()))
            .andExpect(jsonPath("$.[0].title").value(category.getTitle()))
            .andExpect(jsonPath("$.[0].description").value(category.getDescription()));
    }
}
