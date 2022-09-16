package io.planit.cancerlibrary.core.sql.datasource;

import com.zaxxer.hikari.HikariDataSource;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.*;
import org.springframework.core.env.Environment;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;

import javax.sql.DataSource;
import java.util.*;

@Configuration
@RequiredArgsConstructor
@Slf4j
public class ServerDataSourceConfig {

    private final Environment env;

    @Bean("serverDataSource")
    @Qualifier("serverDataSource")
    @ConfigurationProperties(prefix = "spring.datasource.hikari")
    @Primary
    public DataSource serverDataSource() {
        return DataSourceBuilder.create()
            .type(HikariDataSource.class)
            .build();
    }

    @Bean("serverEntityManagerFactory")
    @Primary
    public LocalContainerEntityManagerFactoryBean serverEntityManagerFactory(@Qualifier("serverDataSource") DataSource dataSource) {
        LocalContainerEntityManagerFactoryBean em = new LocalContainerEntityManagerFactoryBean();

        em.setDataSource(dataSource);
        em.setPackagesToScan(
            "io.planit.cancerlibrary.core.sql.datasource.entity",
            "io.planit.cancerlibrary.domain",
            "io.planit.cancerlibrary.repository.timezone"
        );

        em.setJpaVendorAdapter(new HibernateJpaVendorAdapter());

        HashMap<String, Object> properties = new HashMap<>();
        properties.put(
            "hibernate.jdbc.time_zone" , env.getProperty("spring.jpa.properties.hibernate.jdbc.time_zone", "UTC")
        );
        properties.put(
            "hibernate.id.new_generator_mappings" , env.getProperty("spring.jpa.properties.hibernate.id.new_generator_mappings", "true")
        );
        properties.put(
            "hibernate.connection.provider_disables_autocommit" , env.getProperty("spring.jpa.properties.hibernate.connection.provider_disables_autocommit", "true")
        );
        properties.put(
            "hibernate.cache.use_second_level_cache" , env.getProperty("spring.jpa.properties.hibernate.cache.use_second_level_cache", "false")
        );
        properties.put(
            "hibernate.cache.use_query_cache" , env.getProperty("spring.jpa.properties.hibernate.cache.use_query_cache", "false")
        );
        properties.put(
            "hibernate.generate_statistics", env.getProperty("spring.jpa.properties.hibernate.generate_statistics", "false")
        );
        properties.put(
            "hibernate.jdbc.batch_size", env.getProperty("sprig.jpa.properties.hibernate.jdbc.batch_size", "25")
        );
        properties.put(
            "hibernate.order_inserts", env.getProperty("spring.jpa.properties.hibernate.order_inserts", "true")
        );
        properties.put(
            "hibernate.order_updates", env.getProperty("spring.jpa.properties.hibernate.order_updates", "true")
        );
        properties.put(
            "hibernate.query.fail_on_pagination_over_collection_fetch", env.getProperty("spring.jpa.properties.hibernate.query.fail_on_pagination_over_collection_fetch", "true")
        );
        properties.put(
            "hibernate.query.in_clause_parameter_padding", env.getProperty("spring.jpa.properties.hibernate.query.in_clause_parameter_padding", "true")
        );
        properties.put(
            "hibernate.ddl-auto", env.getProperty("spring.jpa.hibernate.ddl-auto", "none")
        );

        properties.put(
            "hibernate.physical_naming_strategy", env.getProperty("spring.jpa.hibernate.naming.physical-strategy", "org.springframework.boot.orm.jpa.hibernate.SpringPhysicalNamingStrategy")
        );
        properties.put(
            "hibernate.implicit_naming_strategy", env.getProperty("spring.jpa.hibernate.naming.implicit-strategy", "org.springframework.boot.orm.jpa.hibernate.SpringImplicitNamingStrategy")
        );
        em.setJpaPropertyMap(properties);

        return em;
    }

    @Bean("serverTransactionManager")
    public PlatformTransactionManager serverTransactionManager(
        @Qualifier("serverEntityManagerFactory") LocalContainerEntityManagerFactoryBean localContainerEntityManagerFactoryBean
    ) {
        JpaTransactionManager transactionManager = new JpaTransactionManager();

        transactionManager.setEntityManagerFactory(localContainerEntityManagerFactoryBean.getObject());

        return transactionManager;
    }
}
