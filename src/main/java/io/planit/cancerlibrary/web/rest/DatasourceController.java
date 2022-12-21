package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.constant.RowStatus;
import io.planit.cancerlibrary.repository.SqlExecutor;
import io.planit.cancerlibrary.service.DMLSqlBuilderService;
import io.planit.cancerlibrary.service.DatasourceHeaderService;
import io.planit.cancerlibrary.service.SequenceGenerator;
import io.planit.cancerlibrary.service.UnionSqlBuilderService;
import liquibase.pro.packaged.U;
import org.apache.commons.lang3.ObjectUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import tech.jhipster.web.util.HeaderUtil;

import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static io.planit.cancerlibrary.constant.DatasourceConstants.STATUS_COLUMN;
import static io.planit.cancerlibrary.constant.DatasourceConstants.parameterization;

@RestController
@RequestMapping("/api")
@Transactional
public class DatasourceController {

    private final Logger log = LoggerFactory.getLogger(DatasourceController.class);

    private static final String ENTITY_NAME = "datasource";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final UnionSqlBuilderService unionSqlBuilderService;

    private final DMLSqlBuilderService dmlSqlBuilderService;

    private final SequenceGenerator sequenceGenerator;

    private final SqlExecutor sqlExecutor;

    private final DatasourceHeaderService datasourceHeaderService;

    public DatasourceController(UnionSqlBuilderService unionSqlBuilderService,
                                DMLSqlBuilderService dmlSqlBuilderService,
                                SequenceGenerator sequenceGenerator,
                                SqlExecutor sqlExecutor,
                                DatasourceHeaderService datasourceHeaderService) {
        this.unionSqlBuilderService = unionSqlBuilderService;
        this.sqlExecutor = sqlExecutor;
        this.sequenceGenerator = sequenceGenerator;
        this.dmlSqlBuilderService = dmlSqlBuilderService;
        this.datasourceHeaderService = datasourceHeaderService;
    }

    @PostMapping("/datasource/categories/{categoryId}/rows")
    public ResponseEntity<Boolean> createDatasourceRow(@PathVariable Long categoryId, @RequestBody Map<String, Object> map) throws URISyntaxException {
        log.debug("Request to create datasource row by categoryId: {}", categoryId);

        Map<String, Object> mapWithIdx = new HashMap<>(map);
        if (!mapWithIdx.containsKey("idx")) {
            mapWithIdx.put("idx", sequenceGenerator.getNextSequence());
        }

        String insertSQL = dmlSqlBuilderService.getInsertSQL(categoryId, mapWithIdx);
        Boolean result = sqlExecutor.executeDML(insertSQL);
        return ResponseEntity
            .created(new URI("/api/datasource/categories/" + categoryId + "/rows"))
            .headers(datasourceHeaderService.getCreateHeader(map))
            .body(result);
    }

    @GetMapping("/datasource/categories/{categoryId}/rows")
    public ResponseEntity<Map<String, Object>> getDatasourceOfPatient(
        @PathVariable(value = "categoryId") final Long categoryId, String patientNo) {
        log.debug("REST request to get Datasource by category id: {}", categoryId);

        String sql = unionSqlBuilderService.getUnionSelectSQL(categoryId, patientNo);

        Map<String, Object> result = new HashMap<>();
        List<Map<String, Object>> map = sqlExecutor.executeSelectAll(sql);
        result.put("categoryId", categoryId);
        result.put("dataSource", map);

        return ResponseEntity.ok().body(result);
    }

    @GetMapping("/datasource/categories/{categoryId}/rows/{rowIdx}")
    public ResponseEntity<Map<String, Object>> getDatasourceOriginRow(
        @PathVariable(value = "categoryId") final Long categoryId, @PathVariable(value = "rowIdx") final String rowIdx) {
        log.debug("REST request to get Datasource row by category id: {}", categoryId);

        String sql = dmlSqlBuilderService.getReadOriginRowSQL(categoryId, Map.of("idx", rowIdx));

        Map<String, Object> result = sqlExecutor.executeSelectOne(sql);

        return ResponseEntity.ok().body(result);
    }

