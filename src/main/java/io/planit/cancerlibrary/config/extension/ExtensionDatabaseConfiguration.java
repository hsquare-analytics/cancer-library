package io.planit.cancerlibrary.config.extension;

import com.zaxxer.hikari.HikariDataSource;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.AutoMappingBehavior;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.type.JdbcType;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.boot.autoconfigure.SpringBootVFS;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.sql.DataSource;
import java.util.Arrays;
import java.util.HashSet;

@Configuration
@RequiredArgsConstructor
@Slf4j
@EnableTransactionManagement
@MapperScan(value = {"io.planit.cancerLibrary.dao.extension"}, sqlSessionFactoryRef = "extensionSqlSessionFactory")
public class ExtensionDatabaseConfiguration {
    private final ConfigurableApplicationContext context;

    @Value("${extension.maximum-pool-size:2}")
    private int maxPoolSize;

    @Value("${extension.multi-routing:false}")
    private Boolean isMultiRouting;

    @Value("${extension.auto-commit:true}")
    private Boolean isAutoCommit;

    private DataSource createDataSource(String driverClassName, String url, String userName, String password) {
        HikariDataSource dataSource = DataSourceBuilder
            .create()
            .type(HikariDataSource.class)
            .driverClassName(driverClassName)
            .url(url)
            .username(userName)
            .password(password)
            .build();

        dataSource.setAutoCommit(isAutoCommit);
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

    @Bean("extensionDataSource")
    @ConfigurationProperties("extension.datasource")
    public DataSource extensionDataSource() {
        return DataSourceBuilder.create()
            .type(HikariDataSource.class)
            .build();
    }

    @Bean("extensionSessionFactory")
    public SqlSessionFactory extensionSessionFactory(@Qualifier("extensionDataSource") DataSource dataSource) throws Exception {
       return createSqlSessionFactoryBean(dataSource, "mybatis/mapper/client/*.xml").getObject();
    }

    @Bean("extensionSession")
    public SqlSession extensionSession(@Autowired @Qualifier("extensionSessionFactory") SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }
}
