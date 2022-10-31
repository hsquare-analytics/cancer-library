package io.planit.cancerlibrary.domain.embedded;

import javax.persistence.Embeddable;

@Embeddable
public class Lookup {
    private String title;
    private String description;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Lookup title(String title) {
        this.setTitle(title);
        return this;
    }
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Lookup description(String description) {
        this.setDescription(description);
        return this;
    }
}
