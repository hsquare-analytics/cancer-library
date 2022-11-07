package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.repository.ItemRepository;
import io.planit.cancerlibrary.service.dto.ItemDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.query.Param;
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
public class ItemController {

    private final Logger log = LoggerFactory.getLogger(ItemController.class);

    private final ItemRepository itemRepository;

    public ItemController(ItemRepository itemRepository) {
        this.itemRepository = itemRepository;
    }

    @GetMapping("/items/usable-item-list")
    public ResponseEntity<List<ItemDTO>> getItemListByCategoryId(@Param("categoryId") Long categoryId) {
        log.debug("REST request to get Item List by category id: {}", categoryId);

        List<ItemDTO> result = itemRepository.findAllByActivatedTrueAndCategoryId(categoryId).stream()
            .map(ItemDTO::new)
            .collect(Collectors.toList());

        return ResponseEntity.ok().body(result);
    }
}
