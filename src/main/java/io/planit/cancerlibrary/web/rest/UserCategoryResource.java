package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.domain.UserCategory;
import io.planit.cancerlibrary.repository.UserCategoryRepository;
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
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tech.jhipster.web.util.HeaderUtil;
import tech.jhipster.web.util.ResponseUtil;

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
    public ResponseEntity<UserCategory> createUserCategory(@Valid @RequestBody UserCategory userCategory) throws URISyntaxException {
        log.debug("REST request to save UserCategory : {}", userCategory);
        if (userCategory.getId() != null) {
            throw new BadRequestAlertException("A new userCategory cannot already have an ID", ENTITY_NAME, "idexists");
        }
        UserCategory result = userCategoryRepository.save(userCategory);
        return ResponseEntity
            .created(new URI("/api/users-categories/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, true, ENTITY_NAME, result.getId().toString()))
            .body(result);
    }

//    @PutMapping("/categories/{id}")
//    public ResponseEntity<UserCategory> updateUserCategory(
//        @PathVariable(value = "id", required = false) final Long id,
//        @Valid @RequestBody UserCategory userCategory
//    ) throws URISyntaxException {
//        log.debug("REST request to update UserCategory : {}, {}", id, userCategory);
//        if (userCategory.getId() == null) {
//            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
//        }
//        if (!Objects.equals(id, userCategory.getId())) {
//            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
//        }
//
//        if (!userCategoryRepository.existsById(id)) {
//            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
//        }
//
//        UserCategory result = userCategoryRepository.save(userCategory);
//        return ResponseEntity
//            .ok()
//            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, userCategory.getId().toString()))
//            .body(result);
//    }
//
//    @PatchMapping(value = "/categories/{id}", consumes = { "application/json", "application/merge-patch+json" })
//    public ResponseEntity<UserCategory> partialUpdateUserCategory(
//        @PathVariable(value = "id", required = false) final Long id,
//        @NotNull @RequestBody UserCategory userCategory
//    ) throws URISyntaxException {
//        log.debug("REST request to partial update UserCategory partially : {}, {}", id, userCategory);
//        if (userCategory.getId() == null) {
//            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
//        }
//        if (!Objects.equals(id, userCategory.getId())) {
//            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
//        }
//
//        if (!userCategoryRepository.existsById(id)) {
//            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
//        }
//
//        Optional<UserCategory> result = userCategoryRepository
//            .findById(userCategory.getId())
//            .map(existingUserCategory -> {
//                if (userCategory.getTitle() != null) {
//                    existingUserCategory.setTitle(userCategory.getTitle());
//                }
//                if (userCategory.getDescription() != null) {
//                    existingUserCategory.setDescription(userCategory.getDescription());
//                }
//                if (userCategory.getActivated() != null) {
//                    existingUserCategory.setActivated(userCategory.getActivated());
//                }
//
//                return existingUserCategory;
//            })
//            .map(userCategoryRepository::save);
//
//        return ResponseUtil.wrapOrNotFound(
//            result,
//            HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, userCategory.getId().toString())
//        );
//    }
//
//    @GetMapping("/categories")
//    public ResponseEntity<List<UserCategory>> getAllCategories() {
//        log.debug("REST request to get all Categories");
//        List<UserCategory> result = userCategoryRepository.findAll();
//        return ResponseEntity.ok().body(result);
//    }
//
//    @GetMapping("/categories/{id}")
//    public ResponseEntity<UserCategory> getUserCategory(@PathVariable Long id) {
//        log.debug("REST request to get UserCategory : {}", id);
//        Optional<UserCategory> userCategory = userCategoryRepository.findById(id);
//        return ResponseUtil.wrapOrNotFound(userCategory);
//    }
//
//    @DeleteMapping("/categories/{id}")
//    public ResponseEntity<Void> deleteUserCategory(@PathVariable Long id) {
//        log.debug("REST request to delete UserCategory : {}", id);
//        userCategoryRepository.deleteById(id);
//        return ResponseEntity
//            .noContent()
//            .headers(HeaderUtil.createEntityDeletionAlert(applicationName, true, ENTITY_NAME, id.toString()))
//            .build();
//    }
}
