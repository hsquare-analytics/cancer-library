package io.planit.cancerlibrary.config;

import java.time.Duration;

import io.planit.cancerlibrary.repository.PatientRepository;
import org.ehcache.config.builders.*;
import org.ehcache.jsr107.Eh107Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.cache.JCacheManagerCustomizer;
import org.springframework.boot.info.BuildProperties;
import org.springframework.boot.info.GitProperties;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.context.annotation.*;
import tech.jhipster.config.JHipsterProperties;
import tech.jhipster.config.cache.PrefixedKeyGenerator;

@Configuration
@EnableCaching
public class CacheConfiguration {

    private GitProperties gitProperties;
    private BuildProperties buildProperties;
    private final javax.cache.configuration.Configuration<Object, Object> jcacheConfiguration;

    public CacheConfiguration(JHipsterProperties jHipsterProperties) {
        JHipsterProperties.Cache.Ehcache ehcache = jHipsterProperties.getCache().getEhcache();

        jcacheConfiguration =
            Eh107Configuration.fromEhcacheCacheConfiguration(
                CacheConfigurationBuilder
                    .newCacheConfigurationBuilder(Object.class, Object.class, ResourcePoolsBuilder.heap(ehcache.getMaxEntries()))
                    .withExpiry(ExpiryPolicyBuilder.timeToLiveExpiration(Duration.ofSeconds(ehcache.getTimeToLiveSeconds())))
                    .build()
            );
    }

    @Bean
    public JCacheManagerCustomizer cacheManagerCustomizer() {
        return cm -> {
            createCache(cm, io.planit.cancerlibrary.repository.UserRepository.USERS_BY_LOGIN_CACHE);
            createCache(cm, io.planit.cancerlibrary.repository.UserRepository.USERS_BY_EMAIL_CACHE);
            // jhipster-needle-ehcache-add-entry
            createCache(cm, io.planit.cancerlibrary.repository.CategoryRepository.CATEGORIES_BY_ACTIVATED_TRUE_CACHE);
            createCache(cm, io.planit.cancerlibrary.repository.ItemRepository.ITEMS_BY_ACTIVATED_TRUE_AND_CATEGORY_ID_CACHE);
            createCache(cm, io.planit.cancerlibrary.repository.UserPatientRepository.USER_PATIENTS_BY_LOGIN_CACHE);
            createCache(cm, PatientRepository.PATIENTS_CACHES);
            createCache(cm, PatientRepository.PATIENTS_BY_PT_NOS_CACHE);
        };
    }

    private void createCache(javax.cache.CacheManager cm, String cacheName) {
        javax.cache.Cache<Object, Object> cache = cm.getCache(cacheName);
        if (cache != null) {
            cache.clear();
        } else {
            cm.createCache(cacheName, jcacheConfiguration);
        }
    }

    @Autowired(required = false)
    public void setGitProperties(GitProperties gitProperties) {
        this.gitProperties = gitProperties;
    }

    @Autowired(required = false)
    public void setBuildProperties(BuildProperties buildProperties) {
        this.buildProperties = buildProperties;
    }

    @Bean
    public KeyGenerator keyGenerator() {
        return new PrefixedKeyGenerator(this.gitProperties, this.buildProperties);
    }
}
