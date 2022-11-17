package io.planit.cancerlibrary.repository;

import io.planit.cancerlibrary.domain.DataType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DataTypeRepository extends JpaRepository<DataType, String> {
}
