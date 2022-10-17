package io.planit.cancerlibrary.mapper;

import io.planit.cancerlibrary.domain.Patient;
import java.util.List;
import java.util.Optional;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PatientMapper {

    @MapKey("id")
    List<Patient> findAll();

    List<Patient> findAllByPatientNos(List<String> patientNos);

    int insert(Patient patient);

    boolean existsByPatientNo(String patientNo);

    Optional<Patient> findByPatientNo(String patientNo);

    int update(Patient patient);
}

