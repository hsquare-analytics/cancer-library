package io.planit.cancerlibrary.constant;

import org.apache.commons.lang3.ObjectUtils;

import java.util.List;

public final class DatasourceConstants {
    public static final String IDX_COLUMN = "IDX";
    public static final String PATIENT_NUMBER_COLUMN = "PT_NO";
    public static final String STATUS_COLUMN = "STATUS";
    public static final String UPDATED_SUFFIX = "_UPDATED";
    public static final String CREATED_BY = "CREATED_BY";
    public static final String CREATED_DATE = "CREATED_DATE";
    public static final String LAST_MODIFIED_BY = "LAST_MODIFIED_BY";
    public static final String LAST_MODIFIED_DATE = "LAST_MODIFIED_DATE";

    private DatasourceConstants() {
    }

    public static String sqlization(String key) {
        return key.toUpperCase();
    }

    public static String parameterization(String key) {
        return key.toLowerCase();
    }

    public static List<String> getMarkingColumns() {
        return List.of(STATUS_COLUMN, CREATED_BY, CREATED_DATE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE);
    }

    public static String getSqlEqualSyntax(String key, Object value) {
        if (ObjectUtils.isEmpty(value)) {
            return String.format("%s = %s", sqlization(key), null);
        }

        return String.format("%s = '%s'", sqlization(key), value);
    }
}
