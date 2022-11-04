package io.planit.cancerlibrary.domain;

import io.planit.cancerlibrary.domain.embedded.ItemAttribute;
import io.planit.cancerlibrary.domain.embedded.ItemProperty;
import io.planit.cancerlibrary.domain.embedded.Lookup;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "ph_item")
@SecondaryTable(name = "ph_item_property", pkJoinColumns = @PrimaryKeyJoinColumn(name = "item_id"))
@SecondaryTable(name = "ph_item_attribute", pkJoinColumns = @PrimaryKeyJoinColumn(name = "item_id"))
public class Item extends AbstractAuditingEntity implements Serializable {

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

    @Column(name = "description")
    private String description;

    @NotNull
    @Column(name = "activated", nullable = false)
    private Boolean activated;

    @Column(name = "order_no")
    private Integer orderNo;

    @NotNull
    @ManyToOne(optional = false)
    private Category category;

    @Embedded
    @AttributeOverride(name = "dataType", column = @Column(name = "data_type", table = "ph_item_attribute"))
    private ItemAttribute attribute;

    @Embedded
    @AttributeOverride(name = "visibleIndex", column = @Column(name = "visible_index", table = "ph_item_property"))
    @AttributeOverride(name = "caption", column = @Column(table = "ph_item_property"))
    @AttributeOverride(name = "allowEditing", column = @Column(name = "allow_editing", table = "ph_item_property"))
    @AttributeOverride(name = "required", column = @Column(name = "required", table = "ph_item_property"))
    @AttributeOverride(name = "sortIndex", column = @Column(name = "sort_index", table = "ph_item_property"))
    @AttributeOverride(name = "sortDirection", column = @Column(name = "sort_direction", table = "ph_item_property"))
    private ItemProperty property;

    @ElementCollection
    @CollectionTable(name = "ph_item_lookup", joinColumns = @JoinColumn(name = "item_id"))
    @Column(name = "title", nullable = false)
    @OrderColumn(name = "order_no")
    private List<Lookup> lookupList = new ArrayList<>();

    public Long getId() {
        return this.id;
    }

    public Item id(Long id) {
        this.setId(id);
        return this;
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

    public Item title(String title) {
        this.setTitle(title);
        return this;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Item description(String description) {
        this.setDescription(description);
        return this;
    }

    public Boolean getActivated() {
        return this.activated;
    }

    public Item activated(Boolean activated) {
        this.setActivated(activated);
        return this;
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

    public Item orderNo(Integer orderNo) {
        this.setOrderNo(orderNo);
        return this;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Item category(Category category) {
        this.setCategory(category);
        return this;
    }

    public ItemAttribute getAttribute() {
        return attribute;
    }

    public void setAttribute(ItemAttribute attribute) {
        this.attribute = attribute;
    }

    public Item attribute(ItemAttribute attribute) {
        this.setAttribute(attribute);
        return this;
    }

    public ItemProperty getProperty() {
        return property;
    }

    public void setProperty(ItemProperty property) {
        this.property = property;
    }

    public Item property(ItemProperty property) {
        this.setProperty(property);
        return this;
    }

    public List<Lookup> getLookupList() {
        return lookupList;
    }

    public void setLookupList(List<Lookup> lookupList) {
        this.lookupList = lookupList;
    }

    public Item lookupList(List<Lookup> lookupList) {
        this.lookupList = lookupList;
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
        Item item = (Item) o;
        return Objects.equals(id, item.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return "Item{" +
            "id=" + id +
            ", title='" + title + '\'' +
            ", description='" + description + '\'' +
            ", activated=" + activated +
            ", orderNo=" + orderNo +
            ", category=" + category +
            ", attribute=" + attribute +
            ", property=" + property +
            ", lookupList=" + lookupList +
            '}';
    }
}
