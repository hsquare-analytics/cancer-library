package io.planit.cancerlibrary.service;

import io.planit.cancerlibrary.constant.DatasourceConstants;
import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.domain.Item;
import io.planit.cancerlibrary.domain.UserPatient;
import io.planit.cancerlibrary.repository.CategoryRepository;
import io.planit.cancerlibrary.repository.ItemRepository;
import io.planit.cancerlibrary.repository.UserPatientRepository;
import io.planit.cancerlibrary.security.SecurityUtils;
import java.util.List;
import java.util.stream.Collectors;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.ibatis.jdbc.SQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UnionSqlBuilderService {

    private Logger log = LoggerFactory.getLogger(UnionSqlBuilderService.class);

    private final CategoryRepository categoryRepository;

    private final ItemRepository itemRepository;

    private final UserPatientRepository userPatientRepository;

    public UnionSqlBuilderService(CategoryRepository categoryRepository, ItemRepository itemRepository,
        UserPatientRepository userPatientRepository) {
        this.categoryRepository = categoryRepository;
        this.itemRepository = itemRepository;
        this.userPatientRepository = userPatientRepository;
    }

    public SQL getUnionSelectSQL(Long categoryId) {
        log.debug("Request to get select all query by categoryId: {}", categoryId);
        List<Item> itemList = itemRepository.findAllByGroupCategoryId(categoryId);
        Category category = categoryRepository.findById(categoryId)
            .orElseThrow(() -> new RuntimeException("Category not found"));

        String login = SecurityUtils.getCurrentUserLogin()
            .orElseThrow(() -> new RuntimeException("Current user login not found"));

        List<UserPatient> userPatients = userPatientRepository.findAllByUserLogin(login);

        SQL updatedListSQL = getUpdatedListSQL(category, itemList, userPatients);
        SQL notUpdatedListSQL = getNotUpdatedListSQL(category, itemList, userPatients);

        SQL sql = new SQL();
        sql.SELECT("*")
            .FROM(String.format("(%s%nUNION%n%s) AS T", updatedListSQL, notUpdatedListSQL))
            .ORDER_BY(DatasourceConstants.IDX_COLUMN);

        log.debug("Assembled final sql: {} ", sql);
        return sql;
    }

    private SQL getUpdatedListSQL(Category category, List<Item> itemList, List<UserPatient> userPatientList) {
        String updatedTableName = category.getTitle().toUpperCase() + DatasourceConstants.UPDATED_SUFFIX;

        SQL sql = new SQL();
        sql.SELECT(DatasourceConstants.IDX_COLUMN).SELECT(DatasourceConstants.STATUS_COLUMN);
        itemList.forEach(item -> sql.SELECT(item.getTitle().toUpperCase()));
        sql.FROM(updatedTableName);

        if (CollectionUtils.isNotEmpty(userPatientList)) {
            sql.WHERE(getPatientCondition(userPatientList));
        }

        return sql;
    }

    private SQL getNotUpdatedListSQL(Category category, List<Item> itemList, List<UserPatient> userPatientList) {
        String originTableName = category.getTitle().toUpperCase();
        String updatedTableName = originTableName + DatasourceConstants.UPDATED_SUFFIX;

        SQL excludeIdxSubquery = new SQL().SELECT(DatasourceConstants.IDX_COLUMN).FROM(updatedTableName);

        SQL sql = new SQL().SELECT(DatasourceConstants.IDX_COLUMN)
            .SELECT(String.format("NULL AS %s", DatasourceConstants.STATUS_COLUMN));
        itemList.forEach(item -> sql.SELECT(item.getTitle().toUpperCase()));
        sql.FROM(originTableName)
            .WHERE(String.format("%s NOT IN (%s)", DatasourceConstants.IDX_COLUMN, excludeIdxSubquery));

        if (CollectionUtils.isNotEmpty(userPatientList)) {
            sql.WHERE(getPatientCondition(userPatientList));
        }

        return sql;
    }

    private String getPatientCondition(List<UserPatient> userPatientList) {

        String commaSeparatedPatientNo = userPatientList.stream().map(UserPatient::getPatientNo)
            .map(patientNo -> String.format("'%s'", patientNo))
            .collect(Collectors.joining(", "));

        return String.format("PT_NO IN (%s)", commaSeparatedPatientNo);
    }
}
