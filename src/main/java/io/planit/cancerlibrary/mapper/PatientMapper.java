package io.planit.cancerlibrary.mapper;

import io.planit.cancerlibrary.domain.Patient;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;

import java.time.Instant;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Mapper
public interface PatientMapper {

    @MapKey("id")
    List<Patient> findAll();

    @MapKey("id")
    List<Patient> findAllByCreatedDateBetween(Map<String, Instant> dateRange);

    List<Patient> findAllByPatientNos(List<String> patientNos);

    int insert(Patient patient);

    boolean existsByPatientNo(String patientNo);

    Optional<Patient> findByPatientNo(String patientNo);

    int update(Patient patient);
}

