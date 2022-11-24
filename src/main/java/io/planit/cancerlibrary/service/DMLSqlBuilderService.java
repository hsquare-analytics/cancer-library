package io.planit.cancerlibrary.service;

import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.domain.Item;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.repository.CategoryRepository;
import io.planit.cancerlibrary.repository.ItemRepository;
import io.planit.cancerlibrary.repository.UserRepository;
import io.planit.cancerlibrary.security.SecurityUtils;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.ibatis.jdbc.SQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import static io.planit.cancerlibrary.constant.DatasourceConstants.*;
import static io.planit.cancerlibrary.service.StreamUtils.distinctByKey;

@Service
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

    public String getInsertSQL(Long categoryId, Map<String, Object> map) {
        log.debug("Request to get insert query by categoryId: {}", categoryId);
        List<Item> itemList = itemRepository.findAllByCategoryId(categoryId);
        Category category = categoryRepository.findById(categoryId).orElseThrow(SetupDeficiencyException::new);

        String login = SecurityUtils.getCurrentUserLogin().orElseThrow(SecurityContextUserNotFoundException::new);
        User user = userRepository.findOneByLogin(login).orElseThrow(() -> new RuntimeException("User not found"));

        if (!map.containsKey(parameterization(IDX_COLUMN)) || !map.containsKey(parameterization(PATIENT_NUMBER_COLUMN))) {
            throw new ParameterDeficiencyException();
        }

        if (itemList.stream().map(Item::getTitle).noneMatch(s -> parameterization(s).equals(parameterization(PATIENT_NUMBER_COLUMN)))) {
            throw new SetupDeficiencyException();
        }

        SQL sql = new SQL();
        sql.VALUES(IDX_COLUMN, String.format("'%s'", map.get(parameterization(IDX_COLUMN))))
            .INSERT_INTO(sqlization(category.getTitle() + UPDATED_SUFFIX));

        itemList.stream().filter(distinctByKey(Item::getTitle)).forEach(item -> {
            String mapKey = parameterization(item.getTitle());
            if (map.containsKey(mapKey) && map.get(mapKey) != null) {
                if (ObjectUtils.isNotEmpty(item.getAttribute()) && "date".equals(item.getAttribute().getDataType())) {
                    Timestamp timestamp = timeService.convertTimezoneStringToTimestamp((String) map.get(mapKey));
                    sql.VALUES(sqlization(item.getTitle()), String.format("'%s'", timestamp));
                } else {
                    sql.VALUES(sqlization(item.getTitle()), String.format("'%s'", map.get(mapKey)));
                }
            }
        });

        sql.VALUES(CREATED_BY, String.format("'%s'", user.getLogin()))
            .VALUES(CREATED_DATE, String.format("'%s'", timeService.getCurrentTimestamp()))
            .VALUES(LAST_MODIFIED_BY, String.format("'%s'", user.getLogin()))
            .VALUES(LAST_MODIFIED_DATE, String.format("'%s'", timeService.getCurrentTimestamp()));

        loggingFinalSQL(sql);
        return sql.toString();
    }

    public String getReadUpdatedRowSQL(Long categoryId, Map<String, Object> map) {
        log.debug("Request to get read query by categoryId: {}", categoryId);
        Category category = categoryRepository.findById(categoryId).orElseThrow(SetupDeficiencyException::new);

        SQL sql = new SQL().
            SELECT("*").
            FROM(sqlization(category.getTitle() + UPDATED_SUFFIX)).
            WHERE(getSqlEqualSyntax(IDX_COLUMN, map.get(parameterization(IDX_COLUMN))));

        loggingFinalSQL(sql);
        return sql.toString();
    }

    public String getReadOriginRowSQL(Long categoryId, Map<String, Object> map) {
        log.debug("Request to get read query by categoryId: {}", categoryId);
        Category category = categoryRepository.findById(categoryId).orElseThrow(SetupDeficiencyException::new);

        SQL sql = new SQL().
            SELECT("*").
            FROM(sqlization(category.getTitle())).
            WHERE(getSqlEqualSyntax(IDX_COLUMN, map.get(parameterization(IDX_COLUMN))));

        loggingFinalSQL(sql);
        return sql.toString();
    }

    public String getReadAllSQL(Long categoryId) {
        log.debug("Request to get read all query by categoryId: {}", categoryId);
        Category category = categoryRepository.findById(categoryId).orElseThrow(SetupDeficiencyException::new);

        SQL sql = new SQL().SELECT("*").FROM(sqlization(category.getTitle() + UPDATED_SUFFIX));

        loggingFinalSQL(sql);
        return sql.toString();
    }

    public String getUpdateSQL(Long categoryId, Map<String, Object> map) {
        log.debug("Request to get update query by categoryId: {}", categoryId);

        if (!map.containsKey(parameterization(IDX_COLUMN))) {
            throw new ParameterDeficiencyException();
        }

        List<Item> itemList = itemRepository.findAllByCategoryId(categoryId);
        Category category = categoryRepository.findById(categoryId).orElseThrow(SetupDeficiencyException::new);

        String login = SecurityUtils.getCurrentUserLogin().orElseThrow(SecurityContextUserNotFoundException::new);
        User user = userRepository.findOneByLogin(login).orElseThrow(() -> new RuntimeException("User not found"));

        SQL sql = new SQL();
        sql.UPDATE(sqlization(category.getTitle() + UPDATED_SUFFIX));
        itemList.stream().filter(distinctByKey(Item::getTitle)).forEach(item -> {
            String mapKey = parameterization(item.getTitle());
            if (map.containsKey(mapKey) && map.get(mapKey) != null) {
                if (ObjectUtils.isNotEmpty(item.getAttribute()) && "date".equals(item.getAttribute().getDataType())) {
                    Timestamp timestamp = timeService.convertTimezoneStringToTimestamp((String) map.get(mapKey));
                    sql.SET(getSqlEqualSyntax(item.getTitle(), timestamp));
                } else {
                    sql.SET(getSqlEqualSyntax(item.getTitle(), map.get(mapKey)));
                }
            }
        });

        sql.SET(getSqlEqualSyntax(LAST_MODIFIED_BY, user.getLogin()))
            .SET(getSqlEqualSyntax(LAST_MODIFIED_DATE, timeService.getCurrentTimestamp()))
            .WHERE(getSqlEqualSyntax(IDX_COLUMN, map.get(parameterization(IDX_COLUMN))));

        loggingFinalSQL(sql);
        return sql.toString();
    }

    public String getDeleteSQL(Long categoryId, Map<String, Object> map) {
        log.debug("Request to get delete query by categoryId: {}", categoryId);
        Category category = categoryRepository.findById(categoryId).orElseThrow(SetupDeficiencyException::new);

        SQL sql = new SQL()
            .DELETE_FROM(sqlization(category.getTitle() + UPDATED_SUFFIX))
            .WHERE(getSqlEqualSyntax(IDX_COLUMN, map.get("idx")));

        loggingFinalSQL(sql);
        return sql.toString();
    }

    private void loggingFinalSQL(SQL sql) {
        log.debug("Assembled final sql: {} ", sql);
    }

}
