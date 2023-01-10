package io.planit.cancerlibrary.constant;

public enum PatientStatus {

    REVIEW_SUBMITTED("REVIEW_SUBMITTED"),
    REVIEW_DECLINED("REVIEW_DECLINED"),
    REVIEW_APPROVED("REVIEW_APPROVED");

    private final String status;

    PatientStatus(String status) {
        this.status = status;
    }
}
