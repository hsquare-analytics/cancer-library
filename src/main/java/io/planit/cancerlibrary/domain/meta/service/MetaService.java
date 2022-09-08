package io.planit.cancerlibrary.domain.meta.service;

import io.planit.cancerlibrary.domain.meta.constant.MetaDataType;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface MetaService<T> {
   default List<T> getMetaList (MetaDataType type) {
       return null;
   }
   default Optional<T> getMeta(MetaDataType type, Map<String, Object> param) {
       return Optional.empty();
   }

   default Optional<Boolean> insertMeta(MetaDataType type, Map<String, Object> param) {
       return Optional.of(false);
   }

   default Optional<Integer> updateMeta(MetaDataType type, Map<String, Object> newParam, Map<String, Object> oldParam) {
        return Optional.of(0);
   }

   default Optional<Boolean> deleteMeta(MetaDataType type, Map<String, Object> param) {
        return Optional.of(false);
   }
}
