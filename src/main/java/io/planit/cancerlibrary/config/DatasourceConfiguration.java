package io.planit.cancerlibrary.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import javax.sql.DataSource;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

@Configuration
public class DatasourceConfiguration {

    @Bean
    @ConfigurationProperties(prefix = "spring.jpa-config.datasource")
    public HikariConfig jpaHikariConfig() {
        return new HikariConfig();
    }


    @Primary
    @Bean(name = "jpaDatasource")
    public DataSource jpaDatasource() throws Exception {
        DataSource dataSource = new HikariDataSource(jpaHikariConfig());
        return dataSource;
    }

    @Bean
    @ConfigurationProperties(prefix = "spring.mybatis-config.datasource")
    public HikariConfig mybatisHikariConfig() {
        return new HikariConfig();
    }

    @Bean(name = "mybatisDatasource")
    public DataSource mybatisDatasource() throws Exception {
        DataSource dataSource = new HikariDataSource(mybatisHikariConfig());
        return dataSource;
    }

}
