package io.planit.cancerlibrary.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.constant.DatasourceConstants;
import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.domain.Item;
import io.planit.cancerlibrary.domain.Subject;
import io.planit.cancerlibrary.domain.Topic;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.domain.UserPatient;
import io.planit.cancerlibrary.repository.CategoryRepository;
import io.planit.cancerlibrary.repository.ItemRepository;
import io.planit.cancerlibrary.repository.SubjectRepository;
import io.planit.cancerlibrary.repository.TopicRepository;
import io.planit.cancerlibrary.repository.UserPatientRepository;
import io.planit.cancerlibrary.repository.UserRepository;
import io.planit.cancerlibrary.web.rest.CategoryResourceIT;
import io.planit.cancerlibrary.web.rest.SubjectResourceIT;
import io.planit.cancerlibrary.web.rest.TopicResourceIT;
import io.planit.cancerlibrary.web.rest.UserPatientResourceIT;
import io.planit.cancerlibrary.web.rest.UserResourceIT;
import io.planit.cancerlibrary.web.rest.errors.ConfigurationDeficiencyException;
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
    private ItemRepository itemRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserPatientRepository userPatientRepository;

    @Autowired
    private UnionSqlBuilderService unionSqlBuilderService;

    private Category category;

    @BeforeEach
    void initTest() {
        Subject subject = SubjectResourceIT.createEntity(em);
        subjectRepository.saveAndFlush(subject);

        Topic topic = TopicResourceIT.createEntity(em, subject);
        topicRepository.saveAndFlush(topic);

        category = CategoryResourceIT.createEntity(em, topic);
        categoryRepository.saveAndFlush(category);

        Item item1 = new Item().category(category).title("column1").activated(true);
        Item item2 = new Item().category(category).title("column2").activated(true);

        itemRepository.saveAndFlush(item1);
        itemRepository.saveAndFlush(item2);
    }

    private void assertUpdateListSQL(String result, String updatedTableName) {
        assertThat(result).contains(String.format("SELECT %s, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, COLUMN1, COLUMN2",
                DatasourceConstants.IDX_COLUMN))
            .contains(String.format("FROM %s", updatedTableName));
    }

    private void assertNotUpdatedListSQL(String result, String originTableName, String updatedTableName) {
        assertThat(result).contains(
                String.format("SELECT %s, NULL AS LAST_MODIFIED_BY, NULL AS LAST_MODIFIED_DATE, COLUMN1, COLUMN2",
                    DatasourceConstants.IDX_COLUMN))
            .contains(String.format("FROM %s", originTableName))
            .contains(String.format("WHERE (%s NOT IN (SELECT %s", DatasourceConstants.IDX_COLUMN,
                DatasourceConstants.IDX_COLUMN))
            .contains(String.format("FROM %s)", updatedTableName));
    }

    @Test
    @Transactional
    @WithMockUser(username = "test_login", authorities = "ROLE_USER")
    void testUnionSelectAllQuery() {
        // when
        String result = unionSqlBuilderService.getUnionSelectSQL(category.getId(), "test").toString();

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
    void testUnionSelectAllQueryWithSpecificPatientCondition() {
        // given
        User user = UserResourceIT.createEntity(em);
        user.setLogin("test_login");
        userRepository.saveAndFlush(user);
        UserPatient userPatient1 = UserPatientResourceIT.createEntity(em, user).patientNo("test1");
        UserPatient userPatient2 = UserPatientResourceIT.createEntity(em, user).patientNo("test2");
        userPatientRepository.saveAndFlush(userPatient1);
        userPatientRepository.saveAndFlush(userPatient2);

        // when
        String result = unionSqlBuilderService.getUnionSelectSQL(category.getId(), "test_patient_no").toString();

        // then
        String originTableName = category.getTitle().toUpperCase();
        String updatedTableName = category.getTitle().toUpperCase() + DatasourceConstants.UPDATED_SUFFIX;

        assertUpdateListSQL(result, updatedTableName);
        assertThat(result).contains("UNION");
        assertNotUpdatedListSQL(result, originTableName, updatedTableName);
        assertThat(result).contains("PT_NO IN ('test_patient_no')");
    }

    @Test
    @Transactional
    @WithMockUser
    void testCategoryNotFoundException() {
        assertThatThrownBy(() -> unionSqlBuilderService.getUnionSelectSQL(999L, "test"))
            .isInstanceOf(ConfigurationDeficiencyException.class);
    }

}

