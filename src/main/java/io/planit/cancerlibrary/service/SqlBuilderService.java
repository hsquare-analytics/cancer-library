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
import java.util.Map;
import org.apache.ibatis.jdbc.SQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SqlBuilderService {

    private Logger log = LoggerFactory.getLogger(SqlBuilderService.class);

    private final CategoryRepository categoryRepository;

    private final ItemRepository itemRepository;

    private final UserRepository userRepository;

    private final UserCategoryRepository userCategoryRepository;

    public SqlBuilderService(CategoryRepository categoryRepository, ItemRepository itemRepository,
        UserRepository userRepository, UserCategoryRepository userCategoryRepository) {
        this.categoryRepository = categoryRepository;
        this.itemRepository = itemRepository;
        this.userRepository = userRepository;
        this.userCategoryRepository = userCategoryRepository;
    }

    public String getSelectSQL(Long categoryId) {
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

        SQL sql = new SQL() {{
            itemList.forEach(item -> SELECT(item.getTitle()));
            FROM(category.getTitle());

            String dateColumn = category.getDateColumn();

            if (dateColumn != null && !dateColumn.isEmpty()) {
                userCategories.forEach(userCategory -> {
                    String betweenClaues = String.format("%s BETWEEN '%s' AND '%s'",
                        category.getDateColumn(),
                        userCategory.getTermStart(), userCategory.getTermEnd());
                    WHERE(betweenClaues);
                });
            }
        }};

        log.debug("Executed final sql: {} ", sql);
        return sql.toString();
    }

    public String getInsertSQL(Long categoryId, Map<String, String> map) {
        log.debug("Request to get insert query by categoryId: {}", categoryId);
        List<Item> itemList = itemRepository.findAllByGroupCategoryId(categoryId);
        Category category = categoryRepository.findById(categoryId)
            .orElseThrow(() -> new RuntimeException("Category not found"));

        SQL sql = new SQL() {{
            INSERT_INTO(category.getTitle() + "_updated");
            itemList.forEach(item -> VALUES(item.getTitle(), String.format("'%s'", map.get(item.getTitle()))));

            VALUES("created_by", "1");
            VALUES("created_date", Instant.now().toString());
            VALUES("last_modified_by", "1");
            VALUES("last_modified_date", Instant.now().toString());
        }};

        log.debug("executed final sql: {} ", sql);
        return sql.toString();
    }

    public List<Item> getItemListByCategoryId(Long categoryId) {
        log.debug("Request to get item list by categoryId: {}", categoryId);
        return itemRepository.findAllByGroupCategoryId(categoryId);
    }

    private String transformSqlToString(SQL sql) {
        return sql.toString().replace("\n", " ").replace("\r", "");
    }
}
