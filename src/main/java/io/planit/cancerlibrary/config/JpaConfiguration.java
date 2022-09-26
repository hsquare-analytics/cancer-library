package io.planit.cancerlibrary.config;

import java.util.Objects;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(
    basePackages = "io.planit.cancerlibrary.repository",
    entityManagerFactoryRef = "jpaEntityManagerFactory",
    transactionManagerRef = "jpaTransactionManager"
)
@EnableJpaAuditing(auditorAwareRef = "springSecurityAuditorAware")
public class JpaConfiguration {
    @Bean
    public LocalContainerEntityManagerFactoryBean jpaEntityManagerFactory(EntityManagerFactoryBuilder builder, @Qualifier("jpaDatasource") DataSource dataSource) {
        return builder
            .dataSource(dataSource)
            .packages("io.planit.cancerlibrary.domain")
            .build();
    }

    @Bean
    public PlatformTransactionManager jpaTransactionManager( @Qualifier("jpaEntityManagerFactory") LocalContainerEntityManagerFactoryBean jpaEntityManagerFactory) {
        return new JpaTransactionManager(Objects.requireNonNull(jpaEntityManagerFactory.getObject()));
    }
}
