package io.planit.cancerlibrary.web.sample.controller;

import io.planit.cancerlibrary.core.sql.utils.DataSourceUtils;
import io.planit.cancerlibrary.web.sample.service.CommonSampleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.transaction.Transactional;

@RestController
@RequestMapping("/api")
@Transactional
@Slf4j
public class SampleController {
    @Autowired
    private CommonSampleService commonSampleService;

    @Autowired
    @Qualifier("clientSqlSession")
    private SqlSession clientSqlSession;

    @GetMapping("/sample")
    public ResponseEntity<Boolean> sample() throws Exception {
        log.debug("SAMPLE QUERY TEST");

        DataSourceUtils.setInnerUniqueDbKey("LOCALDATA");
        String one = clientSqlSession.selectOne("get");

        log.info(one);
        return ResponseEntity.ok(true);
    }
}
