package io.planit.cancerlibrary.web.rest;

import com.fasterxml.jackson.annotation.JsonProperty;
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
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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


    @GetMapping("/patients/divisible-patient-list")
    @PreAuthorize("hasRole(\"" + AuthoritiesConstants.ADMIN + "\")")
    public ResponseEntity<List<DivisiblePatientVM>> getDivisiblePatientList(String login) {
        log.debug("REST request to get divisible patient list");

        List<PatientDTO> patientDTOList = patientMapper.findAll();
        List<String> authorizedPatientNoList = userPatientRepository
            .findAllByUserLogin(login).stream().map(UserPatient::getPatientNo)
            .collect(Collectors.toList());

        List<DivisiblePatientVM> result = patientDTOList.stream().map(patientDTO -> {
            DivisiblePatientVM divisiblePatientVM = new DivisiblePatientVM();
            divisiblePatientVM.setPtNo(patientDTO.getPtNo());
            divisiblePatientVM.setPtNm(patientDTO.getPtNm());
            divisiblePatientVM.setAuthorized(authorizedPatientNoList.contains(patientDTO.getPtNo()));
            return divisiblePatientVM;
        }).collect(Collectors.toList());

        return ResponseEntity.ok().body(result);
    }

    static class DivisiblePatientVM {
        private String ptNo;

        private String ptNm;

        private boolean authorized;

        @JsonProperty("ptNo")
        public String getPtNo() {
            return ptNo;
        }

        public void setPtNo(String ptNo) {
            this.ptNo = ptNo;
        }

        @JsonProperty("ptNm")
        public String getPtNm() {
            return ptNm;
        }

        public void setPtNm(String ptNm) {
            this.ptNm = ptNm;
        }

        @JsonProperty("authorized")
        public boolean isAuthorized() {
            return authorized;
        }

        public void setAuthorized(boolean authorized) {
            this.authorized = authorized;
        }
    }
}