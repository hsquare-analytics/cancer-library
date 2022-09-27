package io.planit.cancerlibrary.service;

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

    private final String UPDATED_TABLE_SUFFIX = "_UPDATED";

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

        SQL sql = new SQL() {{
            SELECT("*");
            FROM("(" + updatedListSQL.toString() + " UNION " + notUpdatedListSQL.toString() + ") AS T");
        }};

        log.debug("Assembled final sql: {} ", sql);
        return sql;
    }

    public SQL getUpdatedListSQL(Category category, List<Item> itemList, List<UserCategory> userCategoryList) {
        String updatedTableName = category.getTitle().toUpperCase() + UPDATED_TABLE_SUFFIX;

        SQL sql = new SQL() {{
            SELECT("IDX");
            SELECT("STATUS");
            itemList.forEach(item -> SELECT(item.getTitle().toUpperCase()));
            FROM(updatedTableName);

            if (CollectionUtils.isNotEmpty(userCategoryList)) {
                WHERE(getDateClause(category, userCategoryList));
            }
        }};

        return sql;
    }

    public SQL getNotUpdatedListSQL(Category category, List<Item> itemList, List<UserCategory> userCategoryList) {
        String originTableName = category.getTitle().toUpperCase();
        String updatedTableName = originTableName + UPDATED_TABLE_SUFFIX;

        SQL EXCLUDE_IDX_SUBQUERY = new SQL() {{
            SELECT("IDX");
            FROM(updatedTableName);
        }};

        SQL sql = new SQL() {{
            SELECT("IDX");
            SELECT("NULL AS STATUS");
            itemList.forEach(item -> SELECT(item.getTitle().toUpperCase()));
            FROM(originTableName);
            WHERE("IDX NOT IN (" + EXCLUDE_IDX_SUBQUERY + ")");

            if (CollectionUtils.isNotEmpty(userCategoryList)) {
                WHERE(getDateClause(category, userCategoryList));
            }
        }};

        return sql;
    }

    private String getDateClause(Category category, List<UserCategory> userCategoryList) {
        String dateClauses = "(";
        for (int i = 0; i < userCategoryList.size(); i++) {
            UserCategory userCategory = userCategoryList.get(i);
            String betweenClause = String.format("%s BETWEEN '%s' AND '%s'", category.getDateColumn(),
                userCategory.getTermStart(), userCategory.getTermEnd());
            if (i == 0) {
                dateClauses += betweenClause;
            } else {
                dateClauses += " OR " + betweenClause;
            }
        }
        dateClauses = dateClauses + ")";
        return dateClauses;
    }

    public List<Item> getItemListByCategoryId(Long categoryId) {
        log.debug("Request to get item list by categoryId: {}", categoryId);
        return itemRepository.findAllByGroupCategoryId(categoryId);
    }
}
