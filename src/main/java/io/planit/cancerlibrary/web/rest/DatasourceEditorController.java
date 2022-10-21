package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.mapper.DatasourceMapper;
import io.planit.cancerlibrary.mapper.SQLAdapter;
import io.planit.cancerlibrary.service.DMLSqlBuilderService;
import io.planit.cancerlibrary.service.UnionSqlBuilderService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.jdbc.SQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@Transactional
public class DatasourceEditorController {

    private final Logger log = LoggerFactory.getLogger(DatasourceEditorController.class);

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

    @GetMapping("/datasource-editor/categories/{categoryId}")
    public ResponseEntity<Map<String, Object>> getDatasourceByCategoryId(
        @PathVariable(value = "categoryId") final Long categoryId, String patientNo) {
        log.debug("REST request to get Datasource by category id: {}", categoryId);

        SQL sql = unionSqlBuilderService.getUnionSelectSQL(categoryId, patientNo);

        Map<String, Object> result = new HashMap<>();
        List<Map> map = datasourceMapper.executeSelectSQL(new SQLAdapter(sql));
        result.put("categoryId", categoryId);
        result.put("dataSource", map);

        return ResponseEntity.ok().body(result);
    }

    @PutMapping("/datasource-editor/categories/{categoryId}")
    public ResponseEntity<Integer> updateDatasourceRow(@PathVariable(value = "categoryId") final Long categoryId,
        @RequestBody Map map) {
        log.debug("REST request to inert Datasource updated row by category id: {}", categoryId);

        SQL readSQL = dmlSqlBuilderService.getReadUpdatedRowSQL(categoryId, map);

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

    @GetMapping("/datasource-editor/categories/{categoryId}/row/{rowIdx}")
    public ResponseEntity<Map<String, Object>> getOriginDatasourceRowByCategoryId(
        @PathVariable(value = "categoryId") final Long categoryId, @PathVariable(value = "rowIdx") final String rowIdx) {
        log.debug("REST request to get Datasource row by category id: {}", categoryId);

        SQL sql = dmlSqlBuilderService.getReadOriginRowSQL(categoryId, Map.of("idx", rowIdx));

        Map result = datasourceMapper.executeSelectSQL(new SQLAdapter(sql)).get(0);

        return ResponseEntity.ok().body(result);
    }



}
