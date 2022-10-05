package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.mapper.PatientMapper;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@Transactional
public class PatientResource {

    private final Logger log = LoggerFactory.getLogger(PatientResource.class);

    private final PatientMapper patientMapper;

    public PatientResource(PatientMapper patientMapper) {
        this.patientMapper = patientMapper;
    }

    @PostMapping("/patients")
    public ResponseEntity<Integer> createPatient(@RequestBody Map<String, Object> patientMap)
        throws URISyntaxException {
        log.debug("REST request to save Patient : {}", patientMapper);

        int result = patientMapper.insert(patientMap);

        return ResponseEntity.created(new URI("/api/patients/" + result)).body(result);
    }
}
