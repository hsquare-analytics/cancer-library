package io.planit.cancerlibrary.mapper;

import io.planit.cancerlibrary.service.dto.PatientDTO;
import java.util.List;
import java.util.Optional;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PatientMapper {

    @MapKey("id")
    List<PatientDTO> findAll();

    List<PatientDTO> findAllByPatientNos(List<String> patientNos);

    int insert(PatientDTO patient);

    boolean existsByPatientNo(String patientNo);

    Optional<PatientDTO> findByPatientNo(String patientNo);

    int update(PatientDTO patient);
}

