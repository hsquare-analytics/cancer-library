package io.planit.cancerlibrary.domain.meta.service;

import io.planit.cancerlibrary.domain.meta.dto.MetaSubjectDto;
import io.planit.cancerlibrary.domain.meta.mapper.MetaMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class SubjectMetaService implements MetaService <MetaSubjectDto> {
    private MetaMapper<MetaSubjectDto> metaMapper;

    @Override
    public List<MetaSubjectDto> getMetaList() {
        return null;
    }

    @Override
    public MetaSubjectDto getMeta() {
        return null;
    }
}
