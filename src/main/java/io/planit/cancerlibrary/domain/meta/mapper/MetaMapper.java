package io.planit.cancerlibrary.domain.meta.mapper;

import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface MetaMapper<T> {
    @SelectProvider(type= MetaProvider.class, method = "getSelectMetaList")
    List<T> getMetaList(Class<T> domain, String table);

    @SelectProvider(type= MetaProvider.class, method = "getSelectMeta")
    T getMeta(Class<T> domain, String table, Map<String, Object> param);

    @InsertProvider(type=MetaProvider.class, method = "getInsertMeta")
    boolean insertMeta(Class<T> domain, String Table, Map<String, Object> param);

    @UpdateProvider(type=MetaProvider.class, method = "getUpdateMeta")
    int updateMeta(Class<T> domain, String table, Map<String, Object> newParam, Map<String, Object> oldParam);

    @DeleteProvider(type = MetaProvider.class, method = "getDeleteMeta")
    boolean deleteMeta(Class<T> domain, String Table, Map<String, Object> param);
}
