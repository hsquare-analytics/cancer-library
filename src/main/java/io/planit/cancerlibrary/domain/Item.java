package io.planit.cancerlibrary.domain;

import io.planit.cancerlibrary.domain.embedded.ItemAttribute;
import java.io.Serializable;
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

    @NotNull
    @ManyToOne(optional = false)
    private Category category;

    @Embedded
    @AttributeOverride(name = "type", column = @Column(table = "ph_item_attribute"))
    private ItemAttribute itemAttribute;

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
        return this.title;
    }

    public Item title(String title) {
        this.setTitle(title);
        return this;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return this.description;
    }

    public Item description(String description) {
        this.setDescription(description);
        return this;
    }

    public void setDescription(String description) {
        this.description = description;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof Item)) {
            return false;
        }
        return id != null && id.equals(((Item) o).id);
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }

    @Override
    public String toString() {
        return "Item{" +
            "id=" + getId() +
            ", title='" + getTitle() + "'" +
            ", description='" + getDescription() + "'" +
            ", activated='" + getActivated() + "'" +
            "}";
    }
}
