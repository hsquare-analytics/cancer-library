package io.planit.cancerlibrary.service.dto;

import io.planit.cancerlibrary.domain.Subject;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class SubjectDTO {

    private Long id;

    @NotNull
    @Size(max = 50)
    private String title;

    @NotNull
    private Boolean activated;

    @NotNull
    private Integer orderNo;

    public SubjectDTO() {
    }

    public SubjectDTO(Subject subject) {
        this.id = subject.getId();
        this.title = subject.getTitle();
        this.activated = subject.getActivated();
        this.orderNo = subject.getOrderNo();
    }

    public Subject toEntity() {
        Subject subject = new Subject();
        subject.setId(this.id);
        subject.setTitle(this.title);
        subject.setActivated(this.activated);
        subject.setOrderNo(this.orderNo);
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
}
