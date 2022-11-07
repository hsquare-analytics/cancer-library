package io.planit.cancerlibrary.repository;

import io.planit.cancerlibrary.domain.Codebook;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@SuppressWarnings("unused")
@Repository
public interface CodebookRepository extends JpaRepository<Codebook, Long> {}
