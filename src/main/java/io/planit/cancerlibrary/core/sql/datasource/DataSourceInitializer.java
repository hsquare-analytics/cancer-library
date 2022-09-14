package io.planit.cancerlibrary.core.sql.datasource;


import io.planit.cancerlibrary.core.sql.datasource.entity.ClientDataSourceEntity;
import io.planit.cancerlibrary.core.sql.datasource.entity.InMemoryDataSourceEntities;
import io.planit.cancerlibrary.core.sql.datasource.repository.ClientDatasourceRepository;
import lombok.extern.slf4j.Slf4j;
import org.jasypt.encryption.StringEncryptor;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.List;
import java.util.stream.Collectors;

@Component("DataSourceInitializer")
@EnableJpaRepositories(
    basePackages = "io.planit.cancerlibrary.core.sql.datasource.repository",
    entityManagerFactoryRef = "serverEntityManagerFactory",
    transactionManagerRef = "serverTransactionManager"
)
@Slf4j
public class DataSourceInitializer {
    private final ClientDatasourceRepository clientDatasourceRepository;

    private final StringEncryptor encryptor;

    DataSourceInitializer(
        ClientDatasourceRepository _clientDatasourceRepository,
        @Qualifier("jasyptStringEncryptor") StringEncryptor _encryptor
    ) {
        this.clientDatasourceRepository = _clientDatasourceRepository;
        this.encryptor = _encryptor;
    }

    @PostConstruct
    public void initializeDataSource() throws Exception {
        log.info("Initialize DataSource");

        List<ClientDataSourceEntity> dataSourceList = clientDatasourceRepository.findAll();

        dataSourceList = dataSourceList
            .stream()
            .peek(
                item -> {
                    item.setDriverClassName(encryptor.decrypt(item.getDriverClassName()));
                    item.setUrl(encryptor.decrypt(item.getUrl()));
                    item.setUsername(encryptor.decrypt(item.getUsername()));
                    item.setPassword(encryptor.decrypt(item.getPassword()));
            })
            .collect(Collectors.toList());

        InMemoryDataSourceEntities.setDataSourceList(dataSourceList);

        log.info("Initialize DataSource End");
    }
}
