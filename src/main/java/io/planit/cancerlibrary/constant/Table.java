package io.planit.cancerlibrary.constant;

public enum Table {
    PATIENT_VIEW("PH_PATIENT"),
    PATIENT_DETAIL("PH_PATIENT_DETAIL");

    private String tableName;

    Table(String tableName) {
        this.tableName = tableName;
    }

    public String getTableName() {
        return tableName;
    }
}
