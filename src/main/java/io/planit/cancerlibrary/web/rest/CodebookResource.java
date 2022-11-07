package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.repository.CodebookRepository;
import io.planit.cancerlibrary.service.dto.CodebookDTO;
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
    public ResponseEntity<CodebookDTO> createCodebook(@Valid @RequestBody CodebookDTO codebookDTO) throws URISyntaxException {
        log.debug("REST request to save Codebook : {}", codebookDTO);
        if (codebookDTO.getId() != null) {
            throw new BadRequestAlertException("A new codebook cannot already have an ID", ENTITY_NAME, "idexists");
        }
        CodebookDTO result = new CodebookDTO(codebookRepository.save(codebookDTO.toEntity()));
        return ResponseEntity
            .created(new URI("/api/codebooks/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, true, ENTITY_NAME, result.getId().toString()))
            .body(result);
    }

    @PutMapping("/codebooks/{id}")
    public ResponseEntity<CodebookDTO> updateCodebook(@PathVariable(value = "id", required = false) final Long id, @Valid @RequestBody CodebookDTO codebookDTO) {
        log.debug("REST request to update Codebook : {}, {}", id, codebookDTO);
        if (codebookDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, codebookDTO.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!codebookRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        CodebookDTO result = new CodebookDTO(codebookRepository.save(codebookDTO.toEntity()));
        return ResponseEntity
            .ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, codebookDTO.getId().toString()))
            .body(result);
    }

    @PatchMapping(value = "/codebooks/{id}", consumes = { "application/json", "application/merge-patch+json" })
    public ResponseEntity<CodebookDTO> partialUpdateCodebook(
        @PathVariable(value = "id", required = false) final Long id,
        @NotNull @RequestBody CodebookDTO codebookDTO
    ) {
        log.debug("REST request to partial update Codebook partially : {}, {}", id, codebookDTO);
        if (codebookDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, codebookDTO.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!codebookRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        Optional<CodebookDTO> result = codebookRepository
            .findById(codebookDTO.getId())
            .map(existingCodebook -> {
                if (codebookDTO.getTitle() != null) {
                    existingCodebook.setTitle(codebookDTO.getTitle());
                }
                if (codebookDTO.getDescription() != null) {
                    existingCodebook.setDescription(codebookDTO.getDescription());
                }
                if (codebookDTO.getLookupList() != null) {
                    existingCodebook.setLookupList(codebookDTO.getLookupList());
                }

                return existingCodebook;
            })
            .map(codebookRepository::save).map(CodebookDTO::new);

        return ResponseUtil.wrapOrNotFound(
            result,
            HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, codebookDTO.getId().toString())
        );
    }

    @GetMapping("/codebooks")
    public ResponseEntity<List<CodebookDTO>> getAllCodebooks() {
        log.debug("REST request to get a page of Codebooks");
        List<CodebookDTO> result = codebookRepository.findAll().stream().map(CodebookDTO::new).collect(Collectors.toList());
        return ResponseEntity.ok().body(result);
    }

    @GetMapping("/codebooks/{id}")
    public ResponseEntity<CodebookDTO> getCodebook(@PathVariable Long id) {
        log.debug("REST request to get Codebook : {}", id);
        Optional<CodebookDTO> codebook = codebookRepository.findById(id).map(CodebookDTO::new);
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
