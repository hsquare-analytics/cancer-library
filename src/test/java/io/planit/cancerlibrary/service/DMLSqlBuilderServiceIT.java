package io.planit.cancerlibrary.service;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.*;
import io.planit.cancerlibrary.domain.embedded.ItemAttribute;
import io.planit.cancerlibrary.domain.embedded.ItemProperty;
import io.planit.cancerlibrary.domain.embedded.Lookup;
import io.planit.cancerlibrary.repository.*;
import io.planit.cancerlibrary.web.rest.CategoryResourceIT;
import io.planit.cancerlibrary.web.rest.SubjectResourceIT;
import io.planit.cancerlibrary.web.rest.TopicResourceIT;
import io.planit.cancerlibrary.web.rest.UserResourceIT;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.mockito.BDDMockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.anyString;

@IntegrationTest
class DMLSqlBuilderServiceIT {

    @Autowired
    private EntityManager em;

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
    private DMLSqlBuilderService dmlSqlBuilderService;

    private Category category;

    @Autowired
    private CodebookRepository codebookRepository;

    @MockBean
    TimeService timeService;

    @BeforeEach
    void initTest() {
        Subject subject = SubjectResourceIT.createEntity(em);
        subjectRepository.saveAndFlush(subject);

        Topic topic = TopicResourceIT.createEntity(em, subject);
        topicRepository.saveAndFlush(topic);

        category = CategoryResourceIT.createEntity(em, topic);
        categoryRepository.saveAndFlush(category);
    }

    @Test
    @Transactional
    @WithMockUser(username = "test_login", authorities = "ROLE_USER")
    void test_insert_sql() {
        Timestamp timestamp = Timestamp.from(Instant.now());
        // given
        BDDMockito.given(timeService.getCurrentTimestamp()).willReturn(timestamp);
        BDDMockito.given(timeService.convertTimezoneStringToTimestamp(anyString())).willReturn(timestamp);

        User user = UserResourceIT.createEntity(em);
        user.setLogin("test_login");
        userRepository.saveAndFlush(user);

        Item item1 = new Item().category(category).title("pt_no").activated(true);
        Item item2 = new Item().category(category).title("column1").activated(true);
        Item item3 = new Item().category(category).title("column2").activated(true);

        Item dateColumn = new Item().category(category).title("column3").activated(true).attribute(new ItemAttribute().caption("date_column").required(true).dataType("date"));

        Codebook codebook = new Codebook().title("codebook1").lookupList(List.of(new Lookup().title("codebook-title").description("codebook-value")));
        codebookRepository.saveAndFlush(codebook);
        Item item4 = new Item().category(category).title("column4-value").activated(true)
            .attribute(new ItemAttribute().caption("test").required(true).dataType("selectbox"))
            .property(new ItemProperty().labelColumn("column4-label")).codebook(codebook);

        itemRepository.saveAndFlush(item1);
        itemRepository.saveAndFlush(item2);
        itemRepository.saveAndFlush(item3);
        itemRepository.saveAndFlush(dateColumn);
        itemRepository.saveAndFlush(item4);

        // when
        String result = dmlSqlBuilderService.getInsertSQL(category.getId(), new HashMap<>() {{
            put("pt_no", "pt_no_test");
            put("idx", "idx_test");
            put("column1", "test1");
            put("column2", "test2");
            put("column3", timestamp.toString());
            put("column4-value", "codebook-value");
        }});

        // then
        assertThat(result).contains("INSERT INTO " + category.getTitle() + "_UPDATED")
            .contains("(IDX, PT_NO, COLUMN1, COLUMN2, COLUMN3, COLUMN4-VALUE, COLUMN4-LABEL, CREATED_BY, CREATED_DATE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE)")
            .contains(String.format("VALUES ('idx_test', 'pt_no_test', 'test1', 'test2', '%s', 'codebook-value', 'codebook-title', 'test_login', '%s', 'test_login', '%s')", timestamp, timestamp, timestamp));
    }

