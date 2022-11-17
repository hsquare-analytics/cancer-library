package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.*;
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
    private SqlExecutor sqlExecutor;

    @MockBean
    private SequenceGenerator sequenceGenerator;

    private Category category;

    private final String DEFAULT_TABLE = "ph_test";

    private final String DEFAULT_COLUMN_IDX = "idx";

    private final String DEFAULT_COLUMN_NAME = "name";

    private final String DEFAULT_COLUMN_BIRTH = "birth";

    private final String DEFAULT_COLUMN_CITY = "city";

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

        itemRepository.saveAndFlush(new Item().category(category).title("pt_no").activated(true));
        Arrays.stream(DEFAULT_COLUMN_NAME_ARRAY).forEach(columnName -> {
            Item item = new Item().category(category).title(columnName).activated(true);
            itemRepository.saveAndFlush(item);
        });

        // when, then
        restDatasourceMockMvc.perform(
                post("/api/datasource/categories/{categoryId}/rows", category.getId()).contentType(
                    MediaType.APPLICATION_JSON).content("{\"pt_no\": \"test\", \"name\":\"modified_zero\"}"))
            .andExpect(status().isOk());

        List<Map<String, Object>> result = sqlExecutor.executeSelectAll(
            "select * from ph_test_updated where idx = '" + sequence + "'");

        assertThat(result.get(0)).containsEntry("name", "modified_zero");
    }

    @Test
    @Transactional
    void testFetchDatasourceOfPatient() throws Exception {
        Item item = new Item().category(category).title(DEFAULT_COLUMN_NAME).activated(true);

        itemRepository.saveAndFlush(item);

        User user = UserResourceIT.createEntity(em);
        userRepository.saveAndFlush(user);
        UserCategory userCategory = new UserCategory().user(user).category(category).activated(true)
            .termStart(Instant.now().minus(30, ChronoUnit.DAYS)).termEnd(Instant.now().plus(30, ChronoUnit.DAYS));
        userCategoryRepository.saveAndFlush(userCategory);

        restDatasourceMockMvc.perform(get("/api/datasource/categories/{categoryId}/rows", category.getId()).param("ptNo", "1"))
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
                put("/api/datasource/categories/{categoryId}/rows/{rowId}", category.getId(), 10001).contentType(
                    MediaType.APPLICATION_JSON).content("{\"name\":\"modified_zero\"}"))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$").value(false));

        List<Map<String, Object>> result = sqlExecutor.executeSelectAll("select * from ph_test_updated where idx = 10001");

        assertThat(result).isEmpty();
    }

    @Test
    @Transactional
    void testDatasourceExistRowUpdate() throws Exception {
        sqlExecutor.executeDML("insert into ph_test_updated (idx, name) values ('10001', 'zero')");

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
                put("/api/datasource/categories/{categoryId}/rows/{rowId}", category.getId(), 10001).contentType(
                    MediaType.APPLICATION_JSON).content("{\"name\":\"modified_zero\"}"))
            .andExpect(status().isOk());

        List<Map<String, Object>> result = sqlExecutor.executeSelectAll(
            "select * from ph_test_updated where idx = '10001'");

        // todo: mybatis transaction 처리 안됨...
//        assertThat(result.size()).isEqualTo(1);
        assertThat(result.get(0)).containsEntry("name", "modified_zero");
    }


    @Test
    @Transactional
    void testGetDatasourceOriginRow() throws Exception {
        // given
        sqlExecutor.executeDML("insert into ph_test (idx, name) values (10001, 'zero')");

        // then
        restDatasourceMockMvc.perform(
                get("/api/datasource/categories/{categoryId}/rows/{rowId}", category.getId(), 10001))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.idx").value("10001"))
            .andExpect(jsonPath("$.name").value("zero"));
    }

    @Test
    @Transactional
    void testCheckDatasourceUpdatedRowExist() throws Exception {
        // given
        sqlExecutor.executeDML("insert into ph_test_updated (idx, name) values (10001, 'zero')");

        // then
        restDatasourceMockMvc.perform(
                get("/api/datasource/categories/{categoryId}/rows/{rowId}/check-updated-row-exist", category.getId(), 10001))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$").value(true));
    }

    @Test
    @Transactional
    void testCheckDatasourceUpdatedRowNonExist() throws Exception {
        // then
        restDatasourceMockMvc.perform(
                get("/api/datasource/categories/{categoryId}/rows/{rowId}/check-updated-row-exist", category.getId(), 10001))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$").value(false));
    }

    @Test
    @Transactional
    void testDeleteDatasourceRow() throws Exception {
        // given
        sqlExecutor.executeDML("insert into ph_test_updated (idx, name) values (10001, 'zero')");

        // then
        restDatasourceMockMvc.perform(
                delete("/api/datasource/categories/{categoryId}/rows/{rowId}", category.getId(), 10001))
            .andExpect(status().isOk());

        List<Map<String, Object>> result = sqlExecutor.executeSelectAll(
            "select * from ph_test_updated where idx = '10001'");

        assertThat(result).isEmpty();
    }
}
