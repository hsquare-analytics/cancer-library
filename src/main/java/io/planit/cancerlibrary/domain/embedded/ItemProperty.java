package io.planit.cancerlibrary.domain.embedded;

import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
public class ItemProperty implements Serializable {

    private Integer visibleIndex;

    private String caption;

    private Boolean allowEditing;

    private Boolean required;

    public Integer getVisibleIndex() {
        return visibleIndex;
    }

    public void setVisibleIndex(Integer visibleIndex) {
        this.visibleIndex = visibleIndex;
    }

    public ItemProperty visibleIndex(Integer visibleIndex) {
        this.setVisibleIndex(visibleIndex);
        return this;
    }

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public ItemProperty caption(String caption) {
        this.setCaption(caption);
        return this;
    }

    public Boolean isAllowEditing() {
        return allowEditing;
    }

    public void setAllowEditing(Boolean allowEditing) {
        this.allowEditing = allowEditing;
    }

    public ItemProperty allowEditing(Boolean allowEditing) {
        this.setAllowEditing(allowEditing);
        return this;
    }

    public Boolean isRequired() {
        return required;
    }

    public void setRequired(Boolean required) {
        this.required = required;
    }

    public ItemProperty required(Boolean required) {
        this.setRequired(required);
        return this;
    }
}
