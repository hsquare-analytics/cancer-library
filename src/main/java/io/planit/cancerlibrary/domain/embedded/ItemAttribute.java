package io.planit.cancerlibrary.domain.embedded;

import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
public class ItemAttribute implements Serializable {
    private String caption;

    private Boolean required;

    private String format;

    private String dataType;

    private Integer maxLength;

    private Boolean allowEditing;

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public ItemAttribute caption(String caption) {
        this.setCaption(caption);
        return this;
    }

    public Boolean isRequired() {
        return required;
    }

    public void setRequired(Boolean required) {
        this.required = required;
    }

    public ItemAttribute required(Boolean required) {
        this.setRequired(required);
        return this;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public ItemAttribute format(String format) {
        this.setFormat(format);
        return this;
    }

    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }

    public ItemAttribute dataType(String dataType) {
        this.setDataType(dataType);
        return this;
    }

    public Integer getMaxLength() {
        return maxLength;
    }

    public void setMaxLength(Integer maxLength) {
        this.maxLength = maxLength;
    }

    public ItemAttribute maxLength(Integer maxLength) {
        this.setMaxLength(maxLength);
        return this;
    }

    public Boolean isAllowEditing() {
        return allowEditing;
    }

    public void setAllowEditing(Boolean allowEditing) {
        this.allowEditing = allowEditing;
    }

    public ItemAttribute allowEditing(Boolean allowEditing) {
        this.setAllowEditing(allowEditing);
        return this;
    }
}
