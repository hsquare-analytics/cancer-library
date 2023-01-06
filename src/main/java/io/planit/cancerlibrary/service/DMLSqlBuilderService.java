package io.planit.cancerlibrary.service;

import io.planit.cancerlibrary.config.ApplicationProperties;
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
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

import static io.planit.cancerlibrary.constant.DatasourceConstants.*;
import static io.planit.cancerlibrary.service.StreamUtils.distinctByKey;

@Service
@Transactional
public class DMLSqlBuilderService {

    private final Logger log = LoggerFactory.getLogger(DMLSqlBuilderService.class);

    private final CategoryRepository categoryRepository;

    private final ItemRepository itemRepository;

    private final UserRepository userRepository;

    private final TimeService timeService;

    private final ApplicationProperties applicationProperties;

    private final Set<String> reservedColumns = Set.of(HOSPITAL_CODE, IDX_COLUMN, STATUS_COLUMN, CREATED_BY, CREATED_DATE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE);

    public DMLSqlBuilderService(CategoryRepository categoryRepository, ItemRepository itemRepository,
                                UserRepository userRepository, TimeService timeService,
                                ApplicationProperties applicationProperties) {
        this.categoryRepository = categoryRepository;
        this.itemRepository = itemRepository;
        this.userRepository = userRepository;
        this.timeService = timeService;
        this.applicationProperties = applicationProperties;
    }

    public String getInsertSQL(Long categoryId, Map<String, Object> map) {
        log.debug("Request to get insert query by categoryId: {}", categoryId);
        Category category = categoryRepository.findById(categoryId).orElseThrow(AbnormalSetupException::new);

        String login = SecurityUtils.getCurrentUserLogin().orElseThrow(SecurityContextUserNotFoundException::new);
        User user = userRepository.findOneByLogin(login).orElseThrow(() -> new RuntimeException("User not found"));

        validateInsertCondition(map);

        SQL sql = new SQL().INSERT_INTO(sqlization(category.getTitle() + UPDATED_SUFFIX))
            .VALUES(HOSPITAL_CODE, String.format("'%s'", applicationProperties.getHospital().getCode()))
            .VALUES(IDX_COLUMN, String.format("'%s'", map.get(parameterization(IDX_COLUMN))));

        getValidItemsByCategoryId(categoryId).forEach(item -> {
            String mapKey = parameterization(item.getTitle());
            if (isMapKeyExist(map, mapKey)) {
                if (isDateColumn(item) && map.get(mapKey) != null) {
                    Timestamp timestamp = timeService.convertTimezoneStringToTimestamp((String) map.get(mapKey));
                    sql.VALUES(sqlization(item.getTitle()), String.format("'%s'", timestamp));
                } else if (isSelectLabelColumn(item)) {
                    sql.VALUES(sqlization(item.getTitle()), String.format("'%s'", map.get(mapKey)));

                    item.getCodebook().getLookupList().stream()
                        .filter(Objects::nonNull)
                        .filter(lookup -> lookup.getDescription().equals(map.get(mapKey)))
                        .findFirst()
                        .ifPresent(lookup -> sql.VALUES(sqlization(item.getProperty().getLabelColumn()), String.format("'%s'", lookup.getTitle())));
                } else if (map.get(mapKey) != null && !map.get(mapKey).equals("")) {
                    sql.VALUES(sqlization(item.getTitle()), String.format("'%s'", getSpecialCharEscapedValue(map.get(mapKey))));
                }
            }
        });

        sql
            .VALUES(STATUS_COLUMN, String.format("'%s'", map.get(parameterization(STATUS_COLUMN))))
            .VALUES(CREATED_BY, String.format("'%s'", user.getLogin()))
            .VALUES(CREATED_DATE, String.format("'%s'", timeService.getCurrentTimestamp()))
            .VALUES(LAST_MODIFIED_BY, String.format("'%s'", user.getLogin()))
            .VALUES(LAST_MODIFIED_DATE, String.format("'%s'", timeService.getCurrentTimestamp()));

        loggingFinalSQL(sql);
        return sql.toString();
    }

    private List<Item> getValidItemsByCategoryId(Long categoryId) {
        List<Item> itemList = itemRepository.findAllByActivatedTrueAndCategoryId(categoryId);

        if (itemList.stream().map(Item::getTitle).noneMatch(s -> parameterization(s).equals(parameterization(PATIENT_NUMBER_COLUMN)))) {
            throw new AbnormalSetupException();
        }

        return itemList.stream().filter(distinctByKey(Item::getTitle)).filter(item -> !reservedColumns.contains(parameterization(item.getTitle()))).collect(Collectors.toList());
    }


    private void validateInsertCondition(Map<String, Object> map) {
        if (map.containsKey(parameterization(HOSPITAL_CODE))) {
            throw new AbnormalSetupException("Hospital code is not allowed to be inserted");
        }

        if (!map.containsKey(parameterization(IDX_COLUMN)) || !map.containsKey(parameterization(PATIENT_NUMBER_COLUMN))) {
            throw new ParameterDeficiencyException();
        }
    }

