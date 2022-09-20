package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.mapper.DatasourceMapper;
import io.planit.cancerlibrary.mapper.SQLAdapter;
import io.planit.cancerlibrary.repository.UserRepository;
import io.planit.cancerlibrary.security.SecurityUtils;
import io.planit.cancerlibrary.service.SqlBuilderService;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@Transactional
public class DatasourceController {

    private final Logger log = LoggerFactory.getLogger(SubjectResource.class);

    private final UserRepository userRepository;

    private final SqlBuilderService sqlBuilderService;

    private final DatasourceMapper datasourceMapper;

    public DatasourceController(UserRepository userRepository, SqlBuilderService sqlBuilderService,
        DatasourceMapper datasourceMapper) {
        this.userRepository = userRepository;
        this.sqlBuilderService = sqlBuilderService;
        this.datasourceMapper = datasourceMapper;
    }

    @GetMapping("/datasources/{categoryId}")
    public ResponseEntity<List<Map>> getDatasourceByCategoryId(@PathVariable(value = "categoryId") final Long categoryId) {
        log.debug("REST request to get Datasource by category id: {}", categoryId);

        String login = SecurityUtils.getCurrentUserLogin()
            .orElseThrow(() -> new RuntimeException("Current user login not found"));
        User user = userRepository.findOneByLogin(login).orElseThrow(() -> new RuntimeException("User not found"));

        String sql = sqlBuilderService.getSelectAllQueryByUserIdAndCategoryId(user.getId(), categoryId);

        List<Map> result = datasourceMapper.excuteSqlSelect(new SQLAdapter(sql));

        return ResponseEntity.ok().body(result);
    }

}
