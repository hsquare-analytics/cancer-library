package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.*;
import io.planit.cancerlibrary.mapper.DatasourceMapper;
import io.planit.cancerlibrary.mapper.SQLAdapter;
import io.planit.cancerlibrary.repository.*;
import io.planit.cancerlibrary.service.SequenceGenerator;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.BDDMockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@IntegrationTest
@AutoConfigureMockMvc
@WithMockUser
class DatasourceControllerIT {

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
    private ItemRepository itemRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserCategoryRepository userCategoryRepository;

    @Autowired
    private DatasourceMapper datasourceMapper;

    @MockBean
    private SequenceGenerator sequenceGenerator;

    private Category category;

    private final String DEFAULT_TABLE = "ph_test";

    private final String DEFAULT_COLUMN_IDX = "idx";

    private final String DEFAULT_COLUMN_NAME = "name";

    private final String DEFAULT_COLUMN_BIRTH = "birth";

    private final String DEFAULT_COLUMN_CITY = "cty";

    private final String DEFAULT_COLUMN_GENDER = "gender";

    private final String[] DEFAULT_COLUMN_NAME_ARRAY = {"name", "birth", "city", "gender", "join_dt", "mail",
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
    void testDatasourceRowInsert() throws Exception {
        // given
        String sequence = "KCURE0000000001";
        BDDMockito.given(sequenceGenerator.getNextSequence()).willReturn(sequence);

        Arrays.stream(DEFAULT_COLUMN_NAME_ARRAY).forEach(columnName -> {
            Item item = new Item().category(category).title(columnName).activated(true);
            itemRepository.saveAndFlush(item);
        });

        // when, then
        restDatasourceMockMvc.perform(
                post("/api/datasource/categories/{categoryId}", category.getId()).contentType(
                    MediaType.APPLICATION_JSON).content("{\"name\":\"modified_zero\"}"))
            .andExpect(status().isOk());

        List<Map<String, Object>> result = datasourceMapper.executeSelectSQL(
            new SQLAdapter("select * from ph_test_updated where idx = '" + sequence + "'"));

        assertThat(result.get(0)).containsEntry("name", "modified_zero");
    }

    @Test
    @Transactional
    void testFetchDataByCategoryId() throws Exception {
        Item item = new Item().category(category).title(DEFAULT_COLUMN_NAME).activated(true);

        itemRepository.saveAndFlush(item);

        User user = UserResourceIT.createEntity(em);
        userRepository.saveAndFlush(user);
        UserCategory userCategory = new UserCategory().user(user).category(category).activated(true)
            .termStart(Instant.now().minus(30, ChronoUnit.DAYS)).termEnd(Instant.now().plus(30, ChronoUnit.DAYS));
        userCategoryRepository.saveAndFlush(userCategory);

        restDatasourceMockMvc.perform(get("/api/datasource/categories/{categoryId}", category.getId()).param("ptNo", "1"))
            .andExpect(status().isOk()).andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE));
    }

    @Test
    @Transactional
    void testDatasourceNotExistRowUpdate() throws Exception {
        Arrays.stream(DEFAULT_COLUMN_NAME_ARRAY).forEach(columnName -> {
            Item item = new Item().category(category).title(columnName).activated(true);
            itemRepository.saveAndFlush(item);
        });

        restDatasourceMockMvc.perform(
                put("/api/datasource/categories/{categoryId}", category.getId()).contentType(
                    MediaType.APPLICATION_JSON).content("{\"idx\":\"10001\",\"name\":\"modified_zero\"}"))
            .andExpect(status().isOk());

        List<Map<String, Object>> result = datasourceMapper.executeSelectSQL(
            new SQLAdapter("select * from ph_test_updated where idx = 10001"));

        assertThat(result).hasSize(1);
        assertThat(result.get(0)).containsEntry("name", "modified_zero");
    }

    @Test
    @Transactional
    void testDatasourceExistRowUpdate() throws Exception {
        datasourceMapper.executeSelectSQL(
            new SQLAdapter("insert into ph_test_updated (idx, name) values (10001, 'zero')"));

        Arrays.stream(DEFAULT_COLUMN_NAME_ARRAY).forEach(columnName -> {
            Item item = new Item().category(category).title(columnName).activated(true);
            itemRepository.saveAndFlush(item);
        });

        User user = UserResourceIT.createEntity(em);
        userRepository.saveAndFlush(user);
        UserCategory userCategory = new UserCategory().user(user).category(category).activated(true)
            .termStart(Instant.now().minus(30, ChronoUnit.DAYS)).termEnd(Instant.now().plus(30, ChronoUnit.DAYS));
        userCategoryRepository.saveAndFlush(userCategory);

        restDatasourceMockMvc.perform(
                put("/api/datasource/categories/{categoryId}", category.getId()).contentType(
                    MediaType.APPLICATION_JSON).content("{\"idx\":\"10001\",\"name\":\"modified_zero\"}"))
            .andExpect(status().isOk());

        List<Map<String, Object>> result = datasourceMapper.executeSelectSQL(
            new SQLAdapter("select * from ph_test_updated where idx = 10001"));

        // todo: mybatis transaction 처리 안됨...
//        assertThat(result.size()).isEqualTo(1);
        assertThat(result.get(0)).containsEntry("name", "modified_zero");
    }


    @Test
    @Transactional
    void testGetOriginalDatasourceRow() throws Exception {
        // given
        datasourceMapper.executeSelectSQL(new SQLAdapter("insert into ph_test (idx, name) values (10001, 'zero')"));

        // then
        restDatasourceMockMvc.perform(
                get("/api/datasource/categories/{categoryId}/row/{rowIdx}", category.getId(), 10001))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.idx").value("10001"))
            .andExpect(jsonPath("$.name").value("zero"));
        ;

    }
}
