package io.planit.cancerlibrary.service.dto;

import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.domain.Comment;

import javax.validation.constraints.NotNull;
import java.time.Instant;

public class CommentDTO {

    private Long id;

    @NotNull
    private String ptNo;

    @NotNull
    private String rowId;

    @NotNull
    private String comment;

    @NotNull
    private Category category;

    private String createdBy;

    private Instant createdDate;

    private String lastModifiedBy;

    private Instant lastModifiedDate;

    public CommentDTO() {
    }

    public CommentDTO(Comment comment) {
        this.id = comment.getId();
        this.ptNo = comment.getPtNo();
        this.rowId = comment.getRowId();
        this.comment = comment.getComment();
        this.category = comment.getCategory();
        this.createdBy = comment.getCreatedBy();
        this.createdDate = comment.getCreatedDate();
        this.lastModifiedBy = comment.getLastModifiedBy();
        this.lastModifiedDate = comment.getLastModifiedDate();
    }

    public Comment toEntity() {
        Comment comment = new Comment();
        comment.setId(this.id);
        comment.setPtNo(this.ptNo);
        comment.setRowId(this.rowId);
        comment.setComment(this.comment);
        comment.setCategory(this.category);
        comment.setCreatedBy(this.createdBy);
        comment.setCreatedDate(this.createdDate);
        comment.setLastModifiedBy(this.lastModifiedBy);
        comment.setLastModifiedDate(this.lastModifiedDate);
        return comment;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPtNo() {
        return ptNo;
    }

    public void setPtNo(String ptNo) {
        this.ptNo = ptNo;
    }

    public String getRowId() {
        return rowId;
    }

    public void setRowId(String rowId) {
        this.rowId = rowId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
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
