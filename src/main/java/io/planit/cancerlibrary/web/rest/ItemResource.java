package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.domain.Item;
import io.planit.cancerlibrary.repository.ItemRepository;
import io.planit.cancerlibrary.service.dto.ItemDTO;
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

/**
 * REST controller for managing {@link Item}.
 */
@RestController
@RequestMapping("/api")
@Transactional
public class ItemResource {

    private final Logger log = LoggerFactory.getLogger(ItemResource.class);

    private static final String ENTITY_NAME = "item";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final ItemRepository itemRepository;

    public ItemResource(ItemRepository itemRepository) {
        this.itemRepository = itemRepository;
    }

    @PostMapping("/items")
    public ResponseEntity<ItemDTO> createItem(@Valid @RequestBody ItemDTO itemDTO) throws URISyntaxException {
        log.debug("REST request to save Item : {}", itemDTO);
        if (itemDTO.getId() != null) {
            throw new BadRequestAlertException("A new item cannot already have an ID", ENTITY_NAME, "idexists");
        }
        ItemDTO result = new ItemDTO(itemRepository.save(itemDTO.toEntity()));
        return ResponseEntity
            .created(new URI("/api/items/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, true, ENTITY_NAME, result.getId().toString()))
            .body(result);
    }

    @PutMapping("/items/{id}")
    public ResponseEntity<ItemDTO> updateItem(@PathVariable(value = "id", required = false) final Long id, @Valid @RequestBody ItemDTO itemDTO) {
        log.debug("REST request to update Item : {}, {}", id, itemDTO);
        if (itemDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, itemDTO.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!itemRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        ItemDTO result = new ItemDTO(itemRepository.save(itemDTO.toEntity()));
        return ResponseEntity
            .ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, result.getId().toString()))
            .body(result);
    }


    @PatchMapping(value = "/items/{id}", consumes = {"application/json", "application/merge-patch+json"})
    public ResponseEntity<ItemDTO> partialUpdateItem(
        @PathVariable(value = "id", required = false) final Long id,
        @NotNull @RequestBody ItemDTO itemDTO
    ) {
        log.debug("REST request to partial update Item partially : {}, {}", id, itemDTO);
        if (itemDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, itemDTO.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!itemRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        Optional<ItemDTO> result = itemRepository
            .findById(itemDTO.getId())
            .map(existingItem -> {
                if (itemDTO.getTitle() != null) {
                    existingItem.setTitle(itemDTO.getTitle());
                }
                if (itemDTO.getOrderNo() != null) {
                    existingItem.setOrderNo(itemDTO.getOrderNo());
                }
                return existingItem;
            })
            .map(itemRepository::save).map(ItemDTO::new);

        return ResponseUtil.wrapOrNotFound(
            result,
            HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, itemDTO.getId().toString())
        );
    }


    @GetMapping("/items")
    public ResponseEntity<List<ItemDTO>> getAllItems() {
        log.debug("REST request to get a page of Items");
        List<ItemDTO> result = itemRepository.findAll().stream().map(ItemDTO::new).collect(Collectors.toList());
        return ResponseEntity.ok().body(result);
    }


    @GetMapping("/items/{id}")
    public ResponseEntity<ItemDTO> getItem(@PathVariable Long id) {
        log.debug("REST request to get Item : {}", id);
        Optional<ItemDTO> item = itemRepository.findById(id).map(ItemDTO::new);
        return ResponseUtil.wrapOrNotFound(item);
    }


    @DeleteMapping("/items/{id}")
    public ResponseEntity<Void> deleteItem(@PathVariable Long id) {
        log.debug("REST request to delete Item : {}", id);
        itemRepository.deleteById(id);
        return ResponseEntity
            .noContent()
            .headers(HeaderUtil.createEntityDeletionAlert(applicationName, true, ENTITY_NAME, id.toString()))
            .build();
    }
}
