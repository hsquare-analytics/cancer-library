package io.planit.cancerlibrary.web.rest;

import static org.hamcrest.Matchers.hasItem;
import static org.hamcrest.Matchers.not;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.Authority;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.repository.UserRepository;
import io.planit.cancerlibrary.security.AuthoritiesConstants;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.EntityManager;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;

@IntegrationTest
@AutoConfigureMockMvc
@WithMockUser
class UserControllerIT {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restUserMockMvc;

    @Test
    void getNormalAuthorizationUserList() throws Exception {
        User testAuthAdmin = UserResourceIT.createEntity(em).login("testAuthAdmin")
            .authorities(new HashSet<>(Set.of(new Authority().name(AuthoritiesConstants.ADMIN))));
        userRepository.saveAndFlush(testAuthAdmin);
        User testAuthSupervisor = UserResourceIT.createEntity(em).login("testAuthSupervisor")
            .authorities(new HashSet<>(Set.of(new Authority().name(AuthoritiesConstants.SUPERVISOR))));
        userRepository.saveAndFlush(testAuthSupervisor);
        User testAuthNormalUser = UserResourceIT.createEntity(em).login("testAuthNormalUser")
            .authorities(new HashSet<>(Set.of(new Authority().name(AuthoritiesConstants.USER))));
        userRepository.saveAndFlush(testAuthNormalUser);

        restUserMockMvc
            .perform(get("/api/users/normal-authorization-list"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].login").value(not(hasItem(testAuthAdmin.getLogin()))))
            .andExpect(jsonPath("$.[*].login").value(not(hasItem(testAuthSupervisor.getLogin()))))
            .andExpect(jsonPath("$.[*].login").value(hasItem(testAuthNormalUser.getLogin())));
    }

}
