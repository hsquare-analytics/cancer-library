package io.planit.cancerlibrary.service;

import io.planit.cancerlibrary.dao.DatasourceDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SequenceGenerator {

    private final Logger log = LoggerFactory.getLogger(SequenceGenerator.class);
    private final DatasourceDao datasourceDao;

    private static final String KCURE_PREFIX = "KCURE";

    public SequenceGenerator(DatasourceDao datasourceDao) {
        this.datasourceDao = datasourceDao;
    }

    public String getNextSequence() {
        log.debug("Request to get next sequence");

        return KCURE_PREFIX + datasourceDao.getSequenceNextValue();
    }
}
