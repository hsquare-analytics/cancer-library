package io.planit.cancerlibrary.mapper;

import io.planit.cancerlibrary.service.dto.PatientDTO;
import java.util.List;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PatientMapper {
    @MapKey("id")
    List<PatientDTO> findAll();

    List<PatientDTO> findAllByPatientNos(List<String> patientNos);

    int insert(PatientDTO patient);
}
