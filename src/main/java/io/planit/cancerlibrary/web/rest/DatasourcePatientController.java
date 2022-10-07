package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.domain.UserPatient;
import io.planit.cancerlibrary.mapper.PatientMapper;
import io.planit.cancerlibrary.repository.UserPatientRepository;
import io.planit.cancerlibrary.security.AuthoritiesConstants;
import io.planit.cancerlibrary.security.SecurityUtils;
import io.planit.cancerlibrary.service.dto.PatientDTO;
import java.util.List;
import java.util.stream.Collectors;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@Transactional
public class DatasourcePatientController {

    private final Logger log = LoggerFactory.getLogger(DatasourcePatientController.class);

    private final UserPatientRepository userPatientRepository;

    private final PatientMapper patientMapper;

    public DatasourcePatientController(UserPatientRepository userPatientRepository,
        PatientMapper patientMapper) {
        this.userPatientRepository = userPatientRepository;
        this.patientMapper = patientMapper;
    }

    @GetMapping("/datasource-patient/accessible-patient-list")
    public ResponseEntity<List<PatientDTO>> getAccessiblePatientList() {
        log.debug("REST request to get accessible patient list");

        if (SecurityUtils.hasCurrentUserAnyOfAuthorities(AuthoritiesConstants.REVIEWER, AuthoritiesConstants.ADMIN)) {
            List<PatientDTO> result = patientMapper.findAll();
            return ResponseEntity.ok().body(result);
        } else {
            String login = SecurityUtils.getCurrentUserLogin().orElseThrow().toLowerCase();
            List<String> accessiblePatientNoList = userPatientRepository
                .findAllByUserLogin(login).stream().map(UserPatient::getPatientNo)
                .collect(Collectors.toList());

            List<PatientDTO> result = patientMapper.findAllByPatientNos(accessiblePatientNoList);

            return ResponseEntity.ok().body(result);
        }
    }
}
