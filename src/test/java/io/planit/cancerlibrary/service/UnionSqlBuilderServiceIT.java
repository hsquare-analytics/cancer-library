package io.planit.cancerlibrary.service;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.constant.DatasourceConstants;
import io.planit.cancerlibrary.constant.RowStatus;
import io.planit.cancerlibrary.domain.*;
import io.planit.cancerlibrary.repository.*;
import io.planit.cancerlibrary.web.rest.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;

import static io.planit.cancerlibrary.constant.DatasourceConstants.*;
import static org.assertj.core.api.Assertions.assertThat;

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
        assertThat(result).contains(String.format("SELECT %s, STATUS, CREATED_BY, CREATED_DATE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, COLUMN1, COLUMN2",
                IDX_COLUMN))
            .contains(String.format("FROM %s", updatedTableName));
    }

    private void assertNotUpdatedListSQL(String result, String originTableName, String updatedTableName, String ptNo) {
        assertThat(result).contains(
                String.format("SELECT %s, '%s' AS STATUS, NULL AS CREATED_BY, NULL AS CREATED_DATE, NULL AS LAST_MODIFIED_BY, NULL AS LAST_MODIFIED_DATE, COLUMN1, COLUMN2",
                    IDX_COLUMN, RowStatus.NOT_STARTED))
            .contains(String.format("FROM %s", originTableName))
            .contains(String.format("WHERE (NOT EXISTS (SELECT 1"))
            .contains(String.format("FROM %s", updatedTableName))
            .contains(String.format("WHERE (%s = %s AND PT_NO = '%s')) AND PT_NO = '%s'", updatedTableName + "." + IDX_COLUMN, originTableName + "." + IDX_COLUMN, ptNo, ptNo));
    }

    @Test
    @Transactional
    @WithMockUser(username = "test_login", authorities = "ROLE_USER")
    void testUnionSelectAllQuery() {
        // when
        String result = unionSqlBuilderService.getUnionSelectSQL(category.getId(), "test").toString();

        // then
        String originTableName = category.getTitle().toUpperCase();
        String updatedTableName = category.getTitle().toUpperCase() + UPDATED_SUFFIX;

        assertUpdateListSQL(result, updatedTableName);
        assertThat(result).contains("UNION");
        assertNotUpdatedListSQL(result, originTableName, updatedTableName, "test");
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
        String ptNo = "test1";

        // when
        String result = unionSqlBuilderService.getUnionSelectSQL(category.getId(), ptNo).toString();

        // then
        String originTableName = category.getTitle().toUpperCase();
        String updatedTableName = category.getTitle().toUpperCase() + UPDATED_SUFFIX;

        assertUpdateListSQL(result, updatedTableName);
        assertThat(result).contains("UNION");
        assertNotUpdatedListSQL(result, originTableName, updatedTableName, ptNo);
        assertThat(result).contains(String.format("PT_NO = '%s')", ptNo));
    }

}

