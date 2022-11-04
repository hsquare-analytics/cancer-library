package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.dao.DatasourceDao;
import io.planit.cancerlibrary.service.DMLSqlBuilderService;
import io.planit.cancerlibrary.service.SequenceGenerator;
import io.planit.cancerlibrary.service.UnionSqlBuilderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
@Transactional
public class DatasourceController {

    private final Logger log = LoggerFactory.getLogger(DatasourceController.class);

    private final UnionSqlBuilderService unionSqlBuilderService;

    private final DMLSqlBuilderService dmlSqlBuilderService;

    private final SequenceGenerator sequenceGenerator;

    private final DatasourceDao datasourceDao;

    public DatasourceController(UnionSqlBuilderService unionSqlBuilderService,
                                DMLSqlBuilderService dmlSqlBuilderService,
                                SequenceGenerator sequenceGenerator,
                                DatasourceDao datasourceDao) {
        this.unionSqlBuilderService = unionSqlBuilderService;
        this.datasourceDao = datasourceDao;
        this.sequenceGenerator = sequenceGenerator;
        this.dmlSqlBuilderService = dmlSqlBuilderService;
    }

    @PostMapping("/datasource/categories/{categoryId}/rows")
    public ResponseEntity<Integer> createDatasourceRow(@PathVariable Long categoryId, @RequestBody Map<String, Object> map) {
        log.debug("Request to create datasource row by categoryId: {}", categoryId);

        Map<String, Object> mapWithIdx = new HashMap<>(map);
        mapWithIdx.put("idx", sequenceGenerator.getNextSequence());

        String insertSQL = dmlSqlBuilderService.getInsertSQL(categoryId, mapWithIdx);
        Integer result = datasourceDao.executeInsertSQL(insertSQL);
        return ResponseEntity.ok().body(result);
    }

    @GetMapping("/datasource/categories/{categoryId}/rows")
    public ResponseEntity<Map<String, Object>> getDatasourceOfPatient(
        @PathVariable(value = "categoryId") final Long categoryId, String patientNo) {
        log.debug("REST request to get Datasource by category id: {}", categoryId);

        String sql = unionSqlBuilderService.getUnionSelectSQL(categoryId, patientNo);

        Map<String, Object> result = new HashMap<>();
        List<Map<String, Object>> map = datasourceDao.executeSelectSQL(sql);
        result.put("categoryId", categoryId);
        result.put("dataSource", map);

        return ResponseEntity.ok().body(result);
    }

    @GetMapping("/datasource/categories/{categoryId}/rows/{rowIdx}")
    public ResponseEntity<Map<String, Object>> getDatasourceRow(
        @PathVariable(value = "categoryId") final Long categoryId, @PathVariable(value = "rowIdx") final String rowIdx) {
        log.debug("REST request to get Datasource row by category id: {}", categoryId);

        String sql = dmlSqlBuilderService.getReadOriginRowSQL(categoryId, Map.of("idx", rowIdx));

        Map<String, Object> result = datasourceDao.executeSelectSQL(sql).get(0);

        return ResponseEntity.ok().body(result);
    }

    @PutMapping("/datasource/categories/{categoryId}/rows/{rowId}")
    public ResponseEntity<Integer> updateDatasourceRow(@PathVariable(value = "categoryId") final Long categoryId,
                                                         @PathVariable(value = "rowId") final String rowId,
                                                       @RequestBody Map<String, Object> map) {
        log.debug("REST request to inert Datasource updated row by category id: {}", categoryId);

        Map<String, Object> mapWithIdx = new HashMap<>(map);
        mapWithIdx.put("idx", rowId);

        String readSQL = dmlSqlBuilderService.getReadUpdatedRowSQL(categoryId, mapWithIdx);

        List<Map<String, Object>> founded = datasourceDao.executeSelectSQL(readSQL);

        if (founded.isEmpty()) {
            String insertSQL = dmlSqlBuilderService.getInsertSQL(categoryId, mapWithIdx);
            Integer result = datasourceDao.executeInsertSQL(insertSQL);
            return ResponseEntity.ok().body(result);
        } else {
            String updateSQL = dmlSqlBuilderService.getUpdateSQL(categoryId, mapWithIdx);
            Integer result = datasourceDao.executeUpdateSQL(updateSQL);
            return ResponseEntity.ok().body(result);
        }
    }

    @DeleteMapping("/datasource/categories/{categoryId}/rows/{rowId}")
    public ResponseEntity<Integer> deleteDatasourceRow(@PathVariable(value = "categoryId") final Long categoryId,
                                                       @PathVariable(value = "rowId") final String rowId) {
        log.debug("REST request to delete Datasource row by category id: {}", categoryId);

        String deleteSQL = dmlSqlBuilderService.getDeleteSQL(categoryId, Map.of("idx", rowId));
        Integer result = datasourceDao.executeDeleteSQL(deleteSQL);
        return ResponseEntity.ok().body(result);
    }
}
