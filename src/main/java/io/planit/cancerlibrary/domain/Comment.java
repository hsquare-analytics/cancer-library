package io.planit.cancerlibrary.domain;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Entity
@Table(name = "ph_comment")
public class Comment extends AbstractAuditingEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequenceGenerator")
    @SequenceGenerator(name = "sequenceGenerator")
    @Column(name = "id")
    private Long id;

    @NotNull
    @Column(name = "pt_no")
    private String ptNo;

    @NotNull
    @Column(name = "row_id")
    private String rowId;

    @NotNull
    @Column(name = "comment")
    private String comment;

    @NotNull
    @ManyToOne(optional = false)
    private Category category;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Comment id(Long id) {
        this.id = id;
        return this;
    }

    public String getPtNo() {
        return ptNo;
    }

    public void setPtNo(String ptNo) {
        this.ptNo = ptNo;
    }

    public Comment ptNo(String ptNo) {
        this.ptNo = ptNo;
        return this;
    }

    public String getRowId() {
        return rowId;
    }

    public void setRowId(String rowId) {
        this.rowId = rowId;
    }

    public Comment rowId(String rowId) {
        this.rowId = rowId;
        return this;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Comment comment(String comment) {
        this.comment = comment;
        return this;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Comment category(Category category) {
        this.category = category;
        return this;
    }

    @Override
    public String toString() {
        return "Comment{" +
            "id=" + id +
            ", ptNo='" + ptNo + '\'' +
            ", rowId='" + rowId + '\'' +
            ", comment='" + comment + '\'' +
            ", category=" + category +
            '}';
    }
}
