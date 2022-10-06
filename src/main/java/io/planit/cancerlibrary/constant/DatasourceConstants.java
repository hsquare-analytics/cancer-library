package io.planit.cancerlibrary.constant;

public final class DatasourceConstants {
    public static final String IDX_COLUMN = "IDX";
    public static final String STATUS_COLUMN = "STATUS";
    public static final String UPDATED_SUFFIX = "_UPDATED";
    public static final String SQL_EQUAL_SYNTAX = "%s = '%s'";
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
}
