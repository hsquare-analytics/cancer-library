package io.planit.cancerlibrary.core.sql.datasource;

public class DataSourceUtils {
    private static String innerUniqueDbKey;
    private static String innerUniqueDbKeySuffix = "";

    public static void setInnerUniqueDbKey(String uniqueDbKey) {
        innerUniqueDbKey = uniqueDbKey;
    }

    public static String getInnerUniqueDbKey() {
        return String.format("%s%s", innerUniqueDbKey, innerUniqueDbKeySuffix);
    }
}
