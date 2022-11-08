package io.planit.cancerlibrary.service.dto;

import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.domain.User;
import io.planit.cancerlibrary.domain.UserCategory;

import javax.validation.constraints.NotNull;
import java.time.Instant;

public class UserCategoryDTO  {

    private Long id;

    @NotNull
    private User user;

    @NotNull
    private Category category;

    @NotNull
    private boolean activated = false;

    private Instant termStart;

    private Instant termEnd;

    private String createdBy;

    private Instant createdDate;

    private String lastModifiedBy;

    private Instant lastModifiedDate;

    public UserCategoryDTO() {
    }

    public UserCategoryDTO(UserCategory userCategory) {
        this.id = userCategory.getId();
        this.user = userCategory.getUser();
        this.category = userCategory.getCategory();
        this.activated = userCategory.isActivated();
        this.termStart = userCategory.getTermStart();
        this.termEnd = userCategory.getTermEnd();
        this.createdBy = userCategory.getCreatedBy();
        this.createdDate = userCategory.getCreatedDate();
        this.lastModifiedBy = userCategory.getLastModifiedBy();
        this.lastModifiedDate = userCategory.getLastModifiedDate();
    }

    public UserCategory toEntity() {
        UserCategory userCategory = new UserCategory();
        userCategory.setId(this.id);
        userCategory.setUser(this.user);
        userCategory.setCategory(this.category);
        userCategory.setActivated(this.activated);
        userCategory.setTermStart(this.termStart);
        userCategory.setTermEnd(this.termEnd);
        userCategory.setCreatedBy(this.createdBy);
        userCategory.setCreatedDate(this.createdDate);
        userCategory.setLastModifiedBy(this.lastModifiedBy);
        userCategory.setLastModifiedDate(this.lastModifiedDate);
        return userCategory;
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

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public boolean isActivated() {
        return activated;
    }

    public void setActivated(boolean activated) {
        this.activated = activated;
    }

    public Instant getTermStart() {
        return termStart;
    }

    public void setTermStart(Instant termStart) {
        this.termStart = termStart;
    }

    public Instant getTermEnd() {
        return termEnd;
    }

    public void setTermEnd(Instant termEnd) {
        this.termEnd = termEnd;
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
