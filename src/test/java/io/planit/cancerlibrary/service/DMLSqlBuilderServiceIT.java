package io.planit.cancerlibrary.service;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.*;
import io.planit.cancerlibrary.repository.*;
import io.planit.cancerlibrary.web.rest.CategoryResourceIT;
import io.planit.cancerlibrary.web.rest.SubjectResourceIT;
import io.planit.cancerlibrary.web.rest.TopicResourceIT;
import io.planit.cancerlibrary.web.rest.UserResourceIT;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.BDDMockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.HashMap;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

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
    void testInsertSql() {
        Timestamp timestamp = Timestamp.from(Instant.now());
        // given
        BDDMockito.given(timeService.getCurrentTimestamp()).willReturn(timestamp);
        User user = UserResourceIT.createEntity(em);
        user.setLogin("test_login");
        userRepository.saveAndFlush(user);

        Item item1 = new Item().category(category).title("pt_no").activated(true);
        Item item2 = new Item().category(category).title("column1").activated(true);
        Item item3 = new Item().category(category).title("column2").activated(true);

        itemRepository.saveAndFlush(item1);
        itemRepository.saveAndFlush(item2);
        itemRepository.saveAndFlush(item3);

        // when
        String result = dmlSqlBuilderService.getInsertSQL(category.getId(), new HashMap<>() {{
            put("pt_no", "pt_no_test");
            put("idx", "idx_test");
            put("column1", "test1");
            put("column2", "test2");
        }});

        // then
        assertThat(result).contains("INSERT INTO " + category.getTitle() + "_UPDATED")
            .contains("(IDX, PT_NO, COLUMN1, COLUMN2, CREATED_BY, CREATED_DATE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, STATUS)")
            .contains(String.format("VALUES ('idx_test', 'pt_no_test', 'test1', 'test2', 'test_login', '%s', 'test_login', '%s', 'REVIEW_SUBMITTED')", timestamp, timestamp));
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
        assertThat(result).contains("SELECT *").contains(String.format("FROM %s", category.getTitle() + "_UPDATED"))
            .contains("WHERE (IDX = 'test_idx')");
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
        assertThat(result).contains("SELECT *").contains(String.format("FROM %s", category.getTitle()))
            .contains("WHERE (IDX = 'test_idx')");
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
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        // given
        BDDMockito.given(timeService.getCurrentTimestamp()).willReturn(timestamp);
        User user = UserResourceIT.createEntity(em);
        user.setLogin("test_login");
        userRepository.saveAndFlush(user);

        Item item1 = new Item().category(category).title("column1").activated(true);
        Item item2 = new Item().category(category).title("column2").activated(true);

        itemRepository.saveAndFlush(item1);
        itemRepository.saveAndFlush(item2);

        // when
        String result = dmlSqlBuilderService.getUpdateSQL(category.getId(), new HashMap<>() {{
            put("idx", "test_idx");
            put("column1", "test1");
            put("column2", "test2");
            put("status", "STATUS_APPROVED");
        }});

        // then
        assertThat(result).contains("UPDATE " + category.getTitle() + "_UPDATED")
            .contains(String.format("SET COLUMN1 = 'test1', COLUMN2 = 'test2', LAST_MODIFIED_BY = 'test_login', LAST_MODIFIED_DATE = '%s', STATUS = 'STATUS_APPROVED'", timestamp))
            .contains("WHERE (IDX = 'test_idx')");
    }


    @Test
    @Transactional
    public void testDeleteSql() {
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
        assertThat(result).contains("DELETE FROM " + category.getTitle() + "_UPDATED");
        assertThat(result).contains("WHERE (IDX = 'test_idx')");
    }

    @Test
    @Transactional
    @WithMockUser
    void testInsertSqlConfigurationException() {
        HashMap param = new HashMap<>() {{
            put("idx", "idx_test");
            put("column1", "test1");
        }};
        assertThatThrownBy(() -> dmlSqlBuilderService.getInsertSQL(99999L, param)).isInstanceOf(
            SetupDeficiencyException.class);
    }

    @Test
    @Transactional
    @WithMockUser
    void testReadSqlConfigurationException() {
        HashMap param = new HashMap<>() {{
            put("idx", "idx_test");
            put("column1", "test1");
        }};
        assertThatThrownBy(() -> dmlSqlBuilderService.getReadUpdatedRowSQL(99999L, param)).isInstanceOf(
            SetupDeficiencyException.class);
    }

    @Test
    @Transactional
    @WithMockUser
    void testReadAllSqlConfigurationException() {
        assertThatThrownBy(() -> dmlSqlBuilderService.getReadAllSQL(99999L)).isInstanceOf(
            SetupDeficiencyException.class);
    }

    @Test
    @Transactional
    @WithMockUser
    void testUpdateSqlConfigurationException() {
        HashMap param = new HashMap<>() {{
            put("idx", "idx_test");
            put("column1", "test1");
        }};
        assertThatThrownBy(() -> dmlSqlBuilderService.getUpdateSQL(99999L, param)).isInstanceOf(
            SetupDeficiencyException.class);
    }

    @Test
    @Transactional
    @WithMockUser
    void testDeleteSqlConfigurationException() {
        HashMap param = new HashMap<>() {{
            put("idx", "idx_test");
            put("column1", "test1");
        }};
        assertThatThrownBy(() -> dmlSqlBuilderService.getDeleteSQL(99999L, param)).isInstanceOf(
            SetupDeficiencyException.class);
    }
}

