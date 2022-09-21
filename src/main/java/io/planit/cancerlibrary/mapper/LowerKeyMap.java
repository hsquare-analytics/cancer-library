package io.planit.cancerlibrary.mapper;

import org.apache.commons.collections4.map.ListOrderedMap;
import org.apache.commons.lang3.StringUtils;

public class LowerKeyMap extends ListOrderedMap {

    public Object put(Object key, Object value) {
        return super.put(StringUtils.lowerCase((String) key), value);
    }
}
