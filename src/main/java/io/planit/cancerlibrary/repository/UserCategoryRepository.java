package io.planit.cancerlibrary.repository;

import io.planit.cancerlibrary.domain.UserCategory;
import java.time.Instant;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@SuppressWarnings("unused")
@Repository
public interface UserCategoryRepository extends JpaRepository<UserCategory, Long> {

    List<UserCategory> findAllByActivatedTrueAndUserLogin(String login);

    List<UserCategory> findAllByActivatedTrueAndUserLoginAndCategoryId(String login, Long categoryId);

    @Query("select uc from UserCategory uc where uc.user.id= :userId and uc.termStart <= :currentTime and uc.termEnd >= :currentTime")
    List<UserCategory> findAllByUserIdAndCurrentTime(@Param("userId") Long userId,
        @Param("currentTime") Instant currentTime);

    @Query("select uc from UserCategory uc where uc.user.id= :userId and uc.category.id = :categoryId and uc.termStart <= :currentTime and uc.termEnd >= :currentTime")
    List<UserCategory> findAllByUserIdAndAndCategoryIdCurrentTime(@Param("userId") Long userId,
        @Param("categoryId") Long categoryId, @Param("currentTime") Instant currentTime);
}
