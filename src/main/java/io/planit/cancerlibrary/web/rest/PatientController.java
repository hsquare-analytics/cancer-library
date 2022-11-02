package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.domain.Patient;
import io.planit.cancerlibrary.domain.UserPatient;
import io.planit.cancerlibrary.mapper.PatientMapper;
import io.planit.cancerlibrary.repository.UserPatientRepository;
import io.planit.cancerlibrary.security.AuthoritiesConstants;
import io.planit.cancerlibrary.security.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
@Transactional
public class PatientController {

    private final Logger log = LoggerFactory.getLogger(PatientController.class);

    private final UserPatientRepository userPatientRepository;

    private final PatientMapper patientMapper;

    public PatientController(UserPatientRepository userPatientRepository,
        PatientMapper patientMapper) {
        this.userPatientRepository = userPatientRepository;
        this.patientMapper = patientMapper;
    }

    @GetMapping("/patients/accessible-patient-list")
    public ResponseEntity<List<Patient>> getAccessiblePatientList(Instant startDate, Instant endDate) {
        log.debug("REST request to get accessible patient list");

        if (SecurityUtils.hasCurrentUserAnyOfAuthorities(AuthoritiesConstants.SUPERVISOR, AuthoritiesConstants.ADMIN)) {
           Map<String, Instant> dateRange = Map.of(
                "startDate", startDate.minus(1, ChronoUnit.DAYS),
                "endDate", endDate.plus(1, ChronoUnit.DAYS)
           );
            List<Patient> result = patientMapper.findAllByCreatedDateBetween(dateRange);
            return ResponseEntity.ok().body(result);
        } else {
            String login = SecurityUtils.getCurrentUserLogin().orElseThrow().toLowerCase();
            List<String> accessiblePatientNoList = userPatientRepository
                .findAllByUserLogin(login).stream().map(UserPatient::getPatientNo)
                .collect(Collectors.toList());

            List<Patient> result = patientMapper.findAllByPatientNos(accessiblePatientNoList);

            return ResponseEntity.ok().body(result);
        }
    }


}
