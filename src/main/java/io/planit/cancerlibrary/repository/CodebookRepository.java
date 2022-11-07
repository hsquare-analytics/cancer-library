package io.planit.cancerlibrary.repository;

import io.planit.cancerlibrary.domain.Codebook;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@SuppressWarnings("unused")
@Repository
public interface CodebookRepository extends JpaRepository<Codebook, Long> {
    @EntityGraph(attributePaths = {"lookupList"})
    List<Codebook> findAll();

    @EntityGraph(attributePaths = {"lookupList"})
    Optional<Codebook> findById(Long id);
}
