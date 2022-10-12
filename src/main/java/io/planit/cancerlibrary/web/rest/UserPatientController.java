package io.planit.cancerlibrary.web.rest;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.domain.UserPatient;
import io.planit.cancerlibrary.mapper.PatientMapper;
import io.planit.cancerlibrary.repository.UserPatientRepository;
import io.planit.cancerlibrary.repository.UserRepository;
import io.planit.cancerlibrary.security.AuthoritiesConstants;
import io.planit.cancerlibrary.service.dto.PatientDTO;
import java.util.List;
import java.util.stream.Collectors;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@Transactional
public class UserPatientController {

    private final Logger log = LoggerFactory.getLogger(UserPatientController.class);

    private final UserRepository userRepository;

    private final UserPatientRepository userPatientRepository;

    private final PatientMapper patientMapper;

    public UserPatientController(
        UserRepository userRepository,
        UserPatientRepository userPatientRepository,
        PatientMapper patientMapper) {
        this.userRepository = userRepository;
        this.userPatientRepository = userPatientRepository;
        this.patientMapper = patientMapper;
    }

    @GetMapping("/user-patients/divisible-patient-list")
    @PreAuthorize("hasRole(\"" + AuthoritiesConstants.ADMIN + "\")")
    public ResponseEntity<List<DivisiblePatientVM>> getDivisiblePatientList(String login) {
        log.debug("REST request to get divisible patient list");

        List<PatientDTO> patientDTOList = patientMapper.findAll();
        List<String> authorizedPatientNoList = userPatientRepository
            .findAllByUserLogin(login).stream().map(UserPatient::getPatientNo)
            .collect(Collectors.toList());

        List<DivisiblePatientVM> result = patientDTOList.stream().map(patientDTO -> {
            boolean isAuthorized = authorizedPatientNoList.contains(patientDTO.getPtNo());
            return new DivisiblePatientVM(patientDTO, isAuthorized);
        }).collect(Collectors.toList());

        return ResponseEntity.ok().body(result);
    }

    @PostMapping("/user-patients/user-patient-authorizations")
    @PreAuthorize("hasRole(\"" + AuthoritiesConstants.ADMIN + "\")")
    public ResponseEntity<List<DivisiblePatientVM>> createUserPatientAuthorizations(
        @RequestBody UserPatientAuthorizationsVM userPatientAuthorizationsVM) {
        log.debug("REST request to create user patient authorizations");

        String login = userPatientAuthorizationsVM.getLogin();
        User user = userRepository.findOneByLogin(login)
            .orElseThrow(() -> new RuntimeException("User not found"));

        userPatientRepository.deleteAllByUserLogin(user.getLogin());
        userPatientAuthorizationsVM.getPatients().stream().filter(DivisiblePatientVM::isAuthorized).forEach(patient -> {
            patientMapper.findByPatientNo(patient.getPtNo())
                .orElseThrow(() -> new RuntimeException("Patient not found"));

            UserPatient userPatient = new UserPatient();
            userPatient.setUser(user);
            userPatient.setPatientNo(patient.getPtNo());
            userPatientRepository.save(userPatient);
        });

        return ResponseEntity.ok().body(userPatientAuthorizationsVM.getPatients());
    }

    static class UserPatientAuthorizationsVM {

        @JsonProperty("login")
        private String login;

        @JsonProperty("patients")
        private List<DivisiblePatientVM> patients;

        public String getLogin() {
            return login;
        }

        public List<DivisiblePatientVM> getPatients() {
            return patients;
        }

        public UserPatientAuthorizationsVM(String login, List<DivisiblePatientVM> patients) {
            this.login = login;
            this.patients = patients;
        }

        public UserPatientAuthorizationsVM() {
        }
    }

    static class DivisiblePatientVM extends PatientDTO {

        private boolean authorized;

        @JsonProperty("authorized")
        public boolean isAuthorized() {
            return authorized;
        }

        public void setAuthorized(boolean authorized) {
            this.authorized = authorized;
        }

        public DivisiblePatientVM(PatientDTO patientDTO, boolean authorized) {
            this.ptNo(patientDTO.getPtNo());
            this.ptNm(patientDTO.getPtNm());
            this.authorized = authorized;
        }

        public DivisiblePatientVM() {
        }
    }
}