    @GetMapping("/datasource/categories/{categoryId}/rows/{rowIdx}/check-updated-row-exist")
    public ResponseEntity<Boolean> checkUpdatedRowExist(
        @PathVariable(value = "categoryId") final Long categoryId, @PathVariable(value = "rowIdx") final String rowIdx) {
        log.debug("REST request to Check update Datasource row exist by category id: {}", categoryId);

        String sql = dmlSqlBuilderService.getReadUpdatedRowSQL(categoryId, Map.of("idx", rowIdx));

        List<Map<String, Object>> founded = sqlExecutor.executeSelectAll(sql);

        return ResponseEntity.ok().body(!founded.isEmpty());
    }

    @PutMapping("/datasource/categories/{categoryId}/rows/{rowId}")
    public ResponseEntity<Boolean> updateDatasourceRow(@PathVariable(value = "categoryId") final Long categoryId,
                                                       @PathVariable(value = "rowId") final String rowId,
                                                       @RequestBody Map<String, Object> map) {
        log.debug("REST request to inert Datasource updated row by category id: {}, row id: {}", categoryId, rowId);

        Map<String, Object> mapWithIdx = new HashMap<>(map);
        mapWithIdx.put("idx", rowId);

        String updateSQL = dmlSqlBuilderService.getUpdateSQL(categoryId, mapWithIdx);
        Boolean result = sqlExecutor.executeDML(updateSQL);
        return ResponseEntity.ok()
            .headers(datasourceHeaderService.getUpdateHeader(map))
            .body(result);
    }

    @DeleteMapping("/datasource/categories/{categoryId}/rows/{rowId}")
    public ResponseEntity<Boolean> deleteDatasourceRow(@PathVariable(value = "categoryId") final Long categoryId,
                                                       @PathVariable(value = "rowId") final String rowId,
                                                       @RequestBody Map<String, Object> map) {
        log.debug("REST request to delete Datasource row by category id: {}", categoryId);

        String sql = dmlSqlBuilderService.getReadUpdatedRowSQL(categoryId, Map.of("idx", rowId));

        Map<String, Object> founded = sqlExecutor.executeSelectOne(sql);

        Boolean result;
        if (ObjectUtils.isEmpty(founded)) {
            Map<String, Object> insertMap = new HashMap<>(map);
            insertMap.put("status", RowStatus.DISABLED);
            insertMap.remove("hosp_cd");
            String insertSQL = dmlSqlBuilderService.getInsertSQL(categoryId, insertMap);
            result = sqlExecutor.executeDML(insertSQL);
        } else {
            Map<String, Object> updateMap = Map.of("idx", rowId, "pt_no", founded.get("pt_no"), "status", RowStatus.DISABLED);
            String updateSQL = dmlSqlBuilderService.getUpdateSQL(categoryId, updateMap);
            result = sqlExecutor.executeDML(updateSQL);
        }

        return ResponseEntity.ok()
            .headers(HeaderUtil.createEntityDeletionAlert(applicationName, true, ENTITY_NAME, rowId))
            .body(result);
    }

    @PutMapping("/datasource/categories/{categoryId}/update-bulk-datasource-rows")
    public ResponseEntity<Integer> updateBulkDatasourceRows(@PathVariable(value = "categoryId") final Long categoryId,
                                                            @RequestBody List<Map<String, Object>> rows) {
        log.debug("REST request to inert Datasource updated row by category id: {}", categoryId);

        Integer result = 0;

        for (Map<String, Object> row : rows) {
            row.put("status", RowStatus.COMPLETED);
            String sql = dmlSqlBuilderService.getReadUpdatedRowSQL(categoryId, row);

            String dmlSql;
            if (ObjectUtils.isEmpty(sqlExecutor.executeSelectOne(sql))) {
                dmlSql = dmlSqlBuilderService.getInsertSQL(categoryId, row);
            } else {
                dmlSql = dmlSqlBuilderService.getUpdateSQL(categoryId, row);
            }
            if (Boolean.TRUE.equals(sqlExecutor.executeDML(dmlSql))) {
                result++;
            }
        }

        HttpHeaders headers = new HttpHeaders();
        headers.add("X-" + applicationName + "-alert", applicationName + ".datasource.updateBulkRows");
        headers.add("X-" + applicationName + "-params", result.toString());

        return ResponseEntity.ok().headers(headers).body(result);
    }
}
