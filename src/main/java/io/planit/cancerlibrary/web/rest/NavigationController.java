package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.domain.UserCategory;
import io.planit.cancerlibrary.repository.UserCategoryRepository;
import io.planit.cancerlibrary.repository.UserRepository;
import io.planit.cancerlibrary.security.AuthoritiesConstants;
import io.planit.cancerlibrary.security.SecurityUtils;
import io.planit.cancerlibrary.service.InstantService;
import java.util.List;
import java.util.stream.Collectors;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@Transactional
public class NavigationController {

    private final Logger log = LoggerFactory.getLogger(NavigationController.class);

    @Value("cancerLibraryApp")
    private String applicationName;

    private final UserRepository userRepository;

    private final UserCategoryRepository userCategoryRepository;

    private final InstantService instantService;

    public NavigationController(UserRepository userRepository, UserCategoryRepository userCategoryRepository,
        InstantService instantService) {
        this.userRepository = userRepository;
        this.userCategoryRepository = userCategoryRepository;
        this.instantService = instantService;
    }

    @GetMapping("/navigations")
    public ResponseEntity<List<Category>> getAccessibleCategory() {
        log.debug("REST request to get accessible category by user login info: {}",
            SecurityUtils.getCurrentUserLogin());

        List<UserCategory> userCategories;
        if (SecurityUtils.hasCurrentUserThisAuthority(AuthoritiesConstants.ADMIN)) {
            userCategories = userCategoryRepository.findAll();
        } else {
            String login = SecurityUtils.getCurrentUserLogin().orElseThrow();
            User user = userRepository.findOneByLogin(login).orElseThrow();

            userCategories = userCategoryRepository.findAllByUserIdAndCurrentTime(user.getId(),
                instantService.getCurrentTime());
        }

        return ResponseEntity.ok(userCategories.stream().map(UserCategory::getCategory).collect(Collectors.toList()));
    }

}
