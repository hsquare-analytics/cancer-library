package io.planit.cancerlibrary.repository;

import io.planit.cancerlibrary.domain.UserPatient;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@SuppressWarnings("unused")
@Repository
public interface UserPatientRepository extends JpaRepository<UserPatient, Long> {

    List<UserPatient> findAllByUserLogin(String login);

    void deleteAllByUserLogin(String login);
}
