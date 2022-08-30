package io.planit.cancerlibrary.repository;

import io.planit.cancerlibrary.domain.Library;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;

/**
 * Spring Data JPA repository for the Library entity.
 */
@SuppressWarnings("unused")
@Repository
public interface LibraryRepository extends JpaRepository<Library, Long> {}
