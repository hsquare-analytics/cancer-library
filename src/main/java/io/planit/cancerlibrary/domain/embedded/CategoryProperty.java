package io.planit.cancerlibrary.domain.embedded;

import java.io.Serializable;
import javax.persistence.Embeddable;

@Embeddable
public class CategoryProperty implements Serializable {

    private String dateColumn;

    private String caption;

    public String getDateColumn() {
        return dateColumn;
    }

    public void setDateColumn(String dateColumn) {
        this.dateColumn = dateColumn;
    }

    public CategoryProperty dateColumn(String dateColumn) {
        this.setDateColumn(dateColumn);
        return this;
    }

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public CategoryProperty caption(String caption) {
        this.setCaption(caption);
        return this;
    }
}
