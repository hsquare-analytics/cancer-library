package io.planit.cancerlibrary.service;

import java.time.Instant;
import org.springframework.stereotype.Service;

@Service
public class InstantService {

    public Instant getCurrentTime() {
        return Instant.now();
    }
}
