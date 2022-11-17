package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.domain.Group;
import io.planit.cancerlibrary.repository.GroupRepository;
import io.planit.cancerlibrary.web.rest.errors.BadRequestAlertException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Pageable;
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

@RestController
@RequestMapping("/api")
@Transactional
public class GroupResource {

    private final Logger log = LoggerFactory.getLogger(GroupResource.class);

    private static final String ENTITY_NAME = "group";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final GroupRepository groupRepository;

    public GroupResource(GroupRepository groupRepository) {
        this.groupRepository = groupRepository;
    }

    @PostMapping("/groups")
    public ResponseEntity<Group> createGroup(@Valid @RequestBody Group group) throws URISyntaxException {
        log.debug("REST request to save Group : {}", group);
        if (group.getId() != null) {
            throw new BadRequestAlertException("A new group cannot already have an ID", ENTITY_NAME, "idexists");
        }
        Group result = groupRepository.save(group);
        return ResponseEntity
            .created(new URI("/api/groups/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, true, ENTITY_NAME, result.getId().toString()))
            .body(result);
    }

    @PutMapping("/groups/{id}")
    public ResponseEntity<Group> updateGroup(@PathVariable(value = "id", required = false) final Long id, @Valid @RequestBody Group group) {
        log.debug("REST request to update Group : {}, {}", id, group);
        if (group.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, group.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!groupRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        Group result = groupRepository.save(group);
        return ResponseEntity
            .ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, group.getId().toString()))
            .body(result);
    }

    @PatchMapping(value = "/groups/{id}", consumes = {"application/json", "application/merge-patch+json"})
    public ResponseEntity<Group> partialUpdateGroup(@PathVariable(value = "id", required = false) final Long id, @NotNull @RequestBody Group group) {
        log.debug("REST request to partial update Group partially : {}, {}", id, group);
        if (group.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, group.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!groupRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        Optional<Group> result = groupRepository
            .findById(group.getId())
            .map(existingGroup -> {
                if (group.getTitle() != null) {
                    existingGroup.setTitle(group.getTitle());
                }
                if (group.getActivated() != null) {
                    existingGroup.setActivated(group.getActivated());
                }

                return existingGroup;
            })
            .map(groupRepository::save);

        return ResponseUtil.wrapOrNotFound(
            result,
            HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, group.getId().toString())
        );
    }

    @GetMapping("/groups")
    public ResponseEntity<List<Group>> getAllGroups(@org.springdoc.api.annotations.ParameterObject Pageable pageable) {
        log.debug("REST request to get a page of Groups");
        List<Group> result = groupRepository.findAll();
        return ResponseEntity.ok().body(result);
    }

    @GetMapping("/groups/{id}")
    public ResponseEntity<Group> getGroup(@PathVariable Long id) {
        log.debug("REST request to get Group : {}", id);
        Optional<Group> group = groupRepository.findById(id);
        return ResponseUtil.wrapOrNotFound(group);
    }

    @DeleteMapping("/groups/{id}")
    public ResponseEntity<Void> deleteGroup(@PathVariable Long id) {
        log.debug("REST request to delete Group : {}", id);
        groupRepository.deleteById(id);
        return ResponseEntity
            .noContent()
            .headers(HeaderUtil.createEntityDeletionAlert(applicationName, true, ENTITY_NAME, id.toString()))
            .build();
    }
}
