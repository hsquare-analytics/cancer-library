package io.planit.cancerlibrary.core.sql.datasource;

import com.zaxxer.hikari.HikariDataSource;
import io.planit.cancerlibrary.core.sql.datasource.entity.ClientDataSourceEntity;
import io.planit.cancerlibrary.core.sql.datasource.entity.InMemoryDataSourceEntities;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.AutoMappingBehavior;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.type.JdbcType;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.boot.autoconfigure.SpringBootVFS;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

import javax.sql.DataSource;
import java.util.*;

@Configuration
@RequiredArgsConstructor
@Slf4j
public class ClientDataSourceConfig {

    private final ConfigurableApplicationContext applicationContext;

    @Value("${spring.datasource.hikari.maximum-pool-size}")
    private int maxPoolSize;

    private DataSource createDataSource(String driverClassName, String url, String userName, String password) {
        HikariDataSource dataSource = DataSourceBuilder
            .create()
            .type(HikariDataSource.class)
            .driverClassName(driverClassName)
            .url(url)
            .username(userName)
            .password(password)
            .build();

        dataSource.setMaximumPoolSize(maxPoolSize);
        dataSource.setAutoCommit(true);

        return dataSource;
    }

    private org.apache.ibatis.session.Configuration getMyBatisConfig() {
        org.apache.ibatis.session.Configuration configuration = new org.apache.ibatis.session.Configuration();

        configuration.setCacheEnabled(true);
        configuration.setLazyLoadingEnabled(false);
        configuration.setAggressiveLazyLoading(false);
        configuration.setMultipleResultSetsEnabled(true);
        configuration.setUseColumnLabel(true);
        configuration.setAutoMappingBehavior(AutoMappingBehavior.PARTIAL);
        configuration.setDefaultExecutorType(ExecutorType.SIMPLE);
        configuration.setDefaultStatementTimeout(25000);
        configuration.setMapUnderscoreToCamelCase(true);
        configuration.setJdbcTypeForNull(JdbcType.NVARCHAR);
        configuration.setLazyLoadTriggerMethods(new HashSet<>(Arrays.asList("equals", "clone", "hasCode", "toString")));
        configuration.setLogPrefix("[SQL]");

        return configuration;
    }

    private SqlSessionFactoryBean createSqlSessionFactoryBean(DataSource dataSource, String mapperPath) throws Exception {
        SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
        factoryBean.setDataSource(dataSource);
        factoryBean.setVfs(SpringBootVFS.class);
        factoryBean.setConfiguration(getMyBatisConfig());
        factoryBean.setTypeHandlersPackage("com.commax.tool.framework.mybatis.typehandler");

        ResourcePatternResolver resourcePatternResolver = new PathMatchingResourcePatternResolver();
        Resource[] resources = resourcePatternResolver.getResources(mapperPath);

        factoryBean.setMapperLocations(resources);

        return factoryBean;
    }

    /*
     * Client DataSource Section
     */
    @Bean("clientSqlSessionFactory")
    public SqlSessionFactory clientDataSource() throws Exception {
        List<ClientDataSourceEntity> dataSourceEntities = InMemoryDataSourceEntities.getDataSourceList();

        Map<Object, Object> targetDataSource = new HashMap<>();

        dataSourceEntities.forEach(dataSourceEntity -> {
            targetDataSource.put(
                dataSourceEntity.getUniqueDbKey(),
                createDataSource(
                    dataSourceEntity.getDriverClassName(),
                    dataSourceEntity.getUrl(),
                    dataSourceEntity.getUsername(),
                    dataSourceEntity.getPassword()
                )
            );
        });

        DataSource dataSource =  applicationContext.getBean(AbstractRoutingDataSource.class, targetDataSource);


        return createSqlSessionFactoryBean(dataSource, "mybatis/mapper/client/*.xml").getObject();
    }

    @Bean("clientSqlSession")
    public SqlSession clientSession(@Autowired @Qualifier("clientSqlSessionFactory") SqlSessionFactory factory) {
        return new SqlSessionTemplate(factory);
    }
}
