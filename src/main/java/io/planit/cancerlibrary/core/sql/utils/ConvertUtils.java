package io.planit.cancerlibrary.core.sql.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@Slf4j
public class ConvertUtils {
    public static Map<String, Object> toMap(Class clazz, Object param) {
        Map<String, Object> objectMap = new HashMap<>();
        Arrays.stream(clazz.getDeclaredFields()).forEach(item -> {
            Class targetType = item.getType();
            String itemName = item.getName();
            try {
                item.setAccessible(true);
                Object value = item.get(param);
                if (targetType.getName().equals("int") && (int) value > 0) {
                    objectMap.put(itemName, value);
                } else if (!targetType.getName().equals("int") && value != null) {
                    objectMap.put(itemName, value);
                } else {
                    /* do not work */
                }
            } catch (Exception e) {
                log.error(e.getMessage());
            }
        });

        return objectMap;
    }
}
