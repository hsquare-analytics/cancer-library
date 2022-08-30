package io.planit.cancerlibrary.repository;

import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.domain.Library;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@SuppressWarnings("unused")
@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {}
