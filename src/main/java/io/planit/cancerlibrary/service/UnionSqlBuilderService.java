package io.planit.cancerlibrary.service;

import io.planit.cancerlibrary.constant.DatasourceConstants;
import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.domain.Item;
import io.planit.cancerlibrary.domain.UserCategory;
import io.planit.cancerlibrary.repository.CategoryRepository;
import io.planit.cancerlibrary.repository.ItemRepository;
import io.planit.cancerlibrary.repository.UserCategoryRepository;
import io.planit.cancerlibrary.security.SecurityUtils;
import java.util.List;
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

    private final UserCategoryRepository userCategoryRepository;

    public UnionSqlBuilderService(CategoryRepository categoryRepository, ItemRepository itemRepository,
        UserCategoryRepository userCategoryRepository) {
        this.categoryRepository = categoryRepository;
        this.itemRepository = itemRepository;
        this.userCategoryRepository = userCategoryRepository;
    }

    public SQL getUnionSelectSQL(Long categoryId) {
        log.debug("Request to get select all query by categoryId: {}", categoryId);
        List<Item> itemList = itemRepository.findAllByGroupCategoryId(categoryId);
        Category category = categoryRepository.findById(categoryId)
            .orElseThrow(() -> new RuntimeException("Category not found"));

        String login = SecurityUtils.getCurrentUserLogin()
            .orElseThrow(() -> new RuntimeException("Current user login not found"));

        List<UserCategory> userCategories = userCategoryRepository.findAllByActivatedTrueAndUserLoginAndCategoryId(
            login, categoryId);

        SQL updatedListSQL = getUpdatedListSQL(category, itemList, userCategories);
        SQL notUpdatedListSQL = getNotUpdatedListSQL(category, itemList, userCategories);

        SQL sql = new SQL();
        sql.SELECT("*")
            .FROM(String.format("(%s%nUNION%n%s) AS T", updatedListSQL, notUpdatedListSQL))
            .ORDER_BY(DatasourceConstants.IDX_COLUMN);

        log.debug("Assembled final sql: {} ", sql);
        return sql;
    }

    private SQL getUpdatedListSQL(Category category, List<Item> itemList, List<UserCategory> userCategoryList) {
        String updatedTableName = category.getTitle().toUpperCase() + DatasourceConstants.UPDATED_SUFFIX;

        SQL sql = new SQL();
        sql.SELECT(DatasourceConstants.IDX_COLUMN).SELECT(DatasourceConstants.STATUS_COLUMN);
        itemList.forEach(item -> sql.SELECT(item.getTitle().toUpperCase()));
        sql.FROM(updatedTableName);

        if (CollectionUtils.isNotEmpty(userCategoryList)) {
            sql.WHERE(getDateClause(category, userCategoryList));
        }

        return sql;
    }

    private SQL getNotUpdatedListSQL(Category category, List<Item> itemList, List<UserCategory> userCategoryList) {
        String originTableName = category.getTitle().toUpperCase();
        String updatedTableName = originTableName + DatasourceConstants.UPDATED_SUFFIX;

        SQL excludeIdxSubquery = new SQL().SELECT(DatasourceConstants.IDX_COLUMN).FROM(updatedTableName);

        SQL sql = new SQL().SELECT(DatasourceConstants.IDX_COLUMN)
            .SELECT(String.format("NULL AS %s", DatasourceConstants.STATUS_COLUMN));
        itemList.forEach(item -> sql.SELECT(item.getTitle().toUpperCase()));
        sql.FROM(originTableName)
            .WHERE(String.format("%s NOT IN (%s)", DatasourceConstants.IDX_COLUMN, excludeIdxSubquery));

        if (CollectionUtils.isNotEmpty(userCategoryList)) {
            sql.WHERE(getDateClause(category, userCategoryList));
        }

        return sql;
    }

    private String getDateClause(Category category, List<UserCategory> userCategoryList) {
        StringBuilder dateClauses = new StringBuilder("(");
        for (int i = 0; i < userCategoryList.size(); i++) {
            UserCategory userCategory = userCategoryList.get(i);
            String betweenClause = String.format("%s BETWEEN '%s' AND '%s'", category.getProperty().getDateColumn(),
                userCategory.getTermStart(), userCategory.getTermEnd());
            if (i == 0) {
                dateClauses.append(betweenClause);
            } else {
                dateClauses.append(String.format(" OR %s", betweenClause));
            }
        }
        dateClauses = dateClauses.append(")");
        return dateClauses.toString();
    }
}
