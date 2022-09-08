package io.planit.cancerlibrary.core.sql.datasource;

import com.zaxxer.hikari.HikariDataSource;
import io.planit.cancerlibrary.core.sql.datasource.dto.DataSourceDto;
import io.planit.cancerlibrary.core.sql.datasource.dto.InMemoryDataSourceDto;
import lombok.RequiredArgsConstructor;
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
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

import javax.sql.DataSource;
import java.util.*;

@Configuration
@RequiredArgsConstructor
public class DataSourceConfig {
    private final ConfigurableApplicationContext applicationContext;

    @Value("${spring.database.hikari.maximum-pool-size}")
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

    /* Server Section */
    @Bean("serverDataSource")
    @Qualifier("serverDataSource")
    @ConfigurationProperties(prefix="spring.datasource.hikari")
    @Primary
    public DataSource serverDataSource() {
        return DataSourceBuilder.create().type(HikariDataSource.class).build();
    }

    @Bean("serverSqlSessionFactory")
    @Primary
    public SqlSessionFactory serverSqlSessionFactory(@Autowired @Qualifier("serverDataSource") DataSource dataSource) throws Exception {
        return createSqlSessionFactoryBean(dataSource, "mapper/server/*.xml").getObject();
    }

    @Bean
    @Primary
    public SqlSession serverSession(@Autowired @Qualifier("serverSqlSessionFactory") SqlSessionFactory factory) {
        return new SqlSessionTemplate(factory);
    }

    @Bean("clientDataSource")
    @Qualifier("clientDataSource")
    public DataSource clientDataSource() {
        List<DataSourceDto> dataSourceList = InMemoryDataSourceDto.getDataSourceList();

        Map<Object, Object> targetSource = new HashMap<>();

        dataSourceList.forEach(dataSourceDto -> {
            targetSource.put(
                dataSourceDto.getUniqueDbKey(),
                createDataSource(
                    dataSourceDto.getDriverNm(),
                    dataSourceDto.getJdbcUrl(),
                    dataSourceDto.getUserNm(),
                    dataSourceDto.getUserPw()
                )
            );
        });

        return applicationContext.getBean(AbstractRoutingDataSource.class, targetSource);
    }

    @Bean("clientSqlSessionFactory")
    public SqlSessionFactory clientSqlSessionFactory(@Autowired @Qualifier("clientDataSource") DataSource dataSource) throws Exception {
        return createSqlSessionFactoryBean(dataSource, "mapper/client/*.xml").getObject();
    }

    @Bean("clientSqlSession")
    public SqlSession clientSqlSession(@Autowired @Qualifier("clientSqlSessionFactory") SqlSessionFactory factory) {
        return new SqlSessionTemplate(factory);
    }
}
