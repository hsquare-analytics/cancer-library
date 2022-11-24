package io.planit.cancerlibrary.service;

import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.Instant;
import java.time.OffsetDateTime;

@Service
public class TimeService {
    public Instant getCurrentTime() {
        return Instant.now();
    }

    public Timestamp getCurrentTimestamp() {
        return Timestamp.from(Instant.now());
    }

    public Timestamp convertTimezoneStringToTimestamp(String timezoneString) {
        OffsetDateTime odt = OffsetDateTime.parse(timezoneString);
        Instant instant = odt.toInstant();
        return Timestamp.from(instant);
    }
}
