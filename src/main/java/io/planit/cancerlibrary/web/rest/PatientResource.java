package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.constant.ReviewConstants;
import io.planit.cancerlibrary.mapper.PatientMapper;
import io.planit.cancerlibrary.security.SecurityUtils;
import io.planit.cancerlibrary.service.dto.PatientDTO;
import io.planit.cancerlibrary.web.rest.errors.BadRequestAlertException;
import java.net.URI;
import java.net.URISyntaxException;
import java.time.Instant;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import javax.validation.constraints.NotNull;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

@RestController
@RequestMapping("/api")
@Transactional
public class PatientResource {

    private final Logger log = LoggerFactory.getLogger(PatientResource.class);

    private static final String ENTITY_NAME = "patient";

    private final PatientMapper patientMapper;

    public PatientResource(PatientMapper patientMapper) {
        this.patientMapper = patientMapper;
    }

    @PostMapping("/patients")
    public ResponseEntity<Integer> createPatient(@RequestBody PatientDTO patientDTO)
        throws URISyntaxException {
        log.debug("REST request to save Patient : {}", patientDTO);

        int result = patientMapper.insert(patientDTO);

        return ResponseEntity.created(new URI("/api/patients/" + result)).body(result);
    }

    @GetMapping(("/patients"))
    public ResponseEntity<List<PatientDTO>> getAllPatients() {
        log.debug("REST request to get all Patients");

        List<PatientDTO> result = patientMapper.findAll();
        return ResponseEntity.ok().body(result);
    }

    @GetMapping("/patients/{ptNo}")
     public ResponseEntity<PatientDTO> getPatient(@PathVariable String ptNo) {
        log.debug("REST request to get Patient : {}", ptNo);

        Optional<PatientDTO> result = patientMapper.findByPatientNo(ptNo);
        return result.map(patient-> ResponseEntity.ok().body(patient))
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));

     }

    @PatchMapping(value = "/patients/{ptNo}", consumes = {"application/json", "application/merge-patch+json"})
    public ResponseEntity<Integer> partialUpdatePatient(
        @PathVariable(value = "ptNo") final String ptNo,
        @NotNull @RequestBody PatientDTO patientDTO
    ) {
        log.debug("REST request to update Patient partially : {}, {}", ptNo, patientDTO);

        if (patientDTO.getPtNo() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }

        if (!Objects.equals(ptNo, patientDTO.getPtNo())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!patientMapper.existsByPatientNo(ptNo)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        String login = SecurityUtils.getCurrentUserLogin().orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED));

        Optional<Integer> result = patientMapper.findByPatientNo(ptNo)
            .map(existPatient -> {
                if (!ObjectUtils.isEmpty(patientDTO.getStatus())) {
                    existPatient.setStatus(patientDTO.getStatus());
                }

                if (ReviewConstants.SUBMITTED.equals(patientDTO.getStatus())) {
                    existPatient.setCreatedBy(login);
                    existPatient.setCreatedDate(Instant.now());
                }

                existPatient.setLastModifiedBy(login);
                existPatient.setLastModifiedDate(Instant.now());
                return existPatient;
            }).map(patientMapper::update);

        return result.map(updated -> ResponseEntity.ok().body(updated))
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }
}
