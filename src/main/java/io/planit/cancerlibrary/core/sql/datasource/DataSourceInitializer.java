package io.planit.cancerlibrary.core.sql.datasource;


import io.planit.cancerlibrary.core.sql.datasource.dto.DataSourceDto;
import io.planit.cancerlibrary.core.sql.datasource.dto.InMemoryDataSourceDto;
import io.planit.cancerlibrary.core.sql.datasource.service.DataSourceService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.List;

@Component("DataSourceInitializer")
@RequiredArgsConstructor
@Slf4j
public class DataSourceInitializer {
    private final DataSourceService dataSourceService;

    @PostConstruct
    public void initializeDataSource() throws Exception {
        log.info("Initialize DataSource");
        List<DataSourceDto> dataSourceList = dataSourceService.getDataSourceList("ar_db");
        InMemoryDataSourceDto.setDataSourceList(dataSourceList);
        log.info("Initialize DataSource End");
    }
}
