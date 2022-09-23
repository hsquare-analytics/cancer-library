package io.planit.cancerlibrary.web.rest;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.domain.Group;
import io.planit.cancerlibrary.domain.Item;
import io.planit.cancerlibrary.domain.Subject;
import io.planit.cancerlibrary.domain.Topic;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.domain.UserCategory;
import io.planit.cancerlibrary.mapper.DatasourceMapper;
import io.planit.cancerlibrary.mapper.SQLAdapter;
import io.planit.cancerlibrary.repository.CategoryRepository;
import io.planit.cancerlibrary.repository.GroupRepository;
import io.planit.cancerlibrary.repository.ItemRepository;
import io.planit.cancerlibrary.repository.SubjectRepository;
import io.planit.cancerlibrary.repository.TopicRepository;
import io.planit.cancerlibrary.repository.UserCategoryRepository;
import io.planit.cancerlibrary.repository.UserRepository;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
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
public class DatasourceEditorControllerIT {

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

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserCategoryRepository userCategoryRepository;

    @Autowired
    private DatasourceMapper datasourceMapper;

    private Category category;

    private Group group;

    private String DEFAULT_TABLE = "test_member";

    private String DEFAULT_COLUMN_IDX = "idx";

    private String DEFAULT_COLUMN_NAME = "name";

    private String DEFAULT_COLUMN_BIRTH = "birth";

    private String DEFAULT_COLUMN_CITY = "cty";

    private String DEFAULT_COLUMN_GENDER = "gender";

    private String[] DEFAULT_COLUMN_NAME_ARRAY = {"idx", "name", "birth", "city", "gender", "join_dt", "mail",
        "login_ip"};

    @BeforeEach
    void initTest() {
        Subject subject = SubjectResourceIT.createEntity(em);
        subjectRepository.saveAndFlush(subject);

        Topic topic = TopicResourceIT.createEntity(em, subject);
        topicRepository.saveAndFlush(topic);

        category = CategoryResourceIT.createEntity(em, topic).title(DEFAULT_TABLE);
        categoryRepository.saveAndFlush(category);

        group = GroupResourceIT.createEntity(em, category);
        groupRepository.saveAndFlush(group);
    }

    @Test
    @Transactional
    public void testFetchDataByCategoryId() throws Exception {
        Item item1 = new Item().group(group).title(DEFAULT_COLUMN_IDX).activated(true);
        Item item2 = new Item().group(group).title(DEFAULT_COLUMN_NAME).activated(true);

        itemRepository.saveAndFlush(item1);
        itemRepository.saveAndFlush(item2);

        User user = UserResourceIT.createEntity(em);
        userRepository.saveAndFlush(user);
        UserCategory userCategory = new UserCategory().user(user).category(category).activated(true)
            .termStart(Instant.now().minus(30, ChronoUnit.DAYS)).termEnd(Instant.now().plus(30, ChronoUnit.DAYS));
        userCategoryRepository.saveAndFlush(userCategory);

        restDatasourceMockMvc.perform(get("/api/datasource-editor/categories/{categoryDd}", category.getId())).andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE));
    }

    @Test
    @Transactional
    public void testDatasourceRowInsert() throws Exception {
        Arrays.stream(DEFAULT_COLUMN_NAME_ARRAY).forEach(columnName -> {
            Item item = new Item().group(group).title(columnName).activated(true);
            itemRepository.saveAndFlush(item);
        });

        User user = UserResourceIT.createEntity(em);
        userRepository.saveAndFlush(user);
        UserCategory userCategory = new UserCategory().user(user).category(category).activated(true)
            .termStart(Instant.now().minus(30, ChronoUnit.DAYS)).termEnd(Instant.now().plus(30, ChronoUnit.DAYS));
        userCategoryRepository.saveAndFlush(userCategory);

        restDatasourceMockMvc.perform(
                post("/api/datasource-editor/categories/{categoryId}", category.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content("{\"idx\":\"10001\",\"name\":\"modified_zero\"}"))
            .andExpect(status().isOk());

        List<Map> result = datasourceMapper.executeSelectSQL(new SQLAdapter("select * from test_member_updated where idx = 10001"));

        assertThat(result.size()).isEqualTo(1);
        assertThat(result.get(0).get("name")).isEqualTo("modified_zero");
    }

    @Test
    @Transactional
    public void testDatasourceRowUpdate() throws Exception{
        datasourceMapper.executeSelectSQL(new SQLAdapter("insert into test_member_updated (idx, name) values (10001, 'zero')"));

        Arrays.stream(DEFAULT_COLUMN_NAME_ARRAY).forEach(columnName -> {
            Item item = new Item().group(group).title(columnName).activated(true);
            itemRepository.saveAndFlush(item);
        });

        User user = UserResourceIT.createEntity(em);
        userRepository.saveAndFlush(user);
        UserCategory userCategory = new UserCategory().user(user).category(category).activated(true)
            .termStart(Instant.now().minus(30, ChronoUnit.DAYS)).termEnd(Instant.now().plus(30, ChronoUnit.DAYS));
        userCategoryRepository.saveAndFlush(userCategory);

        restDatasourceMockMvc.perform(
                post("/api/datasource-editor/categories/{categoryId}", category.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content("{\"idx\":\"10001\",\"name\":\"modified_zero\"}"))
            .andExpect(status().isOk());

        List<Map> result = datasourceMapper.executeSelectSQL(new SQLAdapter("select * from test_member_updated where idx = 10001"));

        assertThat(result.size()).isEqualTo(1);
        assertThat(result.get(0).get("name")).isEqualTo("modified_zero");
    }
}
