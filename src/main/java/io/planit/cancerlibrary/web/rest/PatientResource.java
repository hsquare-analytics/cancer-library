package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.constant.Table;
import io.planit.cancerlibrary.domain.Patient;
import io.planit.cancerlibrary.repository.PatientDetailRepository;
import io.planit.cancerlibrary.repository.PatientRepository;
import io.planit.cancerlibrary.service.PatientService;
import io.planit.cancerlibrary.web.rest.errors.BadRequestAlertException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.constraints.NotNull;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@RestController
@RequestMapping("/api")
@Transactional(value = "jdbcTemplateTransactionManager")
public class PatientResource {

    private final Logger log = LoggerFactory.getLogger(PatientResource.class);

    private static final String ENTITY_NAME = "patient";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final PatientRepository patientRepository;

    private final PatientDetailRepository patientDetailRepository;

    private final PatientService patientService;

    public PatientResource(PatientRepository patientRepository, PatientDetailRepository patientDetailRepository, PatientService patientService) {
        this.patientRepository = patientRepository;
        this.patientDetailRepository = patientDetailRepository;
        this.patientService = patientService;
    }

    @PostMapping("/patients")
    public ResponseEntity<Boolean> createPatient(@RequestBody Patient patient)
        throws URISyntaxException {
        log.debug("REST request to save Patient : {}", patient);

        Boolean result = patientRepository.insert(patient) && patientDetailRepository.insert(patient.getPtNo(), patient.getDetail());

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

        Optional<Patient> patient = patientService.updatePatient(patientDTO);

        return patient.map(response ->
                ResponseEntity.ok().headers(getUpdateHeader(patientDTO)).body(response))
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    private HttpHeaders getUpdateHeader(Patient patient) {
        HttpHeaders headers = new HttpHeaders();
        if (patient.getDetail() != null && patient.getDetail().getStatus() != null) {
            headers.add("X-" + applicationName + "-alert", applicationName + ".patient." + patient.getDetail().getStatus().name().toLowerCase());
        } else {
            headers.add("X-" + applicationName + "-alert", applicationName + ".patient.updated");
        }
        try {
            String params = patient.getPtNm() + "(" + patient.getPtNo() + ")";
            headers.add("X-" + applicationName + "-params", URLEncoder.encode(params, StandardCharsets.UTF_8.toString()));
        } catch (UnsupportedEncodingException e) {
            log.error("Failed to encode params", e);
        }
        return headers;
    }
}
