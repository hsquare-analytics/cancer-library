package io.planit.cancerlibrary.constant;

public enum RowStatus {
    COMPLETED("COMPLETED"),
    IN_PROGRESS("IN_PROGRESS"),
    NOT_STARTED("NOT_STARTED"),
    DISABLED("DISABLED");

    private final String status;

    RowStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }
}
