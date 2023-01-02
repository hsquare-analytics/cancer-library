package io.planit.cancerlibrary.domain.embedded;

import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
public class CategoryAttribute implements Serializable {

    private String dateColumn;

    private String caption;

    private String autoincrementField;

    public String getDateColumn() {
        return dateColumn;
    }

    public void setDateColumn(String dateColumn) {
        this.dateColumn = dateColumn;
    }

    public CategoryAttribute dateColumn(String dateColumn) {
        this.setDateColumn(dateColumn);
        return this;
    }

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public CategoryAttribute caption(String caption) {
        this.setCaption(caption);
        return this;
    }

    public String getAutoincrementField() {
        return autoincrementField;
    }

    public void setAutoincrementField(String autoincrementField) {
        this.autoincrementField = autoincrementField;
    }

    public CategoryAttribute autoincrementField(String autoincrementField) {
        this.setAutoincrementField(autoincrementField);
        return this;
    }
}
