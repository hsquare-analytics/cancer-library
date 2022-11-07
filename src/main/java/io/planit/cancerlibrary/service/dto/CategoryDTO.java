package io.planit.cancerlibrary.service.dto;

import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.domain.Topic;
import io.planit.cancerlibrary.domain.embedded.CategoryProperty;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.Instant;

public class CategoryDTO {

    private Long id;

    @NotNull
    @Size(max = 30)
    private String title;

    @NotNull
    @Size(max = 30)
    private String description;

    @NotNull
    private boolean activated;

    @NotNull
    private Integer orderNo;

    private CategoryProperty property;

    @NotNull
    private Topic topic;

    private String createdBy;

    private Instant createdDate;

    private String lastModifiedBy;

    private Instant lastModifiedDate;

    public CategoryDTO() {
    }

    public CategoryDTO(Category category) {
        this.id = category.getId();
        this.title = category.getTitle();
        this.description = category.getDescription();
        this.activated = category.isActivated();
        this.orderNo = category.getOrderNo();
        this.property = category.getProperty();
        this.topic = category.getTopic();
        this.createdBy = category.getCreatedBy();
        this.createdDate = category.getCreatedDate();
        this.lastModifiedBy = category.getLastModifiedBy();
        this.lastModifiedDate = category.getLastModifiedDate();
    }

    public Category toEntity() {
        Category category = new Category();
        category.setId(this.id);
        category.setTitle(this.title);
        category.setDescription(this.description);
        category.setActivated(this.activated);
        category.setOrderNo(this.orderNo);
        category.setProperty(this.property);
        category.setTopic(this.topic);
        category.setCreatedBy(this.createdBy);
        category.setCreatedDate(this.createdDate);
        category.setLastModifiedBy(this.lastModifiedBy);
        category.setLastModifiedDate(this.lastModifiedDate);
        return category;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isActivated() {
        return activated;
    }

    public void setActivated(boolean activated) {
        this.activated = activated;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    public CategoryProperty getProperty() {
        return property;
    }

    public void setProperty(CategoryProperty property) {
        this.property = property;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
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
}
