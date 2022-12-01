package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.constant.ReviewConstants;
import io.planit.cancerlibrary.constant.Table;
import io.planit.cancerlibrary.domain.Patient;
import io.planit.cancerlibrary.repository.PatientRepository;
import io.planit.cancerlibrary.security.SecurityUtils;
import io.planit.cancerlibrary.web.rest.errors.BadRequestAlertException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.constraints.NotNull;
import java.net.URI;
import java.net.URISyntaxException;
import java.time.Instant;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@RestController
@RequestMapping("/api")
@Transactional(value = "jdbcTemplateTransactionManager")
public class PatientResource {

    private final Logger log = LoggerFactory.getLogger(PatientResource.class);

    private static final String ENTITY_NAME = "patient";

    private final PatientRepository patientRepository;

    public PatientResource(PatientRepository patientRepository) {
        this.patientRepository = patientRepository;
    }

    @PostMapping("/patients")
    public ResponseEntity<Boolean> createPatient(@RequestBody Patient patient)
        throws URISyntaxException {
        log.debug("REST request to save Patient : {}", patient);

        Boolean result = patientRepository.insert(patient) && patientRepository.insertPatientDetail(patient);

        return ResponseEntity.created(new URI("/api/patients/" + result)).body(result);
    }

    @GetMapping(("/patients"))
    public ResponseEntity<List<Patient>> getAllPatients() {
        log.debug("REST request to get all Patients");

        List<Patient> result = patientRepository.findAll();
        return ResponseEntity.ok().body(result);
    }

    @GetMapping("/patients/{ptNo}")
    public ResponseEntity<Patient> getPatient(@PathVariable String ptNo) {
        log.debug("REST request to get Patient : {}", ptNo);

        Optional<Patient> result = patientRepository.findByPatientNo(ptNo);
        return result.map(patient -> ResponseEntity.ok().body(patient))
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));

    }

    @PatchMapping(value = "/patients/{ptNo}", consumes = {"application/json", "application/merge-patch+json"})
    public ResponseEntity<Patient> partialUpdatePatient(
        @PathVariable(value = "ptNo") final String ptNo,
        @NotNull @RequestBody Patient patientDTO
    ) {
        log.debug("REST request to update Patient partially : {}, {}", ptNo, patientDTO);

        if (patientDTO.getPtNo() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }

        if (!Objects.equals(ptNo, patientDTO.getPtNo())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!patientRepository.checkRowExistByPtNoOnTable(Table.PATIENT_VIEW, ptNo)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        String login = SecurityUtils.getCurrentUserLogin()
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED));

        Optional<Patient> patient = patientRepository.findByPatientNo(ptNo)
            .map(existPatient -> {
                if (Objects.nonNull(patientDTO.getStatus())) {
                    existPatient.setStatus(patientDTO.getStatus());
                }

                if (Objects.nonNull(patientDTO.getComment())) {
                    existPatient.setComment(patientDTO.getComment());
                }

                if (Objects.nonNull(patientDTO.getDeclineReason())) {
                    existPatient.setDeclineReason(patientDTO.getDeclineReason());
                }

                if (ReviewConstants.SUBMITTED.equals(patientDTO.getStatus())) {
                    existPatient.setCreatedBy(login);
                    existPatient.setCreatedDate(Instant.now());
                }

                existPatient.setLastModifiedBy(login);
                existPatient.setLastModifiedDate(Instant.now());
                return existPatient;
            });

        return patient.map(response -> {
                if (patientRepository.checkRowExistByPtNoOnTable(Table.PATIENT_DETAIL, ptNo)) {
                    patientRepository.updatePatientDetail(response);
                } else {
                    patientRepository.insertPatientDetail(response);
                }
                return ResponseEntity.ok().body(response);
            })
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }
}
