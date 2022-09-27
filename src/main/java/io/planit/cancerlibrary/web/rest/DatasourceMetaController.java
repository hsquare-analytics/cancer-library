package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.domain.Item;
import io.planit.cancerlibrary.repository.ItemRepository;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@Transactional
public class DatasourceMetaController {

    private final Logger log = LoggerFactory.getLogger(DatasourceMetaController.class);

    private final ItemRepository itemRepository;

    public DatasourceMetaController(ItemRepository itemRepository) {
        this.itemRepository = itemRepository;
    }

    @GetMapping("/datasource-meta/categories/{categoryId}/item-list")
    public ResponseEntity<List<Item>> getItemListByCategoryId(
        @PathVariable(value = "categoryId") final Long categoryId) {
        log.debug("REST request to get Item List by category id: {}", categoryId);

        List<Item> result = itemRepository.findAllByGroupCategoryId(categoryId);

        return ResponseEntity.ok().body(result);
    }
}