    @ParameterizedTest
    @Transactional
    @WithMockUser
    @ValueSource(strings = {"idx", "pt_no"})
    void test_insert_sql_parameter_parameter_deficiency_exception(String requiredParam) {
        Long categoryId = category.getId();
        HashMap<String, Object> params = new HashMap<>() {{
            put("idx", "idx_test");
            put("pt_no", "idx_test");
            put("column1", "test1");
            put("column2", "test2");
        }};

        params.remove(requiredParam);
        assertThatThrownBy(() -> dmlSqlBuilderService.getInsertSQL(categoryId, params)).isInstanceOf(ParameterDeficiencyException.class);
    }

    @Test
    @Transactional
    void testReadUpdatedRowSql() {
        // given
        User user = UserResourceIT.createEntity(em);
        userRepository.saveAndFlush(user);

        Item item1 = new Item().category(category).title("column1").activated(true);
        Item item2 = new Item().category(category).title("column2").activated(true);

        itemRepository.saveAndFlush(item1);
        itemRepository.saveAndFlush(item2);

        // when
        String result = dmlSqlBuilderService.getReadUpdatedRowSQL(category.getId(), new HashMap<>() {{
            put("idx", "test_idx");
        }});

        // then
        assertThat(result).contains("SELECT *").contains(String.format("FROM %s", category.getTitle() + "_UPDATED")).contains("WHERE (IDX = 'test_idx')");
    }

    @Test
    @Transactional
    void testReadOriginRowSQL() {
        // given
        User user = UserResourceIT.createEntity(em);
        userRepository.saveAndFlush(user);

        Item item1 = new Item().category(category).title("column1").activated(true);
        Item item2 = new Item().category(category).title("column2").activated(true);

        itemRepository.saveAndFlush(item1);
        itemRepository.saveAndFlush(item2);

        // when
        String result = dmlSqlBuilderService.getReadOriginRowSQL(category.getId(), new HashMap<>() {{
            put("idx", "test_idx");
        }});

        // then
        assertThat(result).contains("SELECT *").contains(String.format("FROM %s", category.getTitle())).contains("WHERE (IDX = 'test_idx')");
    }


    @Test
    @Transactional
    void testReadAllSql() {
        // when
        String result = dmlSqlBuilderService.getReadAllSQL(category.getId());

        // then
        assertThat(result).contains("SELECT *").contains(String.format("FROM %s", category.getTitle() + "_UPDATED"));
    }

    @Test
    @Transactional
    @WithMockUser(username = "test_login", authorities = "ROLE_USER")
    void testUpdateSql() {
        Timestamp timestamp = Timestamp.from(Instant.now());
        // given
        BDDMockito.given(timeService.getCurrentTimestamp()).willReturn(timestamp);
        BDDMockito.given(timeService.convertTimezoneStringToTimestamp(anyString())).willReturn(timestamp);

        User user = UserResourceIT.createEntity(em);
        user.setLogin("test_login");
        userRepository.saveAndFlush(user);

        Item item1 = new Item().category(category).title("column1").activated(true);
        Item item2 = new Item().category(category).title("column2").activated(true);
        Item dateColumn = new Item().category(category).title("column3").activated(true).attribute(new ItemAttribute().caption("date_column").required(true).dataType("date"));

        Codebook codebook = new Codebook().title("codebook1").lookupList(List.of(new Lookup().title("codebook-title").description("codebook-value")));
        codebookRepository.saveAndFlush(codebook);
        Item item4 = new Item().category(category).title("column4-value").activated(true)
            .attribute(new ItemAttribute().caption("test").required(true).dataType("selectbox"))
            .property(new ItemProperty().labelColumn("column4-label")).codebook(codebook);

        itemRepository.saveAndFlush(item1);
        itemRepository.saveAndFlush(item2);
        itemRepository.saveAndFlush(dateColumn);
        itemRepository.saveAndFlush(item4);

        // when
        String result = dmlSqlBuilderService.getUpdateSQL(category.getId(), new HashMap<>() {{
            put("idx", "test_idx");
            put("column1", "test1");
            put("column2", "test2");
            put("column3", timestamp.toString());
            put("column4-value", "codebook-value");
        }});

        // then
        assertThat(result).contains("UPDATE " + category.getTitle() + "_UPDATED")
            .contains(String.format("SET COLUMN1 = 'test1', COLUMN2 = 'test2', COLUMN3 = '%s', COLUMN4-VALUE = 'codebook-value', COLUMN4-LABEL = 'codebook-title', LAST_MODIFIED_BY = 'test_login', LAST_MODIFIED_DATE = '%s'", timestamp, timestamp)).contains("WHERE (IDX = 'test_idx')");
    }

