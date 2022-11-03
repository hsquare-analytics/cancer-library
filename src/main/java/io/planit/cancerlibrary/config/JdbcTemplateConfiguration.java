package io.planit.cancerlibrary.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;

import javax.sql.DataSource;

@Configuration
public class JdbcTemplateConfiguration {

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.jdbc")
    public HikariConfig jdbcTemplateHikariConfig() {
        return new HikariConfig();
    }

    @Bean
    public DataSource jdbcTemplateDataSource() {
        return new HikariDataSource(jdbcTemplateHikariConfig());
    }

    @Bean
    public JdbcTemplate jdbcTemplate(@Qualifier("jdbcTemplateDataSource") DataSource dataSource) {
        return new JdbcTemplate(dataSource);
    }

    @Bean(name = "jdbcTemplateTransactionManager")
    public PlatformTransactionManager transactionManager(@Qualifier("jdbcTemplateDataSource") DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }
}
