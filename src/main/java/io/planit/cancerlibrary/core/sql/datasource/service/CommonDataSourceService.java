package io.planit.cancerlibrary.core.sql.datasource.service;

import io.planit.cancerlibrary.core.sql.datasource.dto.DataSourceDto;
import io.planit.cancerlibrary.core.sql.datasource.mapper.DataSourceMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CommonDataSourceService implements DataSourceService{
    private final Class<DataSourceDto> domain = DataSourceDto.class;

    private final DataSourceMapper mapper;

    @Override
    public List<DataSourceDto> getDataSourceList(String table) {
        return mapper.getDataSourceList(domain, table);
    }
}
