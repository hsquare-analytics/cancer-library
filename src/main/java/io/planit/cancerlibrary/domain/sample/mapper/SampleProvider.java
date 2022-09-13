package io.planit.cancerlibrary.domain.sample.mapper;

import org.apache.ibatis.jdbc.SQL;

public class SampleProvider {
    public String get() {
        return new SQL().SELECT("1").toString();
    }

}
