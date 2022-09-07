package io.planit.cancerlibrary.domain.meta.service;

import io.planit.cancerlibrary.domain.meta.constant.MetaDataType;
import io.planit.cancerlibrary.domain.meta.dto.MetaSubjectDto;
import io.planit.cancerlibrary.domain.meta.mapper.MetaMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class SubjectMetaService implements MetaService <MetaSubjectDto> {
    private MetaMapper<MetaSubjectDto> metaMapper;

    @Override
    public List<MetaSubjectDto> getMetaList(MetaDataType type) {
        return null;
    }

    @Override
    public Optional<MetaSubjectDto> getMeta(MetaDataType type) {
        return null;
    }
}
