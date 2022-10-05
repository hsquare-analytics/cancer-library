package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.mapper.PatientMapper;
import io.planit.cancerlibrary.service.dto.PatientDTO;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
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
    public ResponseEntity<Integer> createPatient(@RequestBody PatientDTO patientDTO)
        throws URISyntaxException {
        log.debug("REST request to save Patient : {}", patientDTO);

        int result = patientMapper.insert(patientDTO);

        return ResponseEntity.created(new URI("/api/patients/" + result)).body(result);
    }

    @GetMapping(("/patients"))
    public ResponseEntity<List<PatientDTO>> getAllPatients() {
        log.debug("REST request to get all Patients");

        List<PatientDTO> result = patientMapper.findAll();
        return ResponseEntity.ok().body(result);
    }
}
