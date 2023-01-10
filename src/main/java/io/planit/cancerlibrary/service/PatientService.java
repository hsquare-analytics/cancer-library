package io.planit.cancerlibrary.service;

import io.planit.cancerlibrary.constant.PatientStatus;
import io.planit.cancerlibrary.constant.Table;
import io.planit.cancerlibrary.domain.Patient;
import io.planit.cancerlibrary.domain.embedded.PatientDetail;
import io.planit.cancerlibrary.repository.PatientDetailRepository;
import io.planit.cancerlibrary.repository.PatientRepository;
import io.planit.cancerlibrary.security.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.time.Instant;
import java.util.Objects;
import java.util.Optional;

@Service
@Transactional
public class PatientService {
    private final Logger log = LoggerFactory.getLogger(PatientService.class);

    private final PatientRepository patientRepository;

    private final PatientDetailRepository patientDetailRepository;

    public PatientService(PatientRepository patientRepository, PatientDetailRepository patientDetailRepository) {
        this.patientRepository = patientRepository;
        this.patientDetailRepository = patientDetailRepository;
    }

    public Optional<Patient> updatePatient(Patient patientDTO) {
        String login = SecurityUtils.getCurrentUserLogin()
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED));

        return patientRepository.findByPatientNo(patientDTO.getPtNo())
            .map(existPatient -> {
                PatientDetail existDetail = existPatient.getDetail();
                if (Objects.nonNull(patientDTO.getDetail().getStatus())) {
                    existDetail.setStatus(patientDTO.getDetail().getStatus());
                }

                if (Objects.nonNull(patientDTO.getDetail().getComment())) {
                    existDetail.setComment(patientDTO.getDetail().getComment());
                }

                if (Objects.nonNull(patientDTO.getDetail().getDeclineReason())) {
                    existDetail.setDeclineReason(patientDTO.getDetail().getDeclineReason());
                }

                if (PatientStatus.REVIEW_SUBMITTED.equals(patientDTO.getDetail().getStatus())) {
                    existDetail.setCreatedBy(login);
                    existDetail.setCreatedDate(Instant.now());
                }

                if (Objects.nonNull(patientDTO.getDetail().getStandardDate())) {
                    existDetail.setStandardDate(patientDTO.getDetail().getStandardDate());
                }

                existDetail.setLastModifiedBy(login);
                existDetail.setLastModifiedDate(Instant.now());
                return existPatient.detail(existDetail);
            }).map(data -> {
                log.debug("Changed detail for patient: {}", data);

                if (patientRepository.checkRowExistByPtNoOnTable(Table.PATIENT_DETAIL, patientDTO.getPtNo())) {
                    patientDetailRepository.update(patientDTO.getPtNo(), data.getDetail());
                } else {
                    patientDetailRepository.insert(patientDTO.getPtNo(), data.getDetail());
                }

                return data;
            });

    }
}
