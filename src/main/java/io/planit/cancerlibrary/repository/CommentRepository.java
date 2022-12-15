package io.planit.cancerlibrary.repository;

import io.planit.cancerlibrary.domain.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {

    Optional<Comment> findByCategoryIdAndRowId(Long categoryId, String rowId);

    List<Comment> findAllByCategoryIdAndPtNo(Long categoryId, String ptNo);
}
