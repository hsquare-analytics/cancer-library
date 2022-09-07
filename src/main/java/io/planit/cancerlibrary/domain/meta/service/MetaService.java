package io.planit.cancerlibrary.domain.meta.service;

import io.planit.cancerlibrary.domain.meta.constant.MetaDataType;

import java.util.List;
import java.util.Optional;

public interface MetaService<T> {
   default List<T> getMetaList (MetaDataType type) {
       return null;
   }
   default Optional<T> getMeta(MetaDataType type) {
       return Optional.empty();
   }
}
