package io.planit.cancerlibrary.service.dto;

import io.planit.cancerlibrary.domain.Subject;
import io.planit.cancerlibrary.domain.Topic;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.Instant;

public class TopicDTO {

    private Long id;

    @NotNull
    @Size(max = 50)
    private String title;

    @NotNull
    private Boolean activated;

    @NotNull
    private Integer orderNo;

    @NotNull
    private Subject subject;

    private String createdBy;

    private Instant createdDate;

    private String lastModifiedBy;

    private Instant lastModifiedDate;

    public TopicDTO() {
    }

    public TopicDTO(Topic topic) {
        this.id = topic.getId();
        this.title = topic.getTitle();
        this.activated = topic.getActivated();
        this.orderNo = topic.getOrderNo();
        this.subject = topic.getSubject();
        this.createdBy = topic.getCreatedBy();
        this.createdDate = topic.getCreatedDate();
        this.lastModifiedBy = topic.getLastModifiedBy();
        this.lastModifiedDate = topic.getLastModifiedDate();
    }

    public Topic toEntity() {
        Topic topic = new Topic();
        topic.setId(this.id);
        topic.setTitle(this.title);
        topic.setActivated(this.activated);
        topic.setOrderNo(this.orderNo);
        topic.setSubject(this.subject);
        topic.setCreatedBy(this.createdBy);
        topic.setCreatedDate(this.createdDate);
        topic.setLastModifiedBy(this.lastModifiedBy);
        topic.setLastModifiedDate(this.lastModifiedDate);
        return topic;
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

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
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
