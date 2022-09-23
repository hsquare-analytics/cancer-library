package io.planit.cancerlibrary.service;

import static org.assertj.core.api.Assertions.assertThat;

import io.planit.cancerlibrary.IntegrationTest;
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
import java.util.Arrays;
import javax.persistence.EntityManager;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.transaction.annotation.Transactional;

@IntegrationTest
public class UnionSqlBuilderServiceIT {

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
    public void testUnionSelectAllQuery() {
        // given
        Item item1 = new Item().group(group).title("column1").activated(true);
        Item item2 = new Item().group(group).title("column2").activated(true);

        itemRepository.saveAndFlush(item1);
        itemRepository.saveAndFlush(item2);

        User user = UserResourceIT.createEntity(em);
        user.setLogin("test_login");
        userRepository.saveAndFlush(user);
        UserCategory userCategory = new UserCategory().user(user).category(category)
            .activated(true).termStart(Instant.now().minus(30, ChronoUnit.DAYS))
            .termEnd(Instant.now().plus(30, ChronoUnit.DAYS));
        userCategoryRepository.saveAndFlush(userCategory);

        // when
        String result = unionSqlBuilderService.getUnionSelectSQL(category.getId()).toString();

        // then
//        SELECT *
//            FROM (SELECT COLUMN1, COLUMN2, STATUS
//                FROM AAAAAAAAAA_UPDATED
//                WHERE (SEQ IN (SELECT MAX(seq)
//                    FROM AAAAAAAAAA_UPDATED
//                    WHERE (STATUS IN ('STATUS_APPROVED', 'STATUS_SUBMITTED'))
//                    GROUP BY IDX) AND AAAAAAAAAA BETWEEN '2022-08-23T05:44:42.421785Z' AND '2022-10-22T05:44:42.421923Z') UNION SELECT COLUMN1, COLUMN2, NULL AS STATUS
//        FROM AAAAAAAAAA
//        WHERE (IDX NOT IN (SELECT IDX
//            FROM AAAAAAAAAA_UPDATED
//            WHERE (SEQ IN (SELECT MAX(seq)
//                FROM AAAAAAAAAA_UPDATED
//                WHERE (STATUS IN ('STATUS_APPROVED', 'STATUS_SUBMITTED'))
//                GROUP BY IDX))) AND AAAAAAAAAA BETWEEN '2022-08-23T05:44:42.421785Z' AND '2022-10-22T05:44:42.421923Z')) AS T
        String originTableName = category.getTitle().toUpperCase();
        String updatedTableName = category.getTitle().toUpperCase() + "_UPDATED";

        assertThat(result).contains("SELECT COLUMN1, COLUMN2, STATUS");
        assertThat(result).contains("FROM " + category.getTitle().toUpperCase());

        String whereClause = String.format("WHERE (%s BETWEEN '%s' AND '%s')", category.getDateColumn(),
            userCategory.getTermStart(), userCategory.getTermEnd());
        assertThat(result).contains(whereClause);
    }

    @Test
    @Transactional
    public void testGetUpdatedListSQL() {
        // given
        Item item1 = new Item().group(group).title("column1").activated(true);
        Item item2 = new Item().group(group).title("column2").activated(true);

        itemRepository.saveAndFlush(item1);
        itemRepository.saveAndFlush(item2);

        // when
        String result = unionSqlBuilderService.getUpdatedListSQL(category, Arrays.asList(item1, item2), null).toString();

        // then
        String updatedTableName = category.getTitle().toUpperCase() + "_UPDATED";
        assertThat(result).contains("SELECT COLUMN1, COLUMN2, STATUS");
        assertThat(result).contains(String.format("FROM %s", updatedTableName));
    }

    @Test
    @Transactional
    public void testGetNotUpdatedListSQL() {
        // given
        Item item1 = new Item().group(group).title("column1").activated(true);
        Item item2 = new Item().group(group).title("column2").activated(true);

        itemRepository.saveAndFlush(item1);
        itemRepository.saveAndFlush(item2);

        // when
        String result = unionSqlBuilderService.getNotUpdatedListSQL(category, Arrays.asList(item1, item2), null).toString();

        // then
        String originTableName = category.getTitle().toUpperCase();
        String updatedTableName = category.getTitle().toUpperCase() + "_UPDATED";

        assertThat(result).contains("SELECT COLUMN1, COLUMN2, NULL AS STATUS");
        assertThat(result).contains(String.format("FROM %s", originTableName));
        assertThat(result).contains("WHERE (IDX NOT IN (SELECT IDX");
        assertThat(result).contains(String.format("FROM %s))", updatedTableName));
    }
}

