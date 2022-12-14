package io.planit.cancerlibrary.service.dto;

import io.planit.cancerlibrary.domain.Subject;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.Instant;

public class SubjectDTO {

    private Long id;

    @NotNull
    @Size(max = 50)
    private String title;

    @NotNull
    private Boolean activated;

    @NotNull
    private Integer orderNo;

    private String createdBy;

    private Instant createdDate;

    private String lastModifiedBy;

    private Instant lastModifiedDate;

    public SubjectDTO() {
    }

    public SubjectDTO(Subject subject) {
        this.id = subject.getId();
        this.title = subject.getTitle();
        this.activated = subject.getActivated();
        this.orderNo = subject.getOrderNo();
        this.createdBy = subject.getCreatedBy();
        this.createdDate = subject.getCreatedDate();
        this.lastModifiedBy = subject.getLastModifiedBy();
        this.lastModifiedDate = subject.getLastModifiedDate();
    }

    public Subject toEntity() {
        Subject subject = new Subject();
        subject.setId(this.id);
        subject.setTitle(this.title);
        subject.setActivated(this.activated);
        subject.setOrderNo(this.orderNo);
        subject.setCreatedBy(this.createdBy);
        subject.setCreatedDate(this.createdDate);
        subject.setLastModifiedBy(this.lastModifiedBy);
        subject.setLastModifiedDate(this.lastModifiedDate);
        return subject;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Boolean getActivated() {
        return activated;
    }

    public void setActivated(Boolean activated) {
        this.activated = activated;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
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
