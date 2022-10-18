package io.planit.cancerlibrary.domain;

import io.planit.cancerlibrary.domain.embedded.ItemAttribute;
import io.planit.cancerlibrary.domain.embedded.ItemProperty;
import java.io.Serializable;
import java.util.Objects;
import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.SecondaryTable;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

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
    private Group group;

    @Embedded
    @AttributeOverride(name = "dataType", column = @Column(name = "data_type", table = "ph_item_attribute"))
    private ItemAttribute itemAttribute;

    @Embedded
    @AttributeOverride(name = "visibleIndex", column = @Column(name = "visible_index", table = "ph_item_property"))
    @AttributeOverride(name = "caption", column = @Column(table = "ph_item_property"))
    private ItemProperty itemProperty;

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

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public Item group(Group group) {
        this.setGroup(group);
        return this;
    }

    public ItemAttribute getItemAttribute() {
        return itemAttribute;
    }

    public void setItemAttribute(ItemAttribute itemAttribute) {
        this.itemAttribute = itemAttribute;
    }

    public Item itemAttribute(ItemAttribute itemAttribute) {
        this.setItemAttribute(itemAttribute);
        return this;
    }

    public ItemProperty getItemProperty() {
        return itemProperty;
    }

    public void setItemProperty(ItemProperty itemProperty) {
        this.itemProperty = itemProperty;
    }

    public Item itemProperty(ItemProperty itemProperty) {
        this.setItemProperty(itemProperty);
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
            ", group=" + group +
            ", itemAttribute=" + itemAttribute +
            '}';
    }
}
