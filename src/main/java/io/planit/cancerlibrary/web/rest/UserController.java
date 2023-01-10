package io.planit.cancerlibrary.web.rest;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.planit.cancerlibrary.constant.PatientStatus;
import io.planit.cancerlibrary.domain.Authority;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.repository.PatientDetailRepository;
import io.planit.cancerlibrary.repository.UserPatientRepository;
import io.planit.cancerlibrary.repository.UserRepository;
import io.planit.cancerlibrary.security.AuthoritiesConstants;
import io.planit.cancerlibrary.service.dto.DateRangeDTO;
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
    public ResponseEntity<List<NormalAuthorizationUserVM>> getNormalAuthorizationUserList(DateRangeDTO dateRangeDTO) {
        log.debug("REST request to get all Users with work info");
        List<NormalAuthorizationUserVM> result = userRepository.findAllByActivatedTrue()
            .stream()
            .filter(user -> !user.getAuthorities().contains(new Authority().name(AuthoritiesConstants.ADMIN)) && !user.getAuthorities().contains(new Authority().name(AuthoritiesConstants.SUPERVISOR)))
            .map(user -> {
                Integer assigned = userPatientRepository.countByUser(user);

                Integer submitted = patientDetailRepository.countByStatusAndDateRange(user.getLogin(), PatientStatus.REVIEW_SUBMITTED, dateRangeDTO);
                Integer approved = patientDetailRepository.countByStatusAndDateRange(user.getLogin(), PatientStatus.REVIEW_APPROVED, dateRangeDTO);
                Integer declined = patientDetailRepository.countByStatusAndDateRange(user.getLogin(), PatientStatus.REVIEW_DECLINED, dateRangeDTO);

                Integer totalSubmitted = patientDetailRepository.countByStatusAndDateRange(user.getLogin(), PatientStatus.REVIEW_SUBMITTED, null);
                Integer totalApproved = patientDetailRepository.countByStatusAndDateRange(user.getLogin(), PatientStatus.REVIEW_APPROVED, null);
                Integer totalDeclined = patientDetailRepository.countByStatusAndDateRange(user.getLogin(), PatientStatus.REVIEW_DECLINED, null);
                return new NormalAuthorizationUserVM(user, assigned, submitted, approved, declined, totalSubmitted, totalApproved, totalDeclined);
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

        @JsonProperty("totalSubmitted")
        private Integer totalSubmitted;

        @JsonProperty("totalApproved")
        private Integer totalApproved;

        @JsonProperty("totalDeclined")
        private Integer totalDeclined;

        @JsonProperty("authority")
        private String authority;

        public NormalAuthorizationUserVM(User user, Integer assigned, Integer submitted, Integer approved, Integer declined,
                                         Integer totalSubmitted, Integer totalApproved, Integer totalDeclined
        ) {
            this.id = user.getId();
            this.login = user.getLogin();
            this.name = user.getName();
            this.assigned = assigned;
            this.submitted = submitted;
            this.approved = approved;
            this.declined = declined;
            this.totalSubmitted = totalSubmitted;
            this.totalApproved = totalApproved;
            this.totalDeclined = totalDeclined;

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
