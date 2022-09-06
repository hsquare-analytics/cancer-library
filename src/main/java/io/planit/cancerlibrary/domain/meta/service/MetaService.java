package io.planit.cancerlibrary.domain.meta.service;

import java.util.List;

public interface MetaService<T> {
   List<T> getMetaList ();
   T getMeta();
}
