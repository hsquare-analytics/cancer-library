package io.planit.cancerlibrary.service;

import static io.planit.cancerlibrary.constant.DatasourceConstants.IDX_COLUMN;
import static io.planit.cancerlibrary.constant.DatasourceConstants.SQL_EQUAL_SYNTAX;
import static io.planit.cancerlibrary.constant.DatasourceConstants.STATUS_COLUMN;
import static io.planit.cancerlibrary.constant.DatasourceConstants.UPDATED_SUFFIX;
import static io.planit.cancerlibrary.constant.DatasourceConstants.parameterization;
import static io.planit.cancerlibrary.constant.DatasourceConstants.sqlization;

import io.planit.cancerlibrary.constant.ReviewConstants;
import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.domain.Item;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.repository.CategoryRepository;
import io.planit.cancerlibrary.repository.ItemRepository;
import io.planit.cancerlibrary.repository.UserRepository;
import io.planit.cancerlibrary.security.SecurityUtils;
import io.planit.cancerlibrary.web.rest.errors.CategoryDeficiencyException;
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

    private final Logger log = LoggerFactory.getLogger(DMLSqlBuilderService.class);

    private final CategoryRepository categoryRepository;

    private final ItemRepository itemRepository;

    private final UserRepository userRepository;

    private final TimeService timeService;

    public DMLSqlBuilderService(CategoryRepository categoryRepository, ItemRepository itemRepository,
        UserRepository userRepository, TimeService timeService) {
        this.categoryRepository = categoryRepository;
        this.itemRepository = itemRepository;
        this.userRepository = userRepository;
        this.timeService = timeService;
    }

    public SQL getInsertSQL(Long categoryId, Map<String, String> map) {
        log.debug("Request to get insert query by categoryId: {}", categoryId);
        List<Item> itemList = itemRepository.findAllByCategoryId(categoryId);
        Category category = categoryRepository.findById(categoryId).orElseThrow(CategoryDeficiencyException::new);

        String login = SecurityUtils.getCurrentUserLogin().orElseThrow(SecurityContextUserNotFoundException::new);
        User user = userRepository.findOneByLogin(login).orElseThrow(() -> new RuntimeException("User not found"));

        SQL sql = new SQL();
        sql.VALUES(IDX_COLUMN, String.format("'%s'", map.get(parameterization(IDX_COLUMN))))
            .INSERT_INTO(sqlization(category.getTitle() + UPDATED_SUFFIX));

        itemList.forEach(item -> {
            String mapKey = parameterization(item.getTitle());
            if (map.containsKey(mapKey)) {
                sql.VALUES(sqlization(item.getTitle()), String.format("'%s'", map.get(mapKey)));
            }
        });

        sql.VALUES("CREATED_BY", String.format("'%s'", user.getLogin()))
            .VALUES("CREATED_DATE", String.format("'%s'", timeService.getCurrentTime()))
            .VALUES("LAST_MODIFIED_BY", String.format("'%s'", user.getLogin()))
            .VALUES("LAST_MODIFIED_DATE", String.format("'%s'", timeService.getCurrentTime()))
            .VALUES("STATUS", String.format("'%s'", ReviewConstants.SUBMITTED));

        log.debug("Assembled final sql: {} ", sql);
        return sql;
    }

    public SQL getReadSQL(Long categoryId, Map<String, String> map) {
        log.debug("Request to get read query by categoryId: {}", categoryId);
        Category category = categoryRepository.findById(categoryId).orElseThrow(CategoryDeficiencyException::new);

        SQL sql = new SQL().
            SELECT("*").
            FROM(sqlization(category.getTitle() + UPDATED_SUFFIX)).
            WHERE(String.format(SQL_EQUAL_SYNTAX, IDX_COLUMN, map.get(parameterization(IDX_COLUMN))));

        log.debug("Assembled final sql: {} ", sql);
        return sql;
    }

    public SQL getReadAllSQL(Long categoryId) {
        log.debug("Request to get read all query by categoryId: {}", categoryId);
        Category category = categoryRepository.findById(categoryId).orElseThrow(CategoryDeficiencyException::new);

        SQL sql = new SQL().SELECT("*").FROM(sqlization(category.getTitle() + UPDATED_SUFFIX));

        log.debug("Assembled final sql: {} ", sql);
        return sql;
    }

    public SQL getUpdateSQL(Long categoryId, Map<String, String> map) {
        log.debug("Request to get update query by categoryId: {}", categoryId);

        List<Item> itemList = itemRepository.findAllByCategoryId(categoryId);
        Category category = categoryRepository.findById(categoryId).orElseThrow(CategoryDeficiencyException::new);

        String login = SecurityUtils.getCurrentUserLogin().orElseThrow(SecurityContextUserNotFoundException::new);
        User user = userRepository.findOneByLogin(login).orElseThrow(() -> new RuntimeException("User not found"));

        SQL sql = new SQL();
        sql.UPDATE(sqlization(category.getTitle() + UPDATED_SUFFIX));
        itemList.forEach(item -> {
            String mapKey = parameterization(item.getTitle());
            if (map.containsKey(mapKey)) {
                sql.SET(String.format(SQL_EQUAL_SYNTAX, sqlization(item.getTitle()), map.get(mapKey)));
            }
        });

        sql.SET(String.format("LAST_MODIFIED_BY = '%s'", user.getLogin()))
            .SET(String.format("LAST_MODIFIED_DATE = '%s'", timeService.getCurrentTime()))
            .SET(String.format(SQL_EQUAL_SYNTAX, STATUS_COLUMN, map.get(parameterization(STATUS_COLUMN))))
            .WHERE(String.format(SQL_EQUAL_SYNTAX, IDX_COLUMN, map.get(parameterization(IDX_COLUMN))));

        log.debug("Assembled final sql: {} ", sql);
        return sql;
    }

    public SQL getDeleteSQL(Long categoryId, Map<String, String> map) {
        log.debug("Request to get delete query by categoryId: {}", categoryId);
        Category category = categoryRepository.findById(categoryId).orElseThrow(CategoryDeficiencyException::new);

        SQL sql = new SQL()
            .DELETE_FROM(sqlization(category.getTitle() + UPDATED_SUFFIX))
            .WHERE(String.format(SQL_EQUAL_SYNTAX, IDX_COLUMN, map.get("idx")));

        log.debug("Assembled final sql: {} ", sql);
        return sql;
    }
}
