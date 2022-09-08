package io.planit.cancerlibrary.core.sql.datasource;


import io.planit.cancerlibrary.core.sql.datasource.dto.DataSourceDto;
import io.planit.cancerlibrary.core.sql.datasource.dto.InMemoryDataSourceDto;
import io.planit.cancerlibrary.core.sql.datasource.service.DataSourceService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.List;

@Component
@RequiredArgsConstructor
public class DataSourceInitializer {
    private final DataSourceService dataSourceService;

    @PostConstruct
    public void initializeDataSource() {
        List<DataSourceDto> dataSourceList = dataSourceService.getDataSourceList("ar_db");

        InMemoryDataSourceDto.setDataSourceList(dataSourceList);
    }
}
