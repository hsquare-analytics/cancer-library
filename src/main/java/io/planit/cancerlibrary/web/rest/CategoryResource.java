package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.repository.CategoryRepository;
import io.planit.cancerlibrary.service.dto.CategoryDTO;
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
public class CategoryResource {

    private final Logger log = LoggerFactory.getLogger(CategoryResource.class);

    private static final String ENTITY_NAME = "category";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final CategoryRepository categoryRepository;

    public CategoryResource(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @PostMapping("/categories")
    public ResponseEntity<CategoryDTO> createCategory(@Valid @RequestBody CategoryDTO categoryDTO) throws URISyntaxException {
        log.debug("REST request to save Category : {}", categoryDTO);
        if (categoryDTO.getId() != null) {
            throw new BadRequestAlertException("A new category cannot already have an ID", ENTITY_NAME, "idexists");
        }
        CategoryDTO result = new CategoryDTO(categoryRepository.save(categoryDTO.toEntity()));
        return ResponseEntity
            .created(new URI("/api/categories/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, true, ENTITY_NAME, result.getId().toString()))
            .body(result);
    }

    @PutMapping("/categories/{id}")
    public ResponseEntity<CategoryDTO> updateCategory(@PathVariable(value = "id", required = false) final Long id, @Valid @RequestBody CategoryDTO categoryDTO
    ) {
        log.debug("REST request to update Category : {}, {}", id, categoryDTO);
        if (categoryDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, categoryDTO.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!categoryRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        CategoryDTO result = new CategoryDTO(categoryRepository.save(categoryDTO.toEntity()));
        return ResponseEntity
            .ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, categoryDTO.getId().toString()))
            .body(result);
    }

    @PatchMapping(value = "/categories/{id}", consumes = {"application/json", "application/merge-patch+json"})
    public ResponseEntity<CategoryDTO> partialUpdateCategory(
        @PathVariable(value = "id", required = false) final Long id,
        @NotNull @RequestBody CategoryDTO categoryDTO
    ) {
        log.debug("REST request to partial update Category partially : {}, {}", id, categoryDTO);
        if (categoryDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, categoryDTO.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!categoryRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        Optional<CategoryDTO> result = categoryRepository
            .findById(categoryDTO.getId())
            .map(existingCategory -> {
                if (categoryDTO.getTitle() != null) {
                    existingCategory.setTitle(categoryDTO.getTitle());
                }
                if (categoryDTO.getDescription() != null) {
                    existingCategory.setDescription(categoryDTO.getDescription());
                }

                existingCategory.setActivated(categoryDTO.isActivated());

                existingCategory.property(categoryDTO.getProperty());

                return existingCategory;
            })
            .map(categoryRepository::save).map(CategoryDTO::new);

        return ResponseUtil.wrapOrNotFound(
            result,
            HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, categoryDTO.getId().toString())
        );
    }

    @GetMapping("/categories")
    public ResponseEntity<List<CategoryDTO>> getAllCategories() {
        log.debug("REST request to get all Categories");
        List<CategoryDTO> result = categoryRepository.findAll().stream().map(CategoryDTO::new).collect(Collectors.toList());
        return ResponseEntity.ok().body(result);
    }

    @GetMapping("/categories/{id}")
    public ResponseEntity<CategoryDTO> getCategory(@PathVariable Long id) {
        log.debug("REST request to get Category : {}", id);
        Optional<CategoryDTO> result = categoryRepository.findById(id).map(CategoryDTO::new);
        return ResponseUtil.wrapOrNotFound(result);
    }

    @DeleteMapping("/categories/{id}")
    public ResponseEntity<Void> deleteCategory(@PathVariable Long id) {
        log.debug("REST request to delete Category : {}", id);
        categoryRepository.deleteById(id);
        return ResponseEntity
            .noContent()
            .headers(HeaderUtil.createEntityDeletionAlert(applicationName, true, ENTITY_NAME, id.toString()))
            .build();
    }
}
