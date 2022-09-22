package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.domain.Item;
import io.planit.cancerlibrary.mapper.DatasourceMapper;
import io.planit.cancerlibrary.mapper.SQLAdapter;
import io.planit.cancerlibrary.service.SqlBuilderService;
import java.util.List;
import java.util.Map;
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
public class DatasourceController {

    private final Logger log = LoggerFactory.getLogger(SubjectResource.class);

    private final SqlBuilderService sqlBuilderService;

    private final DatasourceMapper datasourceMapper;

    public DatasourceController(SqlBuilderService sqlBuilderService,
        DatasourceMapper datasourceMapper) {
        this.sqlBuilderService = sqlBuilderService;
        this.datasourceMapper = datasourceMapper;
    }

    @GetMapping("/datasource/{categoryId}")
    public ResponseEntity<List<Map>> getDatasourceByCategoryId(
        @PathVariable(value = "categoryId") final Long categoryId) {
        log.debug("REST request to get Datasource by category id: {}", categoryId);

        String sql = sqlBuilderService.getUnionSelectSQL(categoryId).toString();

        List<Map> result = datasourceMapper.executeSelectSQL(new SQLAdapter(sql));

        return ResponseEntity.ok().body(result);
    }

    @PostMapping("/datasource/{categoryId}")
    public ResponseEntity<Integer> updateDatasourceRow(@PathVariable(value = "categoryId") final Long categoryId,
        @RequestBody Map map) {
        log.debug("REST request to inert Datasource updated row by category id: {}", categoryId);

        String sql = sqlBuilderService.getInsertSQL(categoryId, map);

        Integer result = datasourceMapper.executeInsertSQL(new SQLAdapter(sql));

        return ResponseEntity.ok().body(result);
    }

    @GetMapping("/datasource/{categoryId}/item-list")
    public ResponseEntity<List<Item>> getItemListByCategoryId(
        @PathVariable(value = "categoryId") final Long categoryId) {
        log.debug("REST request to get Item List by category id: {}", categoryId);

        List<Item> result = sqlBuilderService.getItemListByCategoryId(categoryId);

        return ResponseEntity.ok().body(result);
    }
}
