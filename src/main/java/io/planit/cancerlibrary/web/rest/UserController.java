package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.domain.Authority;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.repository.UserRepository;
import io.planit.cancerlibrary.security.AuthoritiesConstants;
import java.util.ArrayList;
import java.util.List;
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
public class UserController {

    private final Logger log = LoggerFactory.getLogger(UserController.class);

    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/users/normal-authorization-list")
    public ResponseEntity<List<User>> getNormalAuthorizationUserList() {
        log.debug("REST request to get a page of Users");
        List<Authority> authorities = new ArrayList<>();
        authorities.add(new Authority().name(AuthoritiesConstants.ADMIN));
        authorities.add(new Authority().name(AuthoritiesConstants.SUPERVISOR));
        List<User> users = userRepository.findAllByAuthoritiesNotIn(authorities);
        return ResponseEntity.ok().body(users);
    }
}
