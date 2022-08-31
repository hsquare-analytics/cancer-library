package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.domain.Library;
import io.planit.cancerlibrary.repository.LibraryRepository;
import io.planit.cancerlibrary.web.rest.errors.BadRequestAlertException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import tech.jhipster.web.util.HeaderUtil;
import tech.jhipster.web.util.ResponseUtil;

/**
 * REST controller for managing {@link io.planit.cancerlibrary.domain.Library}.
 */
@RestController
@RequestMapping("/api")
@Transactional
public class LibraryResource {

    private final Logger log = LoggerFactory.getLogger(LibraryResource.class);

    private static final String ENTITY_NAME = "library";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final LibraryRepository libraryRepository;

    public LibraryResource(LibraryRepository libraryRepository) {
        this.libraryRepository = libraryRepository;
    }

    /**
     * {@code POST  /libraries} : Create a new library.
     *
     * @param library the library to create.
     * @return the {@link ResponseEntity} with status {@code 201 (Created)} and with body the new library, or with status {@code 400 (Bad Request)} if the library has already an ID.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PostMapping("/libraries")
    public ResponseEntity<Library> createLibrary(@Valid @RequestBody Library library) throws URISyntaxException {
        log.debug("REST request to save Library : {}", library);
        if (library.getId() != null) {
            throw new BadRequestAlertException("A new library cannot already have an ID", ENTITY_NAME, "idexists");
        }
        Library result = libraryRepository.save(library);
        return ResponseEntity
            .created(new URI("/api/libraries/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, true, ENTITY_NAME, result.getId().toString()))
            .body(result);
    }

    /**
     * {@code PUT  /libraries/:id} : Updates an existing library.
     *
     * @param id the id of the library to save.
     * @param library the library to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated library,
     * or with status {@code 400 (Bad Request)} if the library is not valid,
     * or with status {@code 500 (Internal Server Error)} if the library couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PutMapping("/libraries/{id}")
    public ResponseEntity<Library> updateLibrary(
        @PathVariable(value = "id", required = false) final Long id,
        @Valid @RequestBody Library library
    ) throws URISyntaxException {
        log.debug("REST request to update Library : {}, {}", id, library);
        if (library.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, library.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!libraryRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        Library result = libraryRepository.save(library);
        return ResponseEntity
            .ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, library.getId().toString()))
            .body(result);
    }

    /**
     * {@code PATCH  /libraries/:id} : Partial updates given fields of an existing library, field will ignore if it is null
     *
     * @param id the id of the library to save.
     * @param library the library to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated library,
     * or with status {@code 400 (Bad Request)} if the library is not valid,
     * or with status {@code 404 (Not Found)} if the library is not found,
     * or with status {@code 500 (Internal Server Error)} if the library couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PatchMapping(value = "/libraries/{id}", consumes = { "application/json", "application/merge-patch+json" })
    public ResponseEntity<Library> partialUpdateLibrary(
        @PathVariable(value = "id", required = false) final Long id,
        @NotNull @RequestBody Library library
    ) throws URISyntaxException {
        log.debug("REST request to partial update Library partially : {}, {}", id, library);
        if (library.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, library.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!libraryRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        Optional<Library> result = libraryRepository
            .findById(library.getId())
            .map(existingLibrary -> {
                if (library.getTitle() != null) {
                    existingLibrary.setTitle(library.getTitle());
                }
                if (library.getDescription() != null) {
                    existingLibrary.setDescription(library.getDescription());
                }
                if (library.getActivated() != null) {
                    existingLibrary.setActivated(library.getActivated());
                }

                return existingLibrary;
            })
            .map(libraryRepository::save);

        return ResponseUtil.wrapOrNotFound(
            result,
            HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, library.getId().toString())
        );
    }

    /**
     * {@code GET  /libraries} : get all the libraries.
     *
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and the list of libraries in body.
     */
    @GetMapping("/libraries")
    public List<Library> getAllLibraries() {
        log.debug("REST request to get all Libraries");
        return libraryRepository.findAll();
    }

    /**
     * {@code GET  /libraries/:id} : get the "id" library.
     *
     * @param id the id of the library to retrieve.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the library, or with status {@code 404 (Not Found)}.
     */
    @GetMapping("/libraries/{id}")
    public ResponseEntity<Library> getLibrary(@PathVariable Long id) {
        log.debug("REST request to get Library : {}", id);
        Optional<Library> library = libraryRepository.findById(id);
        return ResponseUtil.wrapOrNotFound(library);
    }

    /**
     * {@code DELETE  /libraries/:id} : delete the "id" library.
     *
     * @param id the id of the library to delete.
     * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
     */
    @DeleteMapping("/libraries/{id}")
    public ResponseEntity<Void> deleteLibrary(@PathVariable Long id) {
        log.debug("REST request to delete Library : {}", id);
        libraryRepository.deleteById(id);
        return ResponseEntity
            .noContent()
            .headers(HeaderUtil.createEntityDeletionAlert(applicationName, true, ENTITY_NAME, id.toString()))
            .build();
    }
}
