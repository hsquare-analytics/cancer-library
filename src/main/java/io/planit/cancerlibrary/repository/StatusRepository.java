package io.planit.cancerlibrary.repository;

import io.planit.cancerlibrary.domain.Status;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StatusRepository extends JpaRepository<Status, String> {
}
