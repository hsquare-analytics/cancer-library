package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.repository.CategoryRepository;
import io.planit.cancerlibrary.security.SecurityUtils;
import io.planit.cancerlibrary.web.rest.errors.ConfigurationDeficiencyException;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
    public ResponseEntity<List<Category>> getUsableCategory() {
        log.debug("REST request to get accessible category by user login info: {}",
            SecurityUtils.getCurrentUserLogin());

        List<Category> categoryList = categoryRepository.findAllByActivatedTrue();

        if (categoryList.isEmpty()) {
            throw new ConfigurationDeficiencyException("There is no usable category", "category");
        }
        return ResponseEntity.ok(categoryList);
    }
}
