package io.planit.cancerlibrary.domain.meta.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import io.planit.cancerlibrary.core.sql.utils.ConvertUtils;
import io.planit.cancerlibrary.domain.meta.constant.MetaDataType;
import io.planit.cancerlibrary.domain.meta.dto.MetaSubjectDto;
import io.planit.cancerlibrary.domain.meta.mapper.MetaMapper;
import io.planit.cancerlibrary.domain.meta.mapper.MetaSubjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
@Slf4j
@RequiredArgsConstructor
public class SubjectMetaService implements MetaService <MetaSubjectDto> {
    private final MetaSubjectMapper metaMapper;
    Class<MetaSubjectDto> domain = MetaSubjectDto.class;

    @Override
    public List<MetaSubjectDto> getMetaList(MetaDataType type) {
        return metaMapper.getMetaList(domain, type.getTableName());
    }

    @Override
    public Optional<MetaSubjectDto> getMeta(MetaDataType type, Map<String, Object> param) {
        MetaSubjectDto result = metaMapper.getMeta(domain, type.getTableName(), param);

        return Optional.ofNullable(result);
    }

    @Override
    public Optional<Boolean> insertMeta(MetaDataType type, Map<String, Object> param) {
        boolean isInsert = metaMapper.insertMeta(domain, type.getTableName(), param);
        return Optional.of(isInsert);
    }

    @Override
    public Optional<Integer> updateMeta(MetaDataType type, Map<String, Object> newParam, Map<String, Object> oldParam) {
        int updateCount = metaMapper.updateMeta(domain, type.getTableName(), newParam, oldParam);
        return Optional.of(updateCount);
    }

    @Override
    public Optional<Boolean> deleteMeta(MetaDataType type, Map<String, Object> param) {
       boolean isDelete = metaMapper.deleteMeta(domain, type.getTableName(), param);
       return Optional.of(isDelete);
    }
}
