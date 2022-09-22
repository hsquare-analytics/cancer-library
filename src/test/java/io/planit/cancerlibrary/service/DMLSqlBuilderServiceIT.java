package io.planit.cancerlibrary.service;

import static org.assertj.core.api.Assertions.assertThat;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.domain.Group;
import io.planit.cancerlibrary.domain.Item;
import io.planit.cancerlibrary.domain.Subject;
import io.planit.cancerlibrary.domain.Topic;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.repository.CategoryRepository;
import io.planit.cancerlibrary.repository.GroupRepository;
import io.planit.cancerlibrary.repository.ItemRepository;
import io.planit.cancerlibrary.repository.SubjectRepository;
import io.planit.cancerlibrary.repository.TopicRepository;
import io.planit.cancerlibrary.repository.UserRepository;
import io.planit.cancerlibrary.web.rest.CategoryResourceIT;
import io.planit.cancerlibrary.web.rest.GroupResourceIT;
import io.planit.cancerlibrary.web.rest.SubjectResourceIT;
import io.planit.cancerlibrary.web.rest.TopicResourceIT;
import io.planit.cancerlibrary.web.rest.UserResourceIT;
import java.time.Instant;
import java.util.HashMap;
import javax.persistence.EntityManager;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.BDDMockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.transaction.annotation.Transactional;

@IntegrationTest
public class DMLSqlBuilderServiceIT {

    @Autowired
    private EntityManager em;

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
    private DMLSqlBuilderService dmlSqlBuilderService;

    private Category category;

    private Group group;

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

        group = GroupResourceIT.createEntity(em, category);
        groupRepository.saveAndFlush(group);
    }

    @Test
    @Transactional
    @WithMockUser(username = "test_login", authorities = "ROLE_USER")
    public void testInsertSql() {
        // given
        BDDMockito.given(timeService.getCurrentTime()).willReturn(Instant.parse("2020-01-01T00:00:00Z"));
        User user = UserResourceIT.createEntity(em);
        user.setLogin("test_login");
        userRepository.saveAndFlush(user);

        Item item1 = new Item().group(group).title("column1").activated(true);
        Item item2 = new Item().group(group).title("column2").activated(true);

        itemRepository.saveAndFlush(item1);
        itemRepository.saveAndFlush(item2);

        // when
        String result = dmlSqlBuilderService.getInsertSQL(category.getId(), new HashMap<>() {{
            put("column1", "test1");
            put("column2", "test2");
        }}).toString();

        // then
        assertThat(result).contains("INSERT INTO " + category.getTitle() + "_updated");
        assertThat(result).contains(
            "(COLUMN1, COLUMN2, CREATED_BY, CREATED_DATE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, STATUS)");
        assertThat(result).contains(
            "VALUES ('test1', 'test2', 'test_login', '2020-01-01T00:00:00Z', 'test_login', '2020-01-01T00:00:00Z', 'STATUS_PENDING')");
    }

    @Test
    @Transactional
    public void testReadSql() {
        // given
        User user = UserResourceIT.createEntity(em);
        userRepository.saveAndFlush(user);

        Item item1 = new Item().group(group).title("column1").activated(true);
        Item item2 = new Item().group(group).title("column2").activated(true);

        itemRepository.saveAndFlush(item1);
        itemRepository.saveAndFlush(item2);

        // when
        String result = dmlSqlBuilderService.getReadSQL(category.getId(), new HashMap<>() {{
            put("idx", "test_idx");
        }}).toString();

        // then
        assertThat(result).contains("SELECT *");
        assertThat(result).contains(String.format("FROM %s" , category.getTitle() + "_UPDATED"));
        assertThat(result).contains("WHERE (IDX = 'test_idx')");
    }

    @Test
    @Transactional
    @WithMockUser(username = "test_login", authorities = "ROLE_USER")
    public void testUpdateSql() {
        // given
        BDDMockito.given(timeService.getCurrentTime()).willReturn(Instant.parse("2020-01-01T00:00:00Z"));
        User user = UserResourceIT.createEntity(em);
        user.setLogin("test_login");
        userRepository.saveAndFlush(user);

        Item item1 = new Item().group(group).title("column1").activated(true);
        Item item2 = new Item().group(group).title("column2").activated(true);

        itemRepository.saveAndFlush(item1);
        itemRepository.saveAndFlush(item2);

        // when
        String result = dmlSqlBuilderService.getUpdateSQL(category.getId(), new HashMap<>() {{
            put("idx", "test_idx");
            put("column1", "test1");
            put("column2", "test2");
            put("status", "STATUS_APPROVED");
        }}).toString();

        // then
        assertThat(result).contains("UPDATE " + category.getTitle() + "_updated");
        assertThat(result).contains("SET COLUMN1 = 'test1', COLUMN2 = 'test2', LAST_MODIFIED_BY = 'test_login', LAST_MODIFIED_DATE = '2020-01-01T00:00:00Z', STATUS = 'STATUS_APPROVED'");
        assertThat(result).contains("WHERE (IDX = 'test_idx')");
    }
}

