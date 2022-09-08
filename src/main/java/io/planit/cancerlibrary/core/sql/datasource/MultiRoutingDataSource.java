package io.planit.cancerlibrary.core.sql.datasource;

import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Profile;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;
import org.springframework.stereotype.Component;

import java.util.Map;

@Profile("!test")
@Component
@Scope("prototype")
@NoArgsConstructor
public class MultiRoutingDataSource extends AbstractRoutingDataSource {
    public MultiRoutingDataSource(Map<Object, Object> targetDataSource) {
        setTargetDataSources(targetDataSource);
    }

    @Override
    protected Object determineCurrentLookupKey() {
        // TODO : mode STANDALONE, REX
        return "LOCAL"; // STANDALONE
    }
}
