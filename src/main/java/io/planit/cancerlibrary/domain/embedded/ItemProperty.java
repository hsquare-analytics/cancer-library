package io.planit.cancerlibrary.domain.embedded;

import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
public class ItemProperty implements Serializable {

    private Integer sortIndex;

    private String sortDirection;

    private Boolean visible;

    private String labelColumn;

    private String cssClass;

    public Integer getSortIndex() {
        return sortIndex;
    }

    public void setSortIndex(Integer sortIndex) {
        this.sortIndex = sortIndex;
    }

    public ItemProperty sortIndex(Integer sortIndex) {
        this.setSortIndex(sortIndex);
        return this;
    }

    public String getSortDirection() {
        return sortDirection;
    }

    public void setSortDirection(String sortDirection) {
        this.sortDirection = sortDirection;
    }

    public ItemProperty sortDirection(String sortDirection) {
        this.setSortDirection(sortDirection);
        return this;
    }

    public Boolean isVisible() {
        return visible;
    }

    public void setVisible(Boolean visible) {
        this.visible = visible;
    }

    public ItemProperty visible(Boolean visible) {
        this.setVisible(visible);
        return this;
    }

    public String getLabelColumn() {
        return labelColumn;
    }

    public void setLabelColumn(String labelColumn) {
        this.labelColumn = labelColumn;
    }

    public ItemProperty labelColumn(String labelColumn) {
        this.setLabelColumn(labelColumn);
        return this;
    }

    public String getCssClass() {
        return cssClass;
    }

    public void setCssClass(String cssClass) {
        this.cssClass = cssClass;
    }

    public ItemProperty cssClass(String cssClass) {
        this.setCssClass(cssClass);
        return this;
    }
}
