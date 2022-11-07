package io.planit.cancerlibrary.service;

import io.planit.cancerlibrary.repository.SqlExecutor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SequenceGenerator {

    private final Logger log = LoggerFactory.getLogger(SequenceGenerator.class);
    private final SqlExecutor sqlExecutor;

    private static final String KCURE_PREFIX = "KCURE";

    public SequenceGenerator(SqlExecutor sqlExecutor) {
        this.sqlExecutor = sqlExecutor;
    }

    public String getNextSequence() {
        log.debug("Request to get next sequence");

        return KCURE_PREFIX + sqlExecutor.getSequenceNextValue();
    }
}
