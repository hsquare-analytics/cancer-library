package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.repository.UserCategoryRepository;
import io.planit.cancerlibrary.service.dto.UserCategoryDTO;
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
public class UserCategoryResource {

    private final Logger log = LoggerFactory.getLogger(UserCategoryResource.class);

    private static final String ENTITY_NAME = "userCategory";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final UserCategoryRepository userCategoryRepository;

    public UserCategoryResource(UserCategoryRepository userCategoryRepository) {
        this.userCategoryRepository = userCategoryRepository;
    }

    @PostMapping("/users-categories")
    public ResponseEntity<UserCategoryDTO> createUserCategory(@Valid @RequestBody UserCategoryDTO userCategoryDTO) throws URISyntaxException {
        log.debug("REST request to save UserCategory : {}", userCategoryDTO);
        if (userCategoryDTO.getId() != null) {
            throw new BadRequestAlertException("A new userCategory cannot already have an ID", ENTITY_NAME, "idexists");
        }
        UserCategoryDTO result = new UserCategoryDTO(userCategoryRepository.save(userCategoryDTO.toEntity()));
        return ResponseEntity
            .created(new URI("/api/users-categories/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, true, ENTITY_NAME, result.getId().toString()))
            .body(result);
    }

    @PutMapping("/users-categories/{id}")
    public ResponseEntity<UserCategoryDTO> updateUserCategory(@PathVariable(value = "id", required = false) final Long id, @Valid @RequestBody UserCategoryDTO userCategoryDTO
    ) {
        log.debug("REST request to update UserCategory : {}, {}", id, userCategoryDTO);
        if (userCategoryDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, userCategoryDTO.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!userCategoryRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        UserCategoryDTO result = new UserCategoryDTO(userCategoryRepository.save(userCategoryDTO.toEntity()));
        return ResponseEntity
            .ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, userCategoryDTO.getId().toString()))
            .body(result);
    }

    @PatchMapping(value = "/users-categories/{id}", consumes = {"application/json", "application/merge-patch+json"})
    public ResponseEntity<UserCategoryDTO> partialUpdateUserCategory(
        @PathVariable(value = "id", required = false) final Long id,
        @NotNull @RequestBody UserCategoryDTO userCategoryDTO
    ) {
        log.debug("REST request to partial update UserCategory partially : {}, {}", id, userCategoryDTO);
        if (userCategoryDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, userCategoryDTO.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!userCategoryRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        Optional<UserCategoryDTO> result = userCategoryRepository
            .findById(userCategoryDTO.getId())
            .map(existingUserCategory -> {
                if (userCategoryDTO.getUser() != null) {
                    existingUserCategory.setUser(userCategoryDTO.getUser());
                }
                if (userCategoryDTO.getCategory() != null) {
                    existingUserCategory.setCategory(userCategoryDTO.getCategory());
                }

                return existingUserCategory;
            })
            .map(userCategoryRepository::save).map(UserCategoryDTO::new);

        return ResponseUtil.wrapOrNotFound(
            result,
            HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, userCategoryDTO.getId().toString())
        );
    }

    @GetMapping("/users-categories")
    public ResponseEntity<List<UserCategoryDTO>> getAllUsersCategories() {
        log.debug("REST request to get all UsersCategories");
        List<UserCategoryDTO> result = userCategoryRepository.findAll().stream().map(UserCategoryDTO::new).collect(Collectors.toList());
        return ResponseEntity.ok().body(result);
    }

    @GetMapping("/users-categories/{id}")
    public ResponseEntity<UserCategoryDTO> getUserCategory(@PathVariable Long id) {
        log.debug("REST request to get UserCategory : {}", id);
        Optional<UserCategoryDTO> result = userCategoryRepository.findById(id).map(UserCategoryDTO::new);
        return ResponseUtil.wrapOrNotFound(result);
    }

    @DeleteMapping("/users-categories/{id}")
    public ResponseEntity<Void> deleteUserCategory(@PathVariable Long id) {
        log.debug("REST request to delete UserCategory : {}", id);
        userCategoryRepository.deleteById(id);
        return ResponseEntity
            .noContent()
            .headers(HeaderUtil.createEntityDeletionAlert(applicationName, true, ENTITY_NAME, id.toString()))
            .build();
    }
}
