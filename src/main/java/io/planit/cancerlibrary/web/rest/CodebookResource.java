package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.domain.Codebook;
import io.planit.cancerlibrary.repository.CodebookRepository;
import io.planit.cancerlibrary.web.rest.errors.BadRequestAlertException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import tech.jhipster.web.util.HeaderUtil;
import tech.jhipster.web.util.PaginationUtil;
import tech.jhipster.web.util.ResponseUtil;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@RestController
@RequestMapping("/api")
@Transactional
public class CodebookResource {

    private final Logger log = LoggerFactory.getLogger(CodebookResource.class);

    private static final String ENTITY_NAME = "codebook";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final CodebookRepository codebookRepository;

    public CodebookResource(CodebookRepository codebookRepository) {
        this.codebookRepository = codebookRepository;
    }

    @PostMapping("/codebooks")
    public ResponseEntity<Codebook> createCodebook(@Valid @RequestBody Codebook codebook) throws URISyntaxException {
        log.debug("REST request to save Codebook : {}", codebook);
        if (codebook.getId() != null) {
            throw new BadRequestAlertException("A new codebook cannot already have an ID", ENTITY_NAME, "idexists");
        }
        Codebook result = codebookRepository.save(codebook);
        return ResponseEntity
            .created(new URI("/api/codebooks/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, true, ENTITY_NAME, result.getId().toString()))
            .body(result);
    }

    @PutMapping("/codebooks/{id}")
    public ResponseEntity<Codebook> updateCodebook(@PathVariable(value = "id", required = false) final Long id, @Valid @RequestBody Codebook codebook) {
        log.debug("REST request to update Codebook : {}, {}", id, codebook);
        if (codebook.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, codebook.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!codebookRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        Codebook result = codebookRepository.save(codebook);
        return ResponseEntity
            .ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, codebook.getId().toString()))
            .body(result);
    }

    @PatchMapping(value = "/codebooks/{id}", consumes = { "application/json", "application/merge-patch+json" })
    public ResponseEntity<Codebook> partialUpdateCodebook(
        @PathVariable(value = "id", required = false) final Long id,
        @NotNull @RequestBody Codebook codebook
    ) {
        log.debug("REST request to partial update Codebook partially : {}, {}", id, codebook);
        if (codebook.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, codebook.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!codebookRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        Optional<Codebook> result = codebookRepository
            .findById(codebook.getId())
            .map(existingCodebook -> {
                if (codebook.getTitle() != null) {
                    existingCodebook.setTitle(codebook.getTitle());
                }
                if (codebook.getDescription() != null) {
                    existingCodebook.setDescription(codebook.getDescription());
                }
                if (codebook.getLookupList() != null) {
                    existingCodebook.setLookupList(codebook.getLookupList());
                }

                return existingCodebook;
            })
            .map(codebookRepository::save);

        return ResponseUtil.wrapOrNotFound(
            result,
            HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, codebook.getId().toString())
        );
    }

    @GetMapping("/codebooks")
    public ResponseEntity<List<Codebook>> getAllCodebooks(@org.springdoc.api.annotations.ParameterObject Pageable pageable) {
        log.debug("REST request to get a page of Codebooks");
        Page<Codebook> page = codebookRepository.findAll(pageable);
        HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(ServletUriComponentsBuilder.fromCurrentRequest(), page);
        return ResponseEntity.ok().headers(headers).body(page.getContent());
    }

    @GetMapping("/codebooks/{id}")
    public ResponseEntity<Codebook> getCodebook(@PathVariable Long id) {
        log.debug("REST request to get Codebook : {}", id);
        Optional<Codebook> codebook = codebookRepository.findById(id);
        return ResponseUtil.wrapOrNotFound(codebook);
    }

    @DeleteMapping("/codebooks/{id}")
    public ResponseEntity<Void> deleteCodebook(@PathVariable Long id) {
        log.debug("REST request to delete Codebook : {}", id);
        codebookRepository.deleteById(id);
        return ResponseEntity
            .noContent()
            .headers(HeaderUtil.createEntityDeletionAlert(applicationName, true, ENTITY_NAME, id.toString()))
            .build();
    }
}
