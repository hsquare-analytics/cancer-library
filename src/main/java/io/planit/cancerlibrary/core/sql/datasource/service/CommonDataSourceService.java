package io.planit.cancerlibrary.core.sql.datasource.service;

import io.planit.cancerlibrary.core.sql.datasource.dto.DataSourceDto;
import io.planit.cancerlibrary.core.sql.datasource.mapper.DataSourceMapper;
import lombok.RequiredArgsConstructor;
import org.jasypt.encryption.StringEncryptor;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CommonDataSourceService implements DataSourceService{
    private final Class<DataSourceDto> domain = DataSourceDto.class;

    @Resource(name = "jasyptStringEncryptor")
    private StringEncryptor encryptor;

    private final DataSourceMapper mapper;

    @Override
    public List<DataSourceDto> getDataSourceList(String table) {
        return mapper.getDataSourceList(domain, table)
            .stream()
            .peek(
                dataSourceDto -> {
                    dataSourceDto.setDriverNm(encryptor.decrypt(dataSourceDto.getDriverNm()));
                    dataSourceDto.setJdbcUrl(encryptor.decrypt(dataSourceDto.getJdbcUrl()));
                    dataSourceDto.setUserNm(encryptor.decrypt(dataSourceDto.getUserNm()));
                    dataSourceDto.setUserPw(encryptor.decrypt(dataSourceDto.getUserPw()));
                }
            )
            .collect(Collectors.toList());
    }
}
