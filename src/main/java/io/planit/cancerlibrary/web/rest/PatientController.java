package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.constant.PatientConstants;
import io.planit.cancerlibrary.domain.Patient;
import io.planit.cancerlibrary.domain.UserPatient;
import io.planit.cancerlibrary.domain.embedded.PatientDetail;
import io.planit.cancerlibrary.repository.PatientRepository;
import io.planit.cancerlibrary.repository.UserPatientRepository;
import io.planit.cancerlibrary.security.AuthoritiesConstants;
import io.planit.cancerlibrary.security.SecurityUtils;
import io.planit.cancerlibrary.service.DatasourceSyncService;
import io.planit.cancerlibrary.service.PatientService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
@Transactional
public class PatientController {

    private final Logger log = LoggerFactory.getLogger(PatientController.class);

    private static final String ENTITY_NAME = "patient";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final UserPatientRepository userPatientRepository;

    private final PatientRepository patientRepository;

    private final PatientService patientService;

    private final DatasourceSyncService datasourceSyncService;

    public PatientController(UserPatientRepository userPatientRepository,
                             PatientRepository patientRepository,
                             PatientService patientService,
                             DatasourceSyncService datasourceSyncService) {
        this.userPatientRepository = userPatientRepository;
        this.patientRepository = patientRepository;
        this.patientService = patientService;
        this.datasourceSyncService = datasourceSyncService;
    }

    @GetMapping("/patients/accessible-patient-list")
    public ResponseEntity<List<Patient>> getAccessiblePatientList() {
        log.debug("REST request to get accessible patient list");

        if (SecurityUtils.hasCurrentUserAnyOfAuthorities(AuthoritiesConstants.SUPERVISOR, AuthoritiesConstants.ADMIN)) {
            return ResponseEntity.ok(patientRepository.findAll());
        }

        String login = SecurityUtils.getCurrentUserLogin().orElseThrow().toLowerCase();
        List<String> accessiblePatientNoList = userPatientRepository
            .findAllByUserLogin(login).stream().map(UserPatient::getPatientNo)
            .collect(Collectors.toList());

        return ResponseEntity.ok(patientRepository.findAllByPatientNos(accessiblePatientNoList));

    }

    @PatchMapping("/patients/{ptNo}/first-visit-date")
    public ResponseEntity<Boolean> updatePatientMedicalVisitInfo(
        @PathVariable String ptNo,
        @RequestBody Patient patient) {
        log.debug("REST request to update patient medical visit info");

        Optional<Patient> result = patientService.updatePatient(patient);
        syncPatientFdx(patient);

        HttpHeaders headers = new HttpHeaders();
        headers.add("X-" + applicationName + "-alert", applicationName + "." + ENTITY_NAME + "." + "firstVisitDateUpdated");

        return ResponseEntity.ok().headers(headers).body(result.isPresent());
    }


    private void syncPatientFdx(Patient patient) {
        log.debug("REST request to sync patient fdx");

        String login = SecurityUtils.getCurrentUserLogin().orElseThrow(() -> new RuntimeException("No user login found"));

        Runnable myRunnable = () -> {
            datasourceSyncService.syncPatientFdx(patient, login);
        };

        Thread thread = new Thread(myRunnable);
        thread.start();
    }

    @PostMapping("/patients/update-bulk-status/{status}")
    public ResponseEntity<Boolean> bulkUpdatePatientStatus(@RequestBody List<String> ptNos, @PathVariable String status) {
        log.debug("REST request to bulk update patient status");

        if (ptNos == null || ptNos.isEmpty()) {
            return ResponseEntity.badRequest().body(false);
        }

        if (status == null || status.isEmpty()) {
            return ResponseEntity.badRequest().body(false);
        }

        ptNos.forEach(ptNo -> {
            patientService.updatePatient(new Patient().ptNo(ptNo).detail(new PatientDetail().status(status)));
        });

        HttpHeaders headers = new HttpHeaders();

        if (status.equals(PatientConstants.APPROVED)) {
            headers.add("X-" + applicationName + "-alert", applicationName + ".patient.bulkUpdate." + "approved");
        } else if (status.equals(PatientConstants.DECLINED)) {
            headers.add("X-" + applicationName + "-alert", applicationName + ".patient.bulkUpdate." + "declined");
        }

        try {
            headers.add("X-" + applicationName + "-params", URLEncoder.encode(String.valueOf(ptNos.size()), StandardCharsets.UTF_8.toString()));
        } catch (UnsupportedEncodingException e) {
            log.error("Failed to encode params", e);
        }

        return ResponseEntity.ok().headers(headers).body(true);
    }

}
