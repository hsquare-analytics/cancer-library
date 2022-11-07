package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.repository.TopicRepository;
import io.planit.cancerlibrary.service.dto.TopicDTO;
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
public class TopicResource {

    private final Logger log = LoggerFactory.getLogger(TopicResource.class);

    private static final String ENTITY_NAME = "topic";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final TopicRepository topicRepository;

    public TopicResource(TopicRepository topicRepository) {
        this.topicRepository = topicRepository;
    }

    @PostMapping("/topics")
    public ResponseEntity<TopicDTO> createTopic(@Valid @RequestBody TopicDTO topicDTO) throws URISyntaxException {
        log.debug("REST request to save Topic : {}", topicDTO);
        if (topicDTO.getId() != null) {
            throw new BadRequestAlertException("A new topic cannot already have an ID", ENTITY_NAME, "idexists");
        }
        TopicDTO result = new TopicDTO(topicRepository.save(topicDTO.toEntity()));
        return ResponseEntity
            .created(new URI("/api/topics/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, true, ENTITY_NAME, result.getId().toString()))
            .body(result);
    }

    @PutMapping("/topics/{id}")
    public ResponseEntity<TopicDTO> updateTopic(@PathVariable(value = "id", required = false) final Long id, @Valid @RequestBody TopicDTO topicDTO) {
        log.debug("REST request to update Topic : {}, {}", id, topicDTO);
        if (topicDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, topicDTO.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!topicRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        TopicDTO result = new TopicDTO(topicRepository.save(topicDTO.toEntity()));
        return ResponseEntity
            .ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, result.getId().toString()))
            .body(result);
    }

    @PatchMapping(value = "/topics/{id}", consumes = {"application/json", "application/merge-patch+json"})
    public ResponseEntity<TopicDTO> partialUpdateTopic(
        @PathVariable(value = "id", required = false) final Long id,
        @NotNull @RequestBody TopicDTO topicDTO
    ) {
        log.debug("REST request to partial update Topic partially : {}, {}", id, topicDTO);
        if (topicDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, topicDTO.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!topicRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        Optional<TopicDTO> result = topicRepository
            .findById(topicDTO.getId())
            .map(existingTopic -> {
                if (topicDTO.getTitle() != null) {
                    existingTopic.setTitle(topicDTO.getTitle());
                }
                if (topicDTO.getActivated() != null) {
                    existingTopic.setActivated(topicDTO.getActivated());
                }

                return existingTopic;
            })
            .map(topicRepository::save).map(TopicDTO::new);

        return ResponseUtil.wrapOrNotFound(
            result,
            HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, topicDTO.getId().toString())
        );
    }

    @GetMapping("/topics")
    public ResponseEntity<List<TopicDTO>> getAllTopics() {
        log.debug("REST request to get a page of Topics");
        List<TopicDTO> result = topicRepository.findAll().stream().map(TopicDTO::new).collect(Collectors.toList());
        return ResponseEntity.ok().body(result);
    }

    @GetMapping("/topics/{id}")
    public ResponseEntity<TopicDTO> getTopic(@PathVariable Long id) {
        log.debug("REST request to get Topic : {}", id);
        Optional<TopicDTO> topic = topicRepository.findById(id).map(TopicDTO::new);
        return ResponseUtil.wrapOrNotFound(topic);
    }

    @DeleteMapping("/topics/{id}")
    public ResponseEntity<Void> deleteTopic(@PathVariable Long id) {
        log.debug("REST request to delete Topic : {}", id);
        topicRepository.deleteById(id);
        return ResponseEntity
            .noContent()
            .headers(HeaderUtil.createEntityDeletionAlert(applicationName, true, ENTITY_NAME, id.toString()))
            .build();
    }
}
