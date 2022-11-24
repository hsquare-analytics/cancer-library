package io.planit.cancerlibrary.service;

import org.junit.jupiter.api.Test;

import java.sql.Timestamp;

import static org.junit.jupiter.api.Assertions.assertEquals;

class TimeServiceTest {

    @Test
    void convertTimezoneStringToTimestamp() {
        TimeService timeService = new TimeService();
        String timezoneString = "2019-01-01T00:00:00+00:00";
        Timestamp actualTimestamp = timeService.convertTimezoneStringToTimestamp(timezoneString);

        assertEquals("2019-01-01 09:00:00.0", actualTimestamp.toString());
    }
}
