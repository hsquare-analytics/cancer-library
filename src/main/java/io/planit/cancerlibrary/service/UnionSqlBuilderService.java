package io.planit.cancerlibrary.service;

import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.domain.Item;
import io.planit.cancerlibrary.repository.CategoryRepository;
import io.planit.cancerlibrary.repository.ItemRepository;
import io.planit.cancerlibrary.web.rest.errors.ConfigurationDeficiencyBaseException;
import org.apache.ibatis.jdbc.SQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static io.planit.cancerlibrary.constant.DatasourceConstants.*;

@Service
@Transactional
public class UnionSqlBuilderService {

    private final Logger log = LoggerFactory.getLogger(UnionSqlBuilderService.class);

    private final CategoryRepository categoryRepository;

    private final ItemRepository itemRepository;

    public UnionSqlBuilderService(CategoryRepository categoryRepository, ItemRepository itemRepository) {
        this.categoryRepository = categoryRepository;
        this.itemRepository = itemRepository;
    }

    public SQL getUnionSelectSQL(Long categoryId, String patientNo) {
        log.debug("Request to get select all query by categoryId: {}, patientNo: {}", categoryId, patientNo);
        List<Item> itemList = itemRepository.findAllByCategoryId(categoryId);
        Category category = categoryRepository.findById(categoryId)
            .orElseThrow(() -> new ConfigurationDeficiencyBaseException("Category not found", "category"));

        SQL updatedListSQL = getUpdatedListSQL(category, itemList, patientNo);
        SQL notUpdatedListSQL = getNotUpdatedListSQL(category, itemList, patientNo);

        SQL sql = new SQL();
        sql.SELECT("*")
            .FROM(String.format("(%s%nUNION%n%s) AS T", updatedListSQL, notUpdatedListSQL))
            .ORDER_BY(IDX_COLUMN);

        log.debug("Assembled final sql: {} ", sql);
        return sql;
    }

    private SQL getUpdatedListSQL(Category category, List<Item> itemList, String patientNo) {
        String updatedTableName = category.getTitle().toUpperCase() + UPDATED_SUFFIX;

        SQL sql = new SQL();
        sql.SELECT(IDX_COLUMN);
        getMarkingColumns().forEach(sql::SELECT);
        itemList.forEach(item -> sql.SELECT(item.getTitle().toUpperCase()));
        sql.FROM(updatedTableName);

        sql.WHERE(String.format("PT_NO IN ('%s')", patientNo));

        return sql;
    }

    private SQL getNotUpdatedListSQL(Category category, List<Item> itemList, String patientNo) {
        String originTableName = category.getTitle().toUpperCase();
        String updatedTableName = originTableName + UPDATED_SUFFIX;

        SQL excludeIdxSubQuery = new SQL().SELECT(IDX_COLUMN).FROM(updatedTableName);

        SQL sql = new SQL().SELECT(IDX_COLUMN);
        getMarkingColumns().stream().map(key -> String.format("NULL AS %s", key)).forEach(sql::SELECT);

        itemList.forEach(item -> sql.SELECT(item.getTitle().toUpperCase()));
        sql.FROM(originTableName)
            .WHERE(String.format("%s NOT IN (%s)", IDX_COLUMN, excludeIdxSubQuery));

        sql.WHERE(String.format("PT_NO IN ('%s')", patientNo));

        return sql;
    }

}
