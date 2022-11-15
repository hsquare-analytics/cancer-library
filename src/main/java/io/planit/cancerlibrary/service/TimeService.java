package io.planit.cancerlibrary.service;

import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.Instant;

@Service
public class TimeService {
    public Instant getCurrentTime() {
        return Instant.now();
    }

    public Timestamp getCurrentTimestamp() {
        return Timestamp.from(Instant.now());
    }
}
