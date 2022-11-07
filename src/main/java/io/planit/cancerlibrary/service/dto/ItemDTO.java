package io.planit.cancerlibrary.service.dto;

import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.domain.Codebook;
import io.planit.cancerlibrary.domain.Item;
import io.planit.cancerlibrary.domain.embedded.ItemAttribute;
import io.planit.cancerlibrary.domain.embedded.ItemProperty;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class ItemDTO {

    private Long id;

    @NotNull
    @Size(max = 30)
    private String title;

    private String description;

    @NotNull
    private Boolean activated;

    private Integer orderNo;

    @NotNull
    private Category category;

    private Codebook codebook;

    private ItemAttribute attribute;

    private ItemProperty property;

    public ItemDTO() {
    }

    public ItemDTO(Item item) {
        this.id = item.getId();
        this.title = item.getTitle();
        this.description = item.getDescription();
        this.activated = item.getActivated();
        this.orderNo = item.getOrderNo();
        this.category = item.getCategory();
        this.codebook = item.getCodebook();
        this.attribute = item.getAttribute();
        this.property = item.getProperty();
    }

    public Item toEntity() {
        Item item = new Item();
        item.setId(this.id);
        item.setTitle(this.title);
        item.setDescription(this.description);
        item.setActivated(this.activated);
        item.setOrderNo(this.orderNo);
        item.setCategory(this.category);
        item.setCodebook(this.codebook);
        item.setAttribute(this.attribute);
        item.setProperty(this.property);
        return item;
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

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Codebook getCodebook() {
        return codebook;
    }

    public void setCodebook(Codebook codebook) {
        this.codebook = codebook;
    }

    public ItemAttribute getAttribute() {
        return attribute;
    }

    public void setAttribute(ItemAttribute attribute) {
        this.attribute = attribute;
    }

    public ItemProperty getProperty() {
        return property;
    }

    public void setProperty(ItemProperty property) {
        this.property = property;
    }
}
