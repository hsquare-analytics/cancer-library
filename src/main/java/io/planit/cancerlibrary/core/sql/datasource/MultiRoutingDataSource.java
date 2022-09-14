package io.planit.cancerlibrary.core.sql.datasource;

import io.planit.cancerlibrary.core.sql.utils.DataSourceUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Component("routingDataSource")
@Scope("prototype")
@Slf4j
public class MultiRoutingDataSource extends AbstractRoutingDataSource {
    public MultiRoutingDataSource() {
        Map<Object, Object> targetDataSource = new HashMap<>();
        setTargetDataSources(targetDataSource);
    }

    public MultiRoutingDataSource(Map<Object, Object> targetDataSource) {
        setTargetDataSources(targetDataSource);
    }

    @Override
    protected Object determineCurrentLookupKey() {
        return DataSourceUtils.getInnerUniqueDbKey(); // STANDALONE
    }
}