    @Test
    @Transactional
    @WithMockUser
    void test_update_sql_idx_deficiency_exception() {
        Long categoryId = category.getId();
        HashMap<String, Object> params = new HashMap<>() {{
            put("pt_no", "idx_test");
            put("column1", "test1");
            put("column2", "test2");
        }};
        assertThatThrownBy(() -> dmlSqlBuilderService.getInsertSQL(categoryId, params)).isInstanceOf(ParameterDeficiencyException.class);
    }

    @Test
    @Transactional
    void testDeleteSql() {
        // given
        User user = UserResourceIT.createEntity(em);
        userRepository.saveAndFlush(user);

        Item item1 = new Item().category(category).title("column1").activated(true);
        Item item2 = new Item().category(category).title("column2").activated(true);

        itemRepository.saveAndFlush(item1);
        itemRepository.saveAndFlush(item2);

        // when
        String result = dmlSqlBuilderService.getDeleteSQL(category.getId(), new HashMap<>() {{
            put("idx", "test_idx");
        }});

        // then
        assertThat(result).contains("DELETE FROM " + category.getTitle() + "_UPDATED").contains("WHERE (IDX = 'test_idx')");
    }

    @Test
    @Transactional
    @WithMockUser
    void testInsertSqlConfigurationException() {
        Map<String, Object> param = new HashMap<>() {{
            put("idx", "idx_test");
            put("column1", "test1");
        }};
        assertThatThrownBy(() -> dmlSqlBuilderService.getInsertSQL(99999L, param)).isInstanceOf(SetupDeficiencyException.class);
    }

    @Test
    @Transactional
    @WithMockUser
    void testReadSqlConfigurationException() {
        Map<String, Object> param = new HashMap<>() {{
            put("idx", "idx_test");
            put("column1", "test1");
        }};
        assertThatThrownBy(() -> dmlSqlBuilderService.getReadUpdatedRowSQL(99999L, param)).isInstanceOf(SetupDeficiencyException.class);
    }

    @Test
    @Transactional
    @WithMockUser
    void testReadAllSqlConfigurationException() {
        assertThatThrownBy(() -> dmlSqlBuilderService.getReadAllSQL(99999L)).isInstanceOf(SetupDeficiencyException.class);
    }

    @Test
    @Transactional
    @WithMockUser
    void testUpdateSqlConfigurationException() {
        Map<String, Object> param = new HashMap<>() {{
            put("idx", "idx_test");
            put("column1", "test1");
        }};
        assertThatThrownBy(() -> dmlSqlBuilderService.getUpdateSQL(99999L, param)).isInstanceOf(SetupDeficiencyException.class);
    }

    @Test
    @Transactional
    @WithMockUser
    void testDeleteSqlConfigurationException() {
        Map<String, Object> param = new HashMap<>() {{
            put("idx", "idx_test");
            put("column1", "test1");
        }};
        assertThatThrownBy(() -> dmlSqlBuilderService.getDeleteSQL(99999L, param)).isInstanceOf(SetupDeficiencyException.class);
    }
}

