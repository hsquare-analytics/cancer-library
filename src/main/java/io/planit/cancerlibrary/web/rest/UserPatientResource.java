package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.domain.UserPatient;
import io.planit.cancerlibrary.repository.UserPatientRepository;
import io.planit.cancerlibrary.web.rest.errors.BadRequestAlertException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import javax.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
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
    public ResponseEntity<UserPatient> createUserPatient(@Valid @RequestBody UserPatient userPatient) throws URISyntaxException {
        log.debug("REST request to save UserPatient : {}", userPatient);
        if (userPatient.getId() != null) {
            throw new BadRequestAlertException("A new userPatient cannot already have an ID", ENTITY_NAME, "idexists");
        }
        UserPatient result = userPatientRepository.save(userPatient);
        return ResponseEntity
            .created(new URI("/api/user-patients/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, true, ENTITY_NAME, result.getId().toString()))
            .body(result);
    }

    @PutMapping("/user-patients/{id}")
    public ResponseEntity<UserPatient> updateUserPatient(
        @PathVariable(value = "id", required = false) final Long id,
        @Valid @RequestBody UserPatient userPatient
    )  {
        log.debug("REST request to update UserPatient : {}, {}", id, userPatient);
        if (userPatient.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, userPatient.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!userPatientRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        UserPatient result = userPatientRepository.save(userPatient);
        return ResponseEntity
            .ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, userPatient.getId().toString()))
            .body(result);
    }


    @GetMapping("/user-patients")
    public ResponseEntity<List<UserPatient>> getAllUsersCategories() {
        log.debug("REST request to get all UsersCategories");
        List<UserPatient> result = userPatientRepository.findAll();
        return ResponseEntity.ok().body(result);
    }

    @GetMapping("/user-patients/{id}")
    public ResponseEntity<UserPatient> getUserPatient(@PathVariable Long id) {
        log.debug("REST request to get UserPatient : {}", id);
        Optional<UserPatient> userPatient = userPatientRepository.findById(id);
        return ResponseUtil.wrapOrNotFound(userPatient);
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
