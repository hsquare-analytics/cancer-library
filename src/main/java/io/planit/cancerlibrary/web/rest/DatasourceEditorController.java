package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.domain.Item;
import io.planit.cancerlibrary.mapper.DatasourceMapper;
import io.planit.cancerlibrary.mapper.SQLAdapter;
import io.planit.cancerlibrary.service.DMLSqlBuilderService;
import io.planit.cancerlibrary.service.UnionSqlBuilderService;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.jdbc.SQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@Transactional
public class DatasourceEditorController {

    private final Logger log = LoggerFactory.getLogger(SubjectResource.class);

    private final UnionSqlBuilderService unionSqlBuilderService;

    private final DMLSqlBuilderService dmlSqlBuilderService;

    private final DatasourceMapper datasourceMapper;

    public DatasourceEditorController(UnionSqlBuilderService unionSqlBuilderService,
        DMLSqlBuilderService dmlSqlBuilderService,
        DatasourceMapper datasourceMapper) {
        this.unionSqlBuilderService = unionSqlBuilderService;
        this.datasourceMapper = datasourceMapper;
        this.dmlSqlBuilderService = dmlSqlBuilderService;
    }

    @GetMapping("/datasource-editor/{categoryId}")
    public ResponseEntity<List<Map>> getDatasourceByCategoryId(
        @PathVariable(value = "categoryId") final Long categoryId) {
        log.debug("REST request to get Datasource by category id: {}", categoryId);

        SQL sql = unionSqlBuilderService.getUnionSelectSQL(categoryId);

        List<Map> result = datasourceMapper.executeSelectSQL(new SQLAdapter(sql));

        return ResponseEntity.ok().body(result);
    }

    @PostMapping("/datasource-editor/{categoryId}")
    public ResponseEntity<Integer> updateDatasourceRow(@PathVariable(value = "categoryId") final Long categoryId,
        @RequestBody Map map) {
        log.debug("REST request to inert Datasource updated row by category id: {}", categoryId);

        SQL readSQL = dmlSqlBuilderService.getReadSQL(categoryId, map);

        List<Map> founded = datasourceMapper.executeSelectSQL(new SQLAdapter(readSQL));

        if (founded.isEmpty()) {
            SQL insertSQL = dmlSqlBuilderService.getInsertSQL(categoryId, map);
            Integer result = datasourceMapper.executeInsertSQL(new SQLAdapter(insertSQL));
            return ResponseEntity.ok().body(result);
        } else {
            SQL updateSQL = dmlSqlBuilderService.getUpdateSQL(categoryId, map);
            Integer result = datasourceMapper.executeUpdateSQL(new SQLAdapter(updateSQL));
            return ResponseEntity.ok().body(result);
        }
    }

    @GetMapping("/datasource-editor/{categoryId}/item-list")
    public ResponseEntity<List<Item>> getItemListByCategoryId(
        @PathVariable(value = "categoryId") final Long categoryId) {
        log.debug("REST request to get Item List by category id: {}", categoryId);

        List<Item> result = unionSqlBuilderService.getItemListByCategoryId(categoryId);

        return ResponseEntity.ok().body(result);
    }
}
