package io.planit.cancerlibrary.web.rest;

import static org.hamcrest.Matchers.contains;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.domain.Item;
import io.planit.cancerlibrary.domain.Subject;
import io.planit.cancerlibrary.domain.Topic;
import io.planit.cancerlibrary.repository.CategoryRepository;
import io.planit.cancerlibrary.repository.GroupRepository;
import io.planit.cancerlibrary.repository.ItemRepository;
import io.planit.cancerlibrary.repository.SubjectRepository;
import io.planit.cancerlibrary.repository.TopicRepository;
import java.util.Arrays;
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
class ItemControllerIT {

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restDatasourceMockMvc;

    @Autowired
    private SubjectRepository subjectRepository;

    @Autowired
    private TopicRepository topicRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private GroupRepository groupRepository;

    @Autowired
    private ItemRepository itemRepository;

    private Category category;

    private final String DEFAULT_TABLE = "test_member";

    private final String DEFAULT_COLUMN_IDX = "idx";

    private final String DEFAULT_COLUMN_NAME = "name";

    private final String DEFAULT_COLUMN_BIRTH = "birth";

    private final String DEFAULT_COLUMN_CITY = "cty";

    private final String DEFAULT_COLUMN_GENDER = "gender";

    private final String[] DEFAULT_COLUMN_NAME_ARRAY = {"idx", "name", "birth", "city", "gender", "join_dt", "mail",
        "login_ip"};

    @BeforeEach
    void initTest() {
        Subject subject = SubjectResourceIT.createEntity(em);
        subjectRepository.saveAndFlush(subject);

        Topic topic = TopicResourceIT.createEntity(em, subject);
        topicRepository.saveAndFlush(topic);

        category = CategoryResourceIT.createEntity(em, topic).title(DEFAULT_TABLE);
        categoryRepository.saveAndFlush(category);
    }

    @Test
    @Transactional
    void testFetchColumnListByCategoryId() throws Exception {

        Arrays.stream(DEFAULT_COLUMN_NAME_ARRAY).forEach(columnName -> {
            Item item = new Item().category(category).title(columnName).activated(true);
            itemRepository.saveAndFlush(item);
        });

        restDatasourceMockMvc.perform(get("/api/items/usable-item-list").param("categoryId", category.getId().toString()))
            .andExpect(status().isOk()).andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].title").value(contains(DEFAULT_COLUMN_NAME_ARRAY)));
    }
}
