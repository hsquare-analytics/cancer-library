package io.planit.cancerlibrary.web.rest;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.planit.cancerlibrary.constant.ReviewConstants;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.repository.PatientDetailRepository;
import io.planit.cancerlibrary.repository.UserPatientRepository;
import io.planit.cancerlibrary.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
@Transactional
public class UserController {

    private final Logger log = LoggerFactory.getLogger(UserController.class);

    private final UserRepository userRepository;

    private final UserPatientRepository userPatientRepository;

    private final PatientDetailRepository patientDetailRepository;

    public UserController(UserRepository userRepository, UserPatientRepository userPatientRepository, PatientDetailRepository patientDetailRepository) {
        this.userRepository = userRepository;
        this.userPatientRepository = userPatientRepository;
        this.patientDetailRepository = patientDetailRepository;
    }

    @GetMapping("/users/normal-authorization-list")
    public ResponseEntity<List<NormalAuthorizationUserVM>> getNormalAuthorizationUserList() {
        log.debug("REST request to get all Users with work info");
        List<NormalAuthorizationUserVM> result = userRepository.findAll()
            .stream().map(user -> {
                Integer assigned = userPatientRepository.countByUser(user);
                Integer submitted = patientDetailRepository.countByStatus(user.getLogin(), ReviewConstants.SUBMITTED);
                Integer approved = patientDetailRepository.countByStatus(user.getLogin(), ReviewConstants.APPROVED);
                Integer declined = patientDetailRepository.countByStatus(user.getLogin(), ReviewConstants.DECLINED);
                return new NormalAuthorizationUserVM(user, assigned, submitted, approved, declined);
            }).collect(Collectors.toList());

        return ResponseEntity.ok().body(result);
    }

    static class NormalAuthorizationUserVM {
        @JsonProperty("id")
        private Long id;

        @JsonProperty("login")
        private String login;

        @JsonProperty("name")
        private String name;

        @JsonProperty("assigned")
        private Integer assigned;

        @JsonProperty("submitted")
        private Integer submitted;

        @JsonProperty("approved")
        private Integer approved;

        @JsonProperty("declined")
        private Integer declined;

        @JsonProperty("authority")
        private String authority;

        public NormalAuthorizationUserVM(User user, Integer assigned, Integer submitted, Integer approved, Integer declined) {
            this.id = user.getId();
            this.login = user.getLogin();
            this.name = user.getName();
            this.assigned = assigned;
            this.submitted = submitted;
            this.approved = approved;
            this.declined = declined;

            boolean isAdmin = user.getAuthorities().stream().anyMatch(data -> data.getName().equals("ROLE_ADMIN") || data.getName().equals("ROLE_SUPERVISOR"));
            if (isAdmin) {
                this.authority = "Supervisor";
            } else {
                this.authority = "Reviewer";
            }
        }

        public NormalAuthorizationUserVM() {
        }

    }
}
