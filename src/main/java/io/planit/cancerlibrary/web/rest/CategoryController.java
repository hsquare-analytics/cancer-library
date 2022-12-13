package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.repository.CategoryRepository;
import io.planit.cancerlibrary.security.SecurityUtils;
import io.planit.cancerlibrary.service.dto.CategoryDTO;
import io.planit.cancerlibrary.web.rest.errors.AbnormalSetupException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
@Transactional
public class CategoryController {

    private final Logger log = LoggerFactory.getLogger(CategoryController.class);

    private final CategoryRepository categoryRepository;

    public CategoryController(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @GetMapping("/categories/usable-category-list")
    public ResponseEntity<List<CategoryDTO>> getUsableCategory() {
        log.debug("REST request to get accessible category by user login info: {}",
            SecurityUtils.getCurrentUserLogin());

        List<CategoryDTO> categoryList = categoryRepository.findAllByActivatedTrue().stream()
            .map(CategoryDTO::new)
            .collect(Collectors.toList());

        if (categoryList.isEmpty()) {
            throw new AbnormalSetupException();
        }
        return ResponseEntity.ok(categoryList);
    }
}
