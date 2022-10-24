package io.planit.cancerlibrary.service;

import io.planit.cancerlibrary.mapper.DatasourceMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SequenceGenerator {

    private final Logger log = LoggerFactory.getLogger(SequenceGenerator.class);
    private final DatasourceMapper datasourceMapper;

    private final String KCURE_PREFIX = "KCURE";

    public SequenceGenerator(DatasourceMapper datasourceMapper) {
        this.datasourceMapper = datasourceMapper;
    }

    public String getNextSequence() {
        log.debug("Request to get next sequence");

        return KCURE_PREFIX + datasourceMapper.getSequenceNextValue();
    }
}
