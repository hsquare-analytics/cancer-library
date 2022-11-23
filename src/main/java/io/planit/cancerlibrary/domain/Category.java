package io.planit.cancerlibrary.domain;

import io.planit.cancerlibrary.domain.embedded.CategoryAttribute;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "ph_category")
@SecondaryTable(name = "ph_category_attribute", pkJoinColumns = @PrimaryKeyJoinColumn(name = "category_id"))
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
    @Column(name = "activated", nullable = false)
    private boolean activated;

    @NotNull
    @Column(name = "order_no", nullable = false)
    private Integer orderNo;

    @Embedded
    @AttributeOverride(name = "dateColumn", column = @Column(name = "date_column", table = "ph_category_attribute"))
    @AttributeOverride(name = "caption", column = @Column(table = "ph_category_attribute"))
    private CategoryAttribute attribute;

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

    public CategoryAttribute getAttribute() {
        return attribute;
    }

    public void setAttribute(CategoryAttribute attribute) {
        this.attribute = attribute;
    }

    public Category attribute(CategoryAttribute attribute) {
        this.attribute = attribute;
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
            ", activated=" + activated +
            ", orderNo=" + orderNo +
            ", attribute=" + attribute +
            ", topic=" + topic +
            '}';
    }
}
