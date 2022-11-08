package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.repository.UserPatientRepository;
import io.planit.cancerlibrary.service.dto.UserPatientDTO;
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
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
@Transactional
public class UserPatientResource {

    private final Logger log = LoggerFactory.getLogger(UserPatientResource.class);

    private static final String ENTITY_NAME = "userPatient";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final UserPatientRepository userPatientRepository;

    public UserPatientResource(UserPatientRepository userPatientRepository) {
        this.userPatientRepository = userPatientRepository;
    }

    @PostMapping("/user-patients")
    public ResponseEntity<UserPatientDTO> createUserPatient(@Valid @RequestBody UserPatientDTO userPatientDTO) throws URISyntaxException {
        log.debug("REST request to save UserPatient : {}", userPatientDTO);
        if (userPatientDTO.getId() != null) {
            throw new BadRequestAlertException("A new userPatient cannot already have an ID", ENTITY_NAME, "idexists");
        }
        UserPatientDTO result = new UserPatientDTO(userPatientRepository.save(userPatientDTO.toEntity()));
        return ResponseEntity
            .created(new URI("/api/user-patients/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, true, ENTITY_NAME, result.getId().toString()))
            .body(result);
    }

    @PutMapping("/user-patients/{id}")
    public ResponseEntity<UserPatientDTO> updateUserPatient(
        @PathVariable(value = "id", required = false) final Long id,
        @Valid @RequestBody UserPatientDTO userPatientDTO
    ) {
        log.debug("REST request to update UserPatient : {}, {}", id, userPatientDTO);
        if (userPatientDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, userPatientDTO.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!userPatientRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        UserPatientDTO result = new UserPatientDTO(userPatientRepository.save(userPatientDTO.toEntity()));
        return ResponseEntity
            .ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, userPatientDTO.getId().toString()))
            .body(result);
    }


    @GetMapping("/user-patients")
    public ResponseEntity<List<UserPatientDTO>> getAllUsersCategories() {
        log.debug("REST request to get all UsersCategories");
        List<UserPatientDTO> result = userPatientRepository.findAll().stream().map(UserPatientDTO::new).collect(Collectors.toList());
        return ResponseEntity.ok().body(result);
    }

    @GetMapping("/user-patients/{id}")
    public ResponseEntity<UserPatientDTO> getUserPatient(@PathVariable Long id) {
        log.debug("REST request to get UserPatient : {}", id);
        Optional<UserPatientDTO> userPatientDTO = userPatientRepository.findById(id).map(UserPatientDTO::new);
        return ResponseUtil.wrapOrNotFound(userPatientDTO);
    }

    @DeleteMapping("/user-patients/{id}")
    public ResponseEntity<Void> deleteUserPatient(@PathVariable Long id) {
        log.debug("REST request to delete UserPatient : {}", id);
        userPatientRepository.deleteById(id);
        return ResponseEntity
            .noContent()
            .headers(HeaderUtil.createEntityDeletionAlert(applicationName, true, ENTITY_NAME, id.toString()))
            .build();
    }
}
