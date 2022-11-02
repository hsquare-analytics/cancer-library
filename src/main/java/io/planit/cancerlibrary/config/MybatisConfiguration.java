package io.planit.cancerlibrary.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;

@Configuration
@MapperScan(basePackages = "io.planit.cancerlibrary.mapper")
public class MybatisConfiguration {
    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.mybatis")
    public HikariConfig mybatisHikariConfig() {
        return new HikariConfig();
    }

    @Bean
    public DataSource mybatisDatasource() {
        return new HikariDataSource(mybatisHikariConfig());
    }

    @Bean
    public SqlSessionFactory sqlSessionFactory(@Qualifier("mybatisDatasource") DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);
        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        sqlSessionFactoryBean.setMapperLocations(resolver.getResources("classpath:/config/mapper/*.xml"));
        return sqlSessionFactoryBean.getObject();
    }

    @Bean
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
        sqlSessionFactory.getConfiguration().setMapUnderscoreToCamelCase(true);
        return new SqlSessionTemplate(sqlSessionFactory);
    }

    @Bean(name = "mybatisTransactionManager")
    public DataSourceTransactionManager transactionManager(@Qualifier("mybatisDatasource") DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }
}
