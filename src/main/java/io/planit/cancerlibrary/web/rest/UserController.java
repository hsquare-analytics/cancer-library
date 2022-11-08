package io.planit.cancerlibrary.web.rest;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.planit.cancerlibrary.domain.Authority;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.repository.UserRepository;
import io.planit.cancerlibrary.security.AuthoritiesConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
@Transactional
public class UserController {

    private final Logger log = LoggerFactory.getLogger(UserController.class);

    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/users/normal-authorization-list")
    public ResponseEntity<List<NormalAuthorizationUserVM>> getNormalAuthorizationUserList() {
        log.debug("REST request to get a page of Users");
        List<Authority> authorities = new ArrayList<>();
        authorities.add(new Authority().name(AuthoritiesConstants.ADMIN));
        authorities.add(new Authority().name(AuthoritiesConstants.SUPERVISOR));
        List<NormalAuthorizationUserVM> result = userRepository.findAllByAuthoritiesNotIn(authorities)
            .stream()
            .filter(user -> !user.getAuthorities().contains(new Authority().name(AuthoritiesConstants.ADMIN)) && !user.getAuthorities().contains(new Authority().name(AuthoritiesConstants.SUPERVISOR))).collect(Collectors.toList())
            .stream().map(NormalAuthorizationUserVM::new).collect(Collectors.toList());

        return ResponseEntity.ok().body(result);
    }

    static class NormalAuthorizationUserVM {
        @JsonProperty("login")
        private String login;

        @JsonProperty("firstName")
        private String firstName;

        @JsonProperty("lastName")
        private String lastName;

        public NormalAuthorizationUserVM(User user) {
            this.login = user.getLogin();
            this.firstName = user.getFirstName();
            this.lastName = user.getLastName();
        }

        public NormalAuthorizationUserVM() {
        }
    }
}
