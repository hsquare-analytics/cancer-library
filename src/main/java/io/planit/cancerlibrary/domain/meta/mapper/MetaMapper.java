package io.planit.cancerlibrary.domain.meta.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MetaMapper<T> {
    List<T> getMetaList(String type);
    T getMeta(String type);
}
