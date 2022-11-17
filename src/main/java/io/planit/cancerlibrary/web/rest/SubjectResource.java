package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.repository.SubjectRepository;
import io.planit.cancerlibrary.service.dto.SubjectDTO;
import io.planit.cancerlibrary.web.rest.errors.BadRequestAlertException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import tech.jhipster.web.util.HeaderUtil;
import tech.jhipster.web.util.ResponseUtil;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
@Transactional
public class SubjectResource {

    private final Logger log = LoggerFactory.getLogger(SubjectResource.class);

    private static final String ENTITY_NAME = "subject";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final SubjectRepository subjectRepository;

    public SubjectResource(SubjectRepository subjectRepository) {
        this.subjectRepository = subjectRepository;
    }

    @PostMapping("/subjects")
    public ResponseEntity<SubjectDTO> createSubject(@Valid @RequestBody SubjectDTO subjectDTO) throws URISyntaxException {
        log.debug("REST request to save Subject : {}", subjectDTO);
        if (subjectDTO.getId() != null) {
            throw new BadRequestAlertException("A new subject cannot already have an ID", ENTITY_NAME, "idexists");
        }
        SubjectDTO result = new SubjectDTO(subjectRepository.save(subjectDTO.toEntity()));
        return ResponseEntity
            .created(new URI("/api/subjects/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, true, ENTITY_NAME, result.getId().toString()))
            .body(result);
    }

    @PutMapping("/subjects/{id}")
    public ResponseEntity<SubjectDTO> updateSubject(@PathVariable(value = "id", required = false) final Long id, @Valid @RequestBody SubjectDTO subjectDTO) {
        log.debug("REST request to update Subject : {}, {}", id, subjectDTO);
        if (subjectDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, subjectDTO.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!subjectRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        SubjectDTO result = new SubjectDTO(subjectRepository.save(subjectDTO.toEntity()));
        return ResponseEntity
            .ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, result.getId().toString()))
            .body(result);
    }

    @PatchMapping(value = "/subjects/{id}", consumes = {"application/json", "application/merge-patch+json"})
    public ResponseEntity<SubjectDTO> partialUpdateSubject(@PathVariable(value = "id", required = false) final Long id, @NotNull @RequestBody SubjectDTO subjectDTO) {
        log.debug("REST request to partial update Subject partially : {}, {}", id, subjectDTO);
        if (subjectDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, subjectDTO.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!subjectRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        Optional<SubjectDTO> result = subjectRepository
            .findById(subjectDTO.getId())
            .map(existingSubject -> {
                if (subjectDTO.getTitle() != null) {
                    existingSubject.setTitle(subjectDTO.getTitle());
                }
                if (subjectDTO.getActivated() != null) {
                    existingSubject.setActivated(subjectDTO.getActivated());
                }

                return existingSubject;
            })
            .map(subjectRepository::save).map(SubjectDTO::new);

        return ResponseUtil.wrapOrNotFound(
            result,
            HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, subjectDTO.getId().toString())
        );
    }

    @GetMapping("/subjects")
    public ResponseEntity<List<SubjectDTO>> getAllSubjects() {
        log.debug("REST request to get a page of Subjects");
        List<SubjectDTO> result = subjectRepository.findAll().stream().map(SubjectDTO::new).collect(Collectors.toList());
        return ResponseEntity.ok().body(result);
    }

    @GetMapping("/subjects/{id}")
    public ResponseEntity<SubjectDTO> getSubject(@PathVariable Long id) {
        log.debug("REST request to get Subject : {}", id);
        Optional<SubjectDTO> subject = subjectRepository.findById(id).map(SubjectDTO::new);
        return ResponseUtil.wrapOrNotFound(subject);
    }

    @DeleteMapping("/subjects/{id}")
    public ResponseEntity<Void> deleteSubject(@PathVariable Long id) {
        log.debug("REST request to delete Subject : {}", id);
        subjectRepository.deleteById(id);
        return ResponseEntity
            .noContent()
            .headers(HeaderUtil.createEntityDeletionAlert(applicationName, true, ENTITY_NAME, id.toString()))
            .build();
    }
}
