package io.planit.cancerlibrary.core.sql.datasource.repository;

import io.planit.cancerlibrary.core.sql.datasource.entity.ClientDataSourceEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClientDatasourceRepository extends JpaRepository<ClientDataSourceEntity, Long> {
}
