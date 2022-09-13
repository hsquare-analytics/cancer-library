package io.planit.cancerlibrary.core.sql.utils;

import java.util.Arrays;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;

public class ProviderUtils {

    public static String getColumns(Class domain) {
        StringBuilder builder = new StringBuilder();
        Arrays.stream( domain.getDeclaredFields()).forEach(item ->
            builder.append(toLowerCase(item.getName()).orElseThrow())
            .append(", "));

        builder.deleteCharAt(builder.toString().length() - 2);
        return  builder.toString();
    }

    // TODO : Table, Column Alias


    // TODO END

    public static Optional<String> toLowerCase(String str) {
        String regex = "([a-z])([A-Z]+)";
        String replacement = "$1_$2";

        String columns = str.replaceAll(regex, replacement).toLowerCase(Locale.ROOT);

        return Optional.of(columns);
    }

    public static Optional<String> apostrophe(Object param) {
        if (param == null) return Optional.empty();
        return Optional.of("'" + param + "'");
    }

    private static void append(StringBuilder builder, Object param) {
        if (param instanceof String) {
            builder.append(param);
        } else if (param instanceof Integer) {
            builder.append( ((Integer) param).intValue() );
        } else if (param instanceof  Long) {
            builder.append( ((Long) param).longValue() );
        } else if (param instanceof Number) {
            builder.append( ((Number) param).floatValue() );
        } else if (param instanceof Boolean)  {
            builder.append( ((Boolean) param).booleanValue() );
        } else {
            throw new NumberFormatException();
        }
    }

    public static Optional<String> is(Object param) {
        StringBuilder builder = new StringBuilder();
        builder.append(" = '");
        append(builder, param);
        builder.append("'");

        return Optional.of(builder.toString());
    }

    public static Optional<String> is(Map<String, Object> param, String key) {
        return is(param.get(key));
    }

    public static Optional<String> like(Object param) throws Exception {
        StringBuilder builder = new StringBuilder();
        builder.append(" LIKE '%");
        append(builder, param);
        builder.append("%'");

        return Optional.of(builder.toString());
    }

    public static Optional<String> like(Map<String, Object> param, String key) throws Exception {
        return like(param.get(key));
    }
}
