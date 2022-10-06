package io.planit.cancerlibrary.repository;

import io.planit.cancerlibrary.domain.Item;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@SuppressWarnings("unused")
@Repository
public interface ItemRepository extends JpaRepository<Item, Long> {

    List<Item> findAllByGroupCategoryId(Long id);

    List<Item> findAllByActivatedTrueAndGroupCategoryId(Long id);
}
