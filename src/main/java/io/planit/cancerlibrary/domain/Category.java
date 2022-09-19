package io.planit.cancerlibrary.domain;

import java.io.Serializable;
import java.time.Instant;
import java.util.Objects;
import javax.persistence.*;
import javax.validation.constraints.*;
import org.springframework.data.annotation.CreatedDate;

@Entity
@Table(name = "ph_category")
public class Category extends AbstractAuditingEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequenceGenerator")
    @SequenceGenerator(name = "sequenceGenerator")
    @Column(name = "id")
    private Long id;

    @NotNull
    @Size(max = 30)
    @Column(name = "title", length = 30, nullable = false)
    private String title;

    @NotNull
    @Size(max = 30)
    @Column(name = "description", length = 30, nullable = false)
    private String description;

    @NotNull
    @Column(name = "date_column")
    private String dateColumn;

    @NotNull
    @Column(name = "activated", nullable = false)
    private boolean activated;

    @NotNull
    @Column(name = "order_no", nullable = false)
    private Integer orderNo;

    @NotNull
    @ManyToOne(optional = false)
    private Topic topic;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Category id(Long id) {
        this.id = id;
        return this;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Category title(String title) {
        this.title = title;
        return this;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Category description(String description) {
        this.description = description;
        return this;
    }

    public String getDateColumn() {
        return dateColumn;
    }

    public void setDateColumn(String dateColumn) {
        this.dateColumn = dateColumn;
    }

    public Category dateColumn(String dateColumn) {
        this.dateColumn = dateColumn;
        return this;
    }

    public boolean isActivated() {
        return activated;
    }

    public void setActivated(boolean activated) {
        this.activated = activated;
    }

    public Category activated(boolean activated) {
        this.activated = activated;
        return this;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    public Category orderNo(Integer orderNo) {
        this.orderNo = orderNo;
        return this;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    public Category topic(Topic topic) {
        this.topic = topic;
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Category category = (Category) o;
        return Objects.equals(id, category.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return "Category{" +
            "id=" + id +
            ", title='" + title + '\'' +
            ", description='" + description + '\'' +
            ", dateColumn='" + dateColumn + '\'' +
            ", activated=" + activated +
            ", orderNo=" + orderNo +
            ", topic=" + topic +
            '}';
    }
}