    private boolean isMapKeyExist(Map<String, Object> map, String key) {
        return map.containsKey(key);
    }

    private boolean isDateColumn(Item item) {
        if (item.getAttribute() == null) {
            return false;
        }

        return ("date".equals(item.getAttribute().getDataType()) || "datetime".equals(item.getAttribute().getDataType())) || "time".equals(item.getAttribute().getDataType());
    }

    private boolean isSelectLabelColumn(Item item) {
        return ObjectUtils.isNotEmpty(item.getProperty()) && ObjectUtils.isNotEmpty(item.getAttribute()) && ObjectUtils.isNotEmpty(item.getProperty().getLabelColumn()) && "selectbox".equals(item.getAttribute().getDataType());
    }

    public String getReadUpdatedRowSQL(Long categoryId, Map<String, Object> map) {
        log.debug("Request to get read query by categoryId: {}", categoryId);
        Category category = categoryRepository.findById(categoryId).orElseThrow(AbnormalSetupException::new);

        SQL sql = new SQL().
            SELECT("*").
            FROM(sqlization(category.getTitle() + UPDATED_SUFFIX)).
            WHERE(getSqlEqualSyntax(IDX_COLUMN, map.get(parameterization(IDX_COLUMN))));

        loggingFinalSQL(sql);
        return sql.toString();
    }

    public String getReadOriginRowSQL(Long categoryId, Map<String, Object> map) {
        log.debug("Request to get read query by categoryId: {}", categoryId);
        Category category = categoryRepository.findById(categoryId).orElseThrow(AbnormalSetupException::new);

        SQL sql = new SQL().
            SELECT("*").
            FROM(sqlization(category.getTitle())).
            WHERE(getSqlEqualSyntax(IDX_COLUMN, map.get(parameterization(IDX_COLUMN))));

        loggingFinalSQL(sql);
        return sql.toString();
    }

    public String getReadAllSQL(Long categoryId) {
        log.debug("Request to get read all query by categoryId: {}", categoryId);
        Category category = categoryRepository.findById(categoryId).orElseThrow(AbnormalSetupException::new);

        SQL sql = new SQL().SELECT("*").FROM(sqlization(category.getTitle() + UPDATED_SUFFIX));

        loggingFinalSQL(sql);
        return sql.toString();
    }

    public String getUpdateSQL(Long categoryId, Map<String, Object> map) {
        log.debug("Request to get update query by categoryId: {}", categoryId);

        if (!map.containsKey(parameterization(IDX_COLUMN))) {
            throw new ParameterDeficiencyException();
        }

        Category category = categoryRepository.findById(categoryId).orElseThrow(AbnormalSetupException::new);

        String login = SecurityUtils.getCurrentUserLogin().orElseThrow(SecurityContextUserNotFoundException::new);
        User user = userRepository.findOneByLogin(login).orElseThrow(() -> new RuntimeException("User not found"));

        SQL sql = new SQL().UPDATE(sqlization(category.getTitle() + UPDATED_SUFFIX));
        getValidItemsByCategoryId(categoryId).forEach(item -> {
            String mapKey = parameterization(item.getTitle());
            if (isMapKeyExist(map, mapKey)) {
                if (isDateColumn(item) && map.get(mapKey) != null) {
                    Timestamp timestamp = timeService.convertTimezoneStringToTimestamp((String) map.get(mapKey));
                    sql.SET(getSqlEqualSyntax(item.getTitle(), timestamp));
                } else if (isSelectLabelColumn(item)) {
                    sql.SET(getSqlEqualSyntax(item.getTitle(), map.get(mapKey)));

                    item.getCodebook().getLookupList().stream()
                        .filter(Objects::nonNull)
                        .filter(lookup -> lookup.getDescription().equals(map.get(mapKey)))
                        .findFirst()
                        .ifPresent(lookup -> sql.SET(getSqlEqualSyntax(item.getProperty().getLabelColumn(), lookup.getTitle())));
                } else if (map.get(mapKey) == null) {
                    sql.SET(getSqlEqualSyntax(item.getTitle(), null));
                } else {
                    sql.SET(getSqlEqualSyntax(item.getTitle(), getSpecialCharEscapedValue(map.get(mapKey))));
                }
            }
        });

        sql.SET(getSqlEqualSyntax(STATUS_COLUMN, map.get(parameterization(STATUS_COLUMN))))
            .SET(getSqlEqualSyntax(LAST_MODIFIED_BY, user.getLogin()))
            .SET(getSqlEqualSyntax(LAST_MODIFIED_DATE, timeService.getCurrentTimestamp()))
            .WHERE(getSqlEqualSyntax(IDX_COLUMN, map.get(parameterization(IDX_COLUMN))));

        loggingFinalSQL(sql);
        return sql.toString();
    }

    public String getDeleteSQL(Long categoryId, Map<String, Object> map) {
        log.debug("Request to get delete query by categoryId: {}", categoryId);
        Category category = categoryRepository.findById(categoryId).orElseThrow(AbnormalSetupException::new);

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
