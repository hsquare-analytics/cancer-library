package io.planit.cancerlibrary.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateProperties;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateSettings;
import org.springframework.boot.autoconfigure.orm.jpa.JpaProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.util.Objects;

@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(
    basePackages = "io.planit.cancerlibrary.repository",
    entityManagerFactoryRef = "jpaEntityManagerFactory",
    transactionManagerRef = "jpaTransactionManager"
)
@EnableJpaAuditing(auditorAwareRef = "springSecurityAuditorAware")
public class JpaConfiguration {

    private final JpaProperties jpaProperties;

    private final HibernateProperties hibernateProperties;

    public JpaConfiguration(JpaProperties jpaProperties, HibernateProperties hibernateProperties) {
        this.jpaProperties = jpaProperties;
        this.hibernateProperties = hibernateProperties;
    }

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.jpa")
    public HikariConfig jpaHikariConfig() {
        return new HikariConfig();
    }

    @Bean
    @Primary
    public DataSource jpaDatasource() {
        return new HikariDataSource(jpaHikariConfig());
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean jpaEntityManagerFactory(EntityManagerFactoryBuilder builder, @Qualifier("jpaDatasource") DataSource dataSource) {
        var properties = hibernateProperties.determineHibernateProperties(
            jpaProperties.getProperties(), new HibernateSettings());

        return builder
            .dataSource(dataSource)
            .properties(properties)
            .packages("io.planit.cancerlibrary")
            .build();
    }

    @Bean(name = "jpaTransactionManager")
    @Primary
    public PlatformTransactionManager jpaTransactionManager(
        @Qualifier("jpaEntityManagerFactory") LocalContainerEntityManagerFactoryBean jpaEntityManagerFactory) {
        return new JpaTransactionManager(Objects.requireNonNull(jpaEntityManagerFactory.getObject()));
    }
}
