package io.planit.cancerlibrary.domain.embedded;

import io.planit.cancerlibrary.constant.PatientStatus;

import java.time.Instant;

public class PatientDetail {
    public static final String TABLE = "PH_PATIENT_DETAIL";

    private String comment;
    private String declineReason;
    private PatientStatus status;
    private Instant standardDate;
    private String createdBy;
    private Instant createdDate;
    private String lastModifiedBy;
    private Instant lastModifiedDate;

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public PatientDetail comment(String comment) {
        this.comment = comment;
        return this;
    }

    public String getDeclineReason() {
        return declineReason;
    }

    public void setDeclineReason(String declineReason) {
        this.declineReason = declineReason;
    }

    public PatientDetail declineReason(String declineReason) {
        this.declineReason = declineReason;
        return this;
    }
    public PatientStatus getStatus() {
        return status;
    }

    public void setStatus(PatientStatus status) {
        this.status = status;
    }

    public PatientDetail status(PatientStatus status) {
        this.status = status;
        return this;
    }

    public Instant getStandardDate() {
        return standardDate;
    }

    public void setStandardDate(Instant standardDate) {
        this.standardDate = standardDate;
    }

    public PatientDetail standardDate(Instant standardDate) {
        this.standardDate = standardDate;
        return this;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public PatientDetail createdBy(String createdBy) {
        this.createdBy = createdBy;
        return this;
    }

    public Instant getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Instant createdDate) {
        this.createdDate = createdDate;
    }

    public PatientDetail createdDate(Instant createdDate) {
        this.createdDate = createdDate;
        return this;
    }

    public String getLastModifiedBy() {
        return lastModifiedBy;
    }

    public void setLastModifiedBy(String lastModifiedBy) {
        this.lastModifiedBy = lastModifiedBy;
    }

    public PatientDetail lastModifiedBy(String lastModifiedBy) {
        this.lastModifiedBy = lastModifiedBy;
        return this;
    }

    public Instant getLastModifiedDate() {
        return lastModifiedDate;
    }

    public void setLastModifiedDate(Instant lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
    }

    public PatientDetail lastModifiedDate(Instant lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
        return this;
    }
}
