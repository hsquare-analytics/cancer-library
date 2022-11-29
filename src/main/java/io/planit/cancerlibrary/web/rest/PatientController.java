package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.domain.Patient;
import io.planit.cancerlibrary.domain.UserPatient;
import io.planit.cancerlibrary.repository.PatientRepository;
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

import java.sql.Timestamp;
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

    private final PatientRepository patientRepository;

    public PatientController(UserPatientRepository userPatientRepository,
                             PatientRepository patientRepository) {
        this.userPatientRepository = userPatientRepository;
        this.patientRepository = patientRepository;
    }

    @GetMapping("/patients/accessible-patient-list")
    public ResponseEntity<List<Patient>> getAccessiblePatientList(Instant startDate, Instant endDate) {
        log.debug("REST request to get accessible patient list");

        String login = SecurityUtils.getCurrentUserLogin().orElseThrow().toLowerCase();
        List<String> accessiblePatientNoList = userPatientRepository
            .findAllByUserLogin(login).stream().map(UserPatient::getPatientNo)
            .collect(Collectors.toList());

        List<Patient> result = patientRepository.findAllByPatientNos(accessiblePatientNoList);

        if (SecurityUtils.hasCurrentUserAnyOfAuthorities(AuthoritiesConstants.SUPERVISOR, AuthoritiesConstants.ADMIN)) {
            Map<String, Timestamp> dateRange = Map.of(
                "startDate", Timestamp.from(startDate.minus(1, ChronoUnit.DAYS)),
                "endDate", Timestamp.from(endDate.plus(1, ChronoUnit.DAYS))
            );
            List<String> excludePtNos = result.stream().map(Patient::getPtNo).collect(Collectors.toList());
            List<Patient> adminUser = patientRepository.findAllByPtNoNotInAndCreatedDateBetween(excludePtNos, dateRange);
            result.addAll(adminUser);
        }

        return ResponseEntity.ok().body(result);
    }


}
