package io.planit.cancerlibrary.service;

import io.planit.cancerlibrary.config.ReviewConstants;
import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.domain.Item;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.repository.CategoryRepository;
import io.planit.cancerlibrary.repository.ItemRepository;
import io.planit.cancerlibrary.repository.UserRepository;
import io.planit.cancerlibrary.security.SecurityUtils;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.jdbc.SQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DMLSqlBuilderService {

    private Logger log = LoggerFactory.getLogger(DMLSqlBuilderService.class);

    private final CategoryRepository categoryRepository;

    private final ItemRepository itemRepository;

    private final UserRepository userRepository;

    private final TimeService timeService;

    private final String UPDATED_TABLE_SUFFIX = "_UPDATED";

    public DMLSqlBuilderService(CategoryRepository categoryRepository, ItemRepository itemRepository,
        UserRepository userRepository, TimeService timeService) {
        this.categoryRepository = categoryRepository;
        this.itemRepository = itemRepository;
        this.userRepository = userRepository;
        this.timeService = timeService;
    }

    public SQL getInsertSQL(Long categoryId, Map<String, String> map) {
        log.debug("Request to get insert query by categoryId: {}", categoryId);
        List<Item> itemList = itemRepository.findAllByGroupCategoryId(categoryId);
        Category category = categoryRepository.findById(categoryId)
            .orElseThrow(() -> new RuntimeException("Category not found"));

        String login = SecurityUtils.getCurrentUserLogin()
            .orElseThrow(() -> new RuntimeException("Current user login not found"));
        User user = userRepository.findOneByLogin(login).orElseThrow(() -> new RuntimeException("User not found"));

        SQL sql = new SQL() {{
            INSERT_INTO(category.getTitle() + UPDATED_TABLE_SUFFIX);
            itemList.forEach(item -> {
                if (map.containsKey(item.getTitle())) {
                    VALUES(item.getTitle().toUpperCase(), String.format("'%s'", map.get(item.getTitle())));
                }
            });

            VALUES("CREATED_BY", String.format("'%s'", user.getLogin()));
            VALUES("CREATED_DATE", String.format("'%s'", timeService.getCurrentTime()));
            VALUES("LAST_MODIFIED_BY", String.format("'%s'", user.getLogin()));
            VALUES("LAST_MODIFIED_DATE", String.format("'%s'", timeService.getCurrentTime()));
            VALUES("STATUS", String.format("'%s'", ReviewConstants.SUBMITTED));
        }};

        log.debug("Assembled final sql: {} ", sql);
        return sql;
    }

    public SQL getReadSQL(Long categoryId, Map<String, String> map) {
        log.debug("Request to get read query by categoryId: {}", categoryId);
        Category category = categoryRepository.findById(categoryId)
            .orElseThrow(() -> new RuntimeException("Category not found"));

        SQL sql = new SQL() {{
            SELECT("*");
            FROM(category.getTitle() + UPDATED_TABLE_SUFFIX);
            WHERE(String.format("IDX = '%s'", map.get("idx")));
        }};

        log.debug("Assembled final sql: {} ", sql);
        return sql;
    }

    public SQL getReadAllSQL(Long categoryId) {
        log.debug("Request to get read all query by categoryId: {}", categoryId);
        Category category = categoryRepository.findById(categoryId)
            .orElseThrow(() -> new RuntimeException("Category not found"));

        SQL sql = new SQL() {{
            SELECT("*");
            FROM(category.getTitle() + UPDATED_TABLE_SUFFIX);
        }};

        log.debug("Assembled final sql: {} ", sql);
        return sql;
    }

    public SQL getUpdateSQL(Long categoryId, Map<String, String> map) {
        log.debug("Request to get update query by categoryId: {}", categoryId);

        List<Item> itemList = itemRepository.findAllByGroupCategoryId(categoryId);
        Category category = categoryRepository.findById(categoryId)
            .orElseThrow(() -> new RuntimeException("Category not found"));

        String login = SecurityUtils.getCurrentUserLogin()
            .orElseThrow(() -> new RuntimeException("Current user login not found"));
        User user = userRepository.findOneByLogin(login).orElseThrow(() -> new RuntimeException("User not found"));

        SQL sql = new SQL() {{
            UPDATE(category.getTitle() + UPDATED_TABLE_SUFFIX);
            itemList.forEach(
                item -> {
                    if (map.containsKey(item.getTitle())) {
                        SET(String.format("%s = '%s'", item.getTitle().toUpperCase(), map.get(item.getTitle())));
                    }
                });

            SET(String.format("LAST_MODIFIED_BY = '%s'", user.getLogin()));
            SET(String.format("LAST_MODIFIED_DATE = '%s'", timeService.getCurrentTime()));
            SET(String.format("STATUS = '%s'", map.get("status")));
            WHERE(String.format("IDX = '%s'", map.get("idx")));
        }};

        log.debug("Assembled final sql: {} ", sql);
        return sql;
    }

    public SQL getDeleteSQL(Long categoryId, Map<String, String> map) {
        log.debug("Request to get delete query by categoryId: {}", categoryId);
        Category category = categoryRepository.findById(categoryId)
            .orElseThrow(() -> new RuntimeException("Category not found"));

        SQL sql = new SQL() {{
            DELETE_FROM(category.getTitle() + UPDATED_TABLE_SUFFIX);
            WHERE(String.format("IDX = '%s'", map.get("idx")));
        }};

        log.debug("Assembled final sql: {} ", sql);
        return sql;
    }
}
