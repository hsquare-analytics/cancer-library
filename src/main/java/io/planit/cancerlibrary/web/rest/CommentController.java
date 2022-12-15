package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.repository.CommentRepository;
import io.planit.cancerlibrary.service.dto.CommentDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
@Transactional
public class CommentController {

    private final Logger log = LoggerFactory.getLogger(CommentController.class);

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final CommentRepository commentRepository;

    public CommentController(CommentRepository commentRepository) {
        this.commentRepository = commentRepository;
    }

    @GetMapping("/comments/categories/{categoryId}/rows/{rowId}")
    public ResponseEntity<Optional<CommentDTO>> getComment(@PathVariable Long categoryId, @PathVariable String rowId) {
        log.debug("REST request to get Comment CategoryId, RowId : {}, {}", categoryId, rowId);

        Optional<CommentDTO> comment = commentRepository.findByCategoryIdAndRowId(categoryId, rowId).map(CommentDTO::new);
        return ResponseEntity.ok(comment);
    }

    @GetMapping("/comments/categories/{categoryId}/ptNo/{ptNo}")
    public ResponseEntity<List<CommentDTO>> getAllCommentByCategoryIdAndPtNo(@PathVariable Long categoryId, @PathVariable String ptNo) {
        log.debug("REST request to get Comment CategoryId, PtNo : {}, {}", categoryId, ptNo);

        List<CommentDTO> result = commentRepository.findAllByCategoryIdAndPtNo(categoryId, ptNo).stream().map(CommentDTO::new).collect(Collectors.toList());
        return ResponseEntity.ok(result);
    }

}
