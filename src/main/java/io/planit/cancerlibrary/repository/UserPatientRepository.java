package io.planit.cancerlibrary.repository;

import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.domain.UserPatient;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@SuppressWarnings("unused")
@Repository
public interface UserPatientRepository extends JpaRepository<UserPatient, Long> {

    String USER_PATIENTS_BY_LOGIN_CACHE = "userPatientsByLogin";
    @Cacheable(cacheNames = USER_PATIENTS_BY_LOGIN_CACHE)
    List<UserPatient> findAllByUserLogin(String login);

    void deleteAllByUserLogin(String login);

    Integer countByUser(User user);
}
