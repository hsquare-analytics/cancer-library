package io.planit.cancerlibrary.service;

import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.domain.Item;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.domain.UserCategory;
import io.planit.cancerlibrary.repository.CategoryRepository;
import io.planit.cancerlibrary.repository.ItemRepository;
import io.planit.cancerlibrary.repository.UserCategoryRepository;
import io.planit.cancerlibrary.repository.UserRepository;
import io.planit.cancerlibrary.security.SecurityUtils;
import java.time.Instant;
import java.util.List;
import org.apache.commons.collections4.ListUtils;
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

    private final UserRepository userRepository;

    private final UserCategoryRepository userCategoryRepository;

    private final String UPDATED_TABLE_SUFFIX = "_UPDATED";

    public UnionSqlBuilderService(CategoryRepository categoryRepository, ItemRepository itemRepository,
        UserRepository userRepository, UserCategoryRepository userCategoryRepository, TimeService timeService) {
        this.categoryRepository = categoryRepository;
        this.itemRepository = itemRepository;
        this.userRepository = userRepository;
        this.userCategoryRepository = userCategoryRepository;
    }

    public SQL getUnionSelectSQL(Long categoryId) {
        log.debug("Request to get select all query by categoryId: {}", categoryId);
        List<Item> itemList = itemRepository.findAllByGroupCategoryId(categoryId);
        Category category = categoryRepository.findById(categoryId)
            .orElseThrow(() -> new RuntimeException("Category not found"));

        String login = SecurityUtils.getCurrentUserLogin()
            .orElseThrow(() -> new RuntimeException("Current user login not found"));
        User user = userRepository.findOneByLogin(login).orElseThrow(() -> new RuntimeException("User not found"));

        List<UserCategory> userCategories = userCategoryRepository.findAllByUserIdAndAndCategoryIdCurrentTime(
            user.getId(),
            categoryId, Instant.now());

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
            itemList.forEach(item -> SELECT(item.getTitle().toUpperCase()));
            SELECT("STATUS");
            FROM(updatedTableName);

            if (category.getDateColumn() != null && !category.getDateColumn().isEmpty()) {
                ListUtils.emptyIfNull(userCategoryList).forEach(userCategory -> {
                    String betweenClaues = String.format("%s BETWEEN '%s' AND '%s'", category.getDateColumn(), userCategory.getTermStart(), userCategory.getTermEnd());
                    WHERE(betweenClaues);
                });
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
            itemList.forEach(item -> SELECT(item.getTitle().toUpperCase()));
            SELECT("NULL AS STATUS");
            FROM(originTableName);
            WHERE("IDX NOT IN (" + EXCLUDE_IDX_SUBQUERY + ")");

            if (category.getDateColumn() != null && !category.getDateColumn().isEmpty()) {
                ListUtils.emptyIfNull(userCategoryList).forEach(userCategory -> {
                    String betweenClaues = String.format("%s BETWEEN '%s' AND '%s'", category.getDateColumn(), userCategory.getTermStart(), userCategory.getTermEnd());
                    WHERE(betweenClaues);
                });
            }
        }};

        return sql;
    }

    public List<Item> getItemListByCategoryId(Long categoryId) {
        log.debug("Request to get item list by categoryId: {}", categoryId);
        return itemRepository.findAllByGroupCategoryId(categoryId);
    }
}
