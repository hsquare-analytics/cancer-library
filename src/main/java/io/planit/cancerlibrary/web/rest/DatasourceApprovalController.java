package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.mapper.DatasourceMapper;
import io.planit.cancerlibrary.mapper.SQLAdapter;
import io.planit.cancerlibrary.security.AuthoritiesConstants;
import io.planit.cancerlibrary.service.DMLSqlBuilderService;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.jdbc.SQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@Transactional
public class DatasourceApprovalController {

    private final Logger log = LoggerFactory.getLogger(SubjectResource.class);

    private final DMLSqlBuilderService dmlSqlBuilderService;

    private final DatasourceMapper datasourceMapper;

    public DatasourceApprovalController(DMLSqlBuilderService dmlSqlBuilderService,
        DatasourceMapper datasourceMapper) {
        this.datasourceMapper = datasourceMapper;
        this.dmlSqlBuilderService = dmlSqlBuilderService;
    }

    @GetMapping("/datasource-approval/{categoryId}")
    @PreAuthorize("hasAuthority(\"" + AuthoritiesConstants.ADMIN + "\")")
    public ResponseEntity<List<Map>> getDatasourceByCategoryId(
        @PathVariable(value = "categoryId") final Long categoryId) {
        log.debug("REST request to get Datasource by category id: {}", categoryId);

        SQL sql = dmlSqlBuilderService.getReadAllSQL(categoryId);

        List<Map> result = datasourceMapper.executeSelectSQL(new SQLAdapter(sql));

        return ResponseEntity.ok().body(result);
    }
}
