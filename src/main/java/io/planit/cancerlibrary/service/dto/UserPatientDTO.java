package io.planit.cancerlibrary.service.dto;

import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.domain.UserPatient;

import javax.validation.constraints.NotNull;
import java.time.Instant;

public class UserPatientDTO {

    private Long id;

    @NotNull
    private User user;

    @NotNull
    private String patientNo;

    private String createdBy;

    private Instant createdDate;

    private String lastModifiedBy;

    private Instant lastModifiedDate;

    public UserPatientDTO() {
    }

    public UserPatientDTO(UserPatient userPatient) {
        this.id = userPatient.getId();
        this.user = userPatient.getUser();
        this.patientNo = userPatient.getPatientNo();
        this.createdBy = userPatient.getCreatedBy();
        this.createdDate = userPatient.getCreatedDate();
        this.lastModifiedBy = userPatient.getLastModifiedBy();
        this.lastModifiedDate = userPatient.getLastModifiedDate();
    }

    public UserPatient toEntity() {
        UserPatient userPatient = new UserPatient();
        userPatient.setId(this.id);
        userPatient.setUser(this.user);
        userPatient.setPatientNo(this.patientNo);
        userPatient.setCreatedBy(this.createdBy);
        userPatient.setCreatedDate(this.createdDate);
        userPatient.setLastModifiedBy(this.lastModifiedBy);
        userPatient.setLastModifiedDate(this.lastModifiedDate);
        return userPatient;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getPatientNo() {
        return patientNo;
    }

    public void setPatientNo(String patientNo) {
        this.patientNo = patientNo;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Instant getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Instant createdDate) {
        this.createdDate = createdDate;
    }

    public String getLastModifiedBy() {
        return lastModifiedBy;
    }

    public void setLastModifiedBy(String lastModifiedBy) {
        this.lastModifiedBy = lastModifiedBy;
    }

    public Instant getLastModifiedDate() {
        return lastModifiedDate;
    }

    public void setLastModifiedDate(Instant lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
    }
}
