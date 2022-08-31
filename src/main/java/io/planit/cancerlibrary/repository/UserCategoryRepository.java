package io.planit.cancerlibrary.repository;

import io.planit.cancerlibrary.domain.UserCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@SuppressWarnings("unused")
@Repository
public interface UserCategoryRepository extends JpaRepository<UserCategory, Long> {}
