package io.planit.cancerlibrary.repository;

import io.planit.cancerlibrary.domain.Item;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@SuppressWarnings("unused")
@Repository
public interface ItemRepository extends JpaRepository<Item, Long> {

    String ITEMS_BY_ACTIVATED_TRUE_AND_CATEGORY_ID_CACHE = "itemsByActivatedTrueAndCategoryId";
    @Cacheable(cacheNames = ITEMS_BY_ACTIVATED_TRUE_AND_CATEGORY_ID_CACHE)
    @EntityGraph(attributePaths = {"category", "codebook.lookupList"})
    List<Item> findAllByActivatedTrueAndCategoryId(Long id);

    @EntityGraph(attributePaths = {"category", "attribute", "property"})
    List<Item> findAll();

    @EntityGraph(attributePaths = {"category", "codebook.lookupList", "attribute", "property"})
    Optional<Item> findById(Long id);
}
