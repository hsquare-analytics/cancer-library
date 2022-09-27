package io.planit.cancerlibrary.service;

import static org.assertj.core.api.Assertions.assertThat;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.constant.DatasourceConstants;
import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.domain.Group;
import io.planit.cancerlibrary.domain.Item;
import io.planit.cancerlibrary.domain.Subject;
import io.planit.cancerlibrary.domain.Topic;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.domain.UserCategory;
import io.planit.cancerlibrary.repository.CategoryRepository;
import io.planit.cancerlibrary.repository.GroupRepository;
import io.planit.cancerlibrary.repository.ItemRepository;
import io.planit.cancerlibrary.repository.SubjectRepository;
import io.planit.cancerlibrary.repository.TopicRepository;
import io.planit.cancerlibrary.repository.UserCategoryRepository;
import io.planit.cancerlibrary.repository.UserRepository;
import io.planit.cancerlibrary.web.rest.CategoryResourceIT;
import io.planit.cancerlibrary.web.rest.GroupResourceIT;
import io.planit.cancerlibrary.web.rest.SubjectResourceIT;
import io.planit.cancerlibrary.web.rest.TopicResourceIT;
import io.planit.cancerlibrary.web.rest.UserResourceIT;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import javax.persistence.EntityManager;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.transaction.annotation.Transactional;

@IntegrationTest
class UnionSqlBuilderServiceIT {

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
    private UserCategoryRepository userCategoryRepository;

    @Autowired
    private UnionSqlBuilderService unionSqlBuilderService;

    private Category category;

    private Group group;

    private Item item1;

    private Item item2;

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

        item1 = new Item().group(group).title("column1").activated(true);
        item2 = new Item().group(group).title("column2").activated(true);

        itemRepository.saveAndFlush(item1);
        itemRepository.saveAndFlush(item2);
    }

    private void assertUpdateListSQL(String result, String updatedTableName) {
        assertThat(result).contains(String.format("SELECT %s, %s, COLUMN1, COLUMN2", DatasourceConstants.IDX_COLUMN,
            DatasourceConstants.STATUS_COLUMN)).contains(String.format("FROM %s", updatedTableName));
    }

    private void assertNotUpdatedListSQL(String result, String originTableName, String updatedTableName) {
        assertThat(result).contains(
                String.format("SELECT %s, %s, COLUMN1, COLUMN2", DatasourceConstants.IDX_COLUMN, "NULL AS STATUS"))
            .contains(String.format("FROM %s", originTableName))
            .contains(String.format("WHERE (%s NOT IN (SELECT %s", DatasourceConstants.IDX_COLUMN, DatasourceConstants.IDX_COLUMN))
            .contains(String.format("FROM %s)", updatedTableName));
    }

    @Test
    @Transactional
    @WithMockUser(username = "test_login", authorities = "ROLE_USER")
    void testUnionSelectAllQuery() {
        // when
        String result = unionSqlBuilderService.getUnionSelectSQL(category.getId()).toString();

        // then
        String originTableName = category.getTitle().toUpperCase();
        String updatedTableName = category.getTitle().toUpperCase() + DatasourceConstants.UPDATED_SUFFIX;

        assertUpdateListSQL(result, updatedTableName);
        assertThat(result).contains("UNION");
        assertNotUpdatedListSQL(result, originTableName, updatedTableName);
    }


    @Test
    @Transactional
    @WithMockUser(username = "test_login", authorities = "ROLE_USER")
    void testGetUpdatedListSQLHaveWhereCondition() {
        // given
        User user = UserResourceIT.createEntity(em);
        user.setLogin("test_login");
        userRepository.saveAndFlush(user);
        UserCategory userCategory = new UserCategory().user(user).category(category).activated(true)
            .termStart(Instant.now().minus(30, ChronoUnit.DAYS)).termEnd(Instant.now().plus(30, ChronoUnit.DAYS));
        userCategoryRepository.saveAndFlush(userCategory);

        // when
        String result = unionSqlBuilderService.getUnionSelectSQL(category.getId()).toString();

        // then
        String originTableName = category.getTitle().toUpperCase();
        String updatedTableName = category.getTitle().toUpperCase() + DatasourceConstants.UPDATED_SUFFIX;

        assertUpdateListSQL(result, updatedTableName);
        assertThat(result).contains("UNION");
        assertNotUpdatedListSQL(result, originTableName, updatedTableName);
        assertThat(result).contains(
            String.format("(%s BETWEEN '%s' AND '%s')", userCategory.getCategory().getDateColumn(),
                userCategory.getTermStart(), userCategory.getTermEnd()));
    }

}

