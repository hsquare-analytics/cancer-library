package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.domain.Subject;
import io.planit.cancerlibrary.domain.Topic;
import io.planit.cancerlibrary.repository.CategoryRepository;
import io.planit.cancerlibrary.repository.SubjectRepository;
import io.planit.cancerlibrary.repository.TopicRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.cache.CacheManager;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@IntegrationTest
@AutoConfigureMockMvc
@WithMockUser
class CategoryControllerIT {

    private static final String API_URL = "/api/categories/usable-category-list";

    @Autowired
    private SubjectRepository subjectRepository;

    @Autowired
    private TopicRepository topicRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restNavigationMockMvc;

    private Topic topic;

    @Autowired
    private CacheManager cacheManager;

    @BeforeEach
    public void initTest() {

        cacheManager.getCache(CategoryRepository.CATEGORIES_BY_ACTIVATED_TRUE_CACHE).clear();

        Subject subject = SubjectResourceIT.createEntity(em);
        subjectRepository.saveAndFlush(subject);

        topic = TopicResourceIT.createEntity(em, subject);
        topicRepository.saveAndFlush(topic);
    }

    @Test
    @Transactional
    void testGetActiveUserCategory() throws Exception {
        // given
        Category category = CategoryResourceIT.createEntity(em, topic).activated(true);
        categoryRepository.saveAndFlush(category);

        // when, then
        restNavigationMockMvc
            .perform(get(API_URL))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.[0].id").value(category.getId()))
            .andExpect(jsonPath("$.[0].title").value(category.getTitle()))
            .andExpect(jsonPath("$.[0].description").value(category.getDescription()));
    }

    @Test
    @Transactional
    void testCategoryDeficiencyException() throws Exception {
        restNavigationMockMvc
            .perform(get(API_URL))
            .andExpect(status().isBadRequest())
            .andExpect(header().string("X-cancerlibraryApp-error", "error.abnormalSetup"))
            .andExpect(header().string("X-cancerlibraryApp-params", "setup"))
            .andExpect(jsonPath("title").value("There is abnormal setup"))
        ;
    }

}
