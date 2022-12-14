package io.planit.cancerlibrary.service;

import io.planit.cancerlibrary.constant.RowStatus;
import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.domain.Item;
import io.planit.cancerlibrary.repository.CategoryRepository;
import io.planit.cancerlibrary.repository.ItemRepository;
import org.apache.ibatis.jdbc.SQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;

import static io.planit.cancerlibrary.constant.DatasourceConstants.*;
import static io.planit.cancerlibrary.service.StreamUtils.distinctByKey;

@Service
public class UnionSqlBuilderService {

    private final Logger log = LoggerFactory.getLogger(UnionSqlBuilderService.class);

    private final CategoryRepository categoryRepository;

    private final ItemRepository itemRepository;

    public UnionSqlBuilderService(CategoryRepository categoryRepository, ItemRepository itemRepository) {
        this.categoryRepository = categoryRepository;
        this.itemRepository = itemRepository;
    }

    public String getUnionSelectSQL(Long categoryId, String patientNo) {
        log.debug("Request to get select all query by categoryId: {}, patientNo: {}", categoryId, patientNo);
        List<Item> itemList = itemRepository.findAllByActivatedTrueAndCategoryId(categoryId);
        Category category = categoryRepository.findById(categoryId)
            .orElseThrow(AbnormalSetupException::new);

        SQL updatedListSQL = getUpdatedListSQL(category, itemList, patientNo);
        SQL notUpdatedListSQL = getOriginListSQL(category, itemList, patientNo);

        SQL sql = new SQL();
        sql.SELECT("*")
            .FROM(String.format("(%s%nUNION%n%s) AS T", updatedListSQL, notUpdatedListSQL));

        log.debug("Assembled final sql: {} ", sql);
        return sql.toString();
    }

    private SQL getUpdatedListSQL(Category category, List<Item> itemList, String patientNo) {
        String updatedTableName = category.getTitle().toUpperCase() + UPDATED_SUFFIX;

        SQL sql = new SQL();
        sql.SELECT(IDX_COLUMN).SELECT(STATUS_COLUMN);
        getMarkingColumns().forEach(sql::SELECT);
        itemList.stream().filter(distinctByKey(Item::getTitle)).forEach(item -> sql.SELECT(item.getTitle().toUpperCase()));
        sql.FROM(updatedTableName);

        sql.WHERE(String.format("PT_NO = '%s'", patientNo));

        return sql;
    }

    private SQL getOriginListSQL(Category category, List<Item> itemList, String patientNo) {
        String originTableName = category.getTitle().toUpperCase();
        String updatedTableName = originTableName + UPDATED_SUFFIX;

        SQL sql = new SQL().SELECT(IDX_COLUMN).SELECT(String.format("'%s' AS STATUS", RowStatus.NOT_STARTED));
        getMarkingColumns().stream().map(key -> String.format("NULL AS %s", key)).forEach(sql::SELECT);

        itemList.stream().filter(distinctByKey(Item::getTitle)).forEach(item -> sql.SELECT(item.getTitle().toUpperCase()));

        SQL notExistSubQuery = new SQL().SELECT("1").FROM(updatedTableName)
            .WHERE(updatedTableName + "." + IDX_COLUMN + " = " + originTableName + "." + IDX_COLUMN)
            .WHERE(getSqlEqualSyntax("PT_NO", patientNo));

        sql.FROM(originTableName).WHERE(String.format("NOT EXISTS (%s)", notExistSubQuery));

        sql.WHERE(getSqlEqualSyntax("PT_NO", patientNo));

        return sql;
    }
}
