package io.planit.cancerlibrary.repository;

import io.planit.cancerlibrary.domain.Category;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@SuppressWarnings("unused")
@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {

    String CATEGORIES_BY_ACTIVATED_TRUE_CACHE = "categoriesByActivatedTrue";

    @Cacheable(cacheNames = CATEGORIES_BY_ACTIVATED_TRUE_CACHE)
    List<Category> findAllByActivatedTrue();
}
