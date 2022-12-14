package io.planit.cancerlibrary.web.rest;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.planit.cancerlibrary.domain.Authority;
import io.planit.cancerlibrary.domain.Patient;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.domain.UserPatient;
import io.planit.cancerlibrary.repository.PatientRepository;
import io.planit.cancerlibrary.repository.UserPatientRepository;
import io.planit.cancerlibrary.repository.UserRepository;
import io.planit.cancerlibrary.security.AuthoritiesConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityManager;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
@Transactional
public class UserPatientController {

    private final Logger log = LoggerFactory.getLogger(UserPatientController.class);

    private final UserRepository userRepository;

    private final UserPatientRepository userPatientRepository;

    private final PatientRepository patientRepository;

    private final EntityManager entityManager;

    public UserPatientController(
        UserRepository userRepository,
        UserPatientRepository userPatientRepository,
        PatientRepository patientRepository,
        EntityManager entityManager
        ) {
        this.userRepository = userRepository;
        this.userPatientRepository = userPatientRepository;
        this.patientRepository = patientRepository;
        this.entityManager = entityManager;
    }

    @GetMapping("/user-patients/divisible-patient-list")
    @PreAuthorize("hasRole('" + AuthoritiesConstants.ADMIN + "')" +
        " || hasRole('" + AuthoritiesConstants.SUPERVISOR + "')")
    public ResponseEntity<List<DivisiblePatientVM>> getDivisiblePatientList(String login) {
        log.debug("REST request to get divisible patient list");
        User user = userRepository.findOneByLogin(login).orElseThrow(() -> new RuntimeException("User not found"));

        boolean isAdmin = user.getAuthorities().stream()
            .map(Authority::getName)
            .anyMatch(authority -> authority.equals(AuthoritiesConstants.ADMIN) || authority.equals(AuthoritiesConstants.SUPERVISOR));

        List<Patient> patientList;

        if (isAdmin) {
            patientList = patientRepository.findAll();
        } else {
            // 1. 제외 권한 목록: 본인 계정 권한 이 아니고, 관리자가 아닌 사용자의 권한 목록
            List<UserPatient> excludeUserPatients = userPatientRepository.findAll().stream()
                .filter(userPatient -> !userPatient.getUser().getLogin().equals(login) && userPatient.getUser().getAuthorities().stream().map(Authority::getName)
                    .noneMatch(authority -> authority.equals(AuthoritiesConstants.ADMIN) || authority.equals(AuthoritiesConstants.SUPERVISOR))
                ).collect(Collectors.toList());

            // 2. 전체 환자 리스트 중에 1.을 제외한 환자 목록
            patientList = patientRepository.findAllByPtNoNotIn(excludeUserPatients.stream().map(UserPatient::getPatientNo).collect(Collectors.toList()));
        }

        List<String> authorizedPatientNoList = userPatientRepository
            .findAllByUserLogin(login).stream().map(UserPatient::getPatientNo)
            .collect(Collectors.toList());

        List<DivisiblePatientVM> result = patientList.stream().map(patientDTO -> {
            boolean isAuthorized = authorizedPatientNoList.contains(patientDTO.getPtNo());
            return new DivisiblePatientVM(patientDTO, isAuthorized);
        }).collect(Collectors.toList());

        return ResponseEntity.ok().body(result);
    }

    @PostMapping("/user-patients/user-patient-authorizations")
    @PreAuthorize("hasRole('" + AuthoritiesConstants.ADMIN + "')" +
        " || hasRole('" + AuthoritiesConstants.SUPERVISOR + "')")
    public ResponseEntity<List<DivisiblePatientVM>> createUserPatientAuthorizations(
        @RequestBody UserPatientAuthorizationsVM userPatientAuthorizationsVM) {
        log.debug("REST request to create user patient authorizations");

        String login = userPatientAuthorizationsVM.getLogin();
        User user = userRepository.findOneByLogin(login)
            .orElseThrow(() -> new UserPatientControllerException("User not found"));

        userPatientRepository.deleteAllByUserLogin(user.getLogin());
        entityManager.flush();
        userPatientAuthorizationsVM.getPatients().stream().filter(DivisiblePatientVM::isAuthorized).forEach(patient -> {
            if (!patientRepository.findByPatientNo(patient.getPtNo()).isPresent()) {
                throw new UserPatientControllerException("Patient not found");
            }

            UserPatient userPatient = new UserPatient();
            userPatient.setUser(user);
            userPatient.setPatientNo(patient.getPtNo());
            userPatientRepository.save(userPatient);
        });

        return ResponseEntity.ok().body(userPatientAuthorizationsVM.getPatients());
    }

    private static class UserPatientControllerException extends RuntimeException {
        private UserPatientControllerException(String message) {
            super(message);
        }
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

    static class DivisiblePatientVM extends Patient {

        private boolean authorized;

        @JsonProperty("authorized")
        public boolean isAuthorized() {
            return authorized;
        }

        public void setAuthorized(boolean authorized) {
            this.authorized = authorized;
        }

        public DivisiblePatientVM(Patient patient, boolean authorized) {
            this.ptNo(patient.getPtNo());
            this.ptNm(patient.getPtNm());
            this.idxDt(patient.getIdxDt());
            this.authorized = authorized;
        }

        public DivisiblePatientVM() {
        }
    }
}
